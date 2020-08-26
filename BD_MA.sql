create or replace type  MA_Persona_TYPE as object ( 
    ID Number(9),
    NUM Varchar2(9),
    VALSTS Varchar2(3),
    DZIM_DAT VARCHAR2(10),
    Kategorija VARCHAR2(3),
    VARDS VARCHAR2(40),
    UZVARDS VARCHAR2(40),
    TIPS VARCHAR2(1),
    DZIMTE VARCHAR2(1),
    NODALAS_KODS NUMBER(4), 
    MEMBER function Vecums return number);
    
create or replace type body MA_persona_TYPE as
MEMBER function Vecums return number is
begin
    return (2018 - SUBSTR(SELF.DZIM_DAT, -4, 4));
end Vecums;
end;

create table  MA_Personas   of   MA_Persona_TYPE; 

INSERT INTO MA_Personas
    SELECT * FROM MP_PERSONAS;

create or replace type  MA_Atsauce   as object(  
    MA_NUM          	number,                                                             
    MA_PERSONA  	REF  MA_Persona_TYPE);

create or replace type  MA_Atsauces  as table of   MA_Atsauce;                                       

create or replace type MA_E_atsauces as object(
    MA_ELEM_ATSAUCES		MA_Atsauces);

create table MA_TAB_ATSAUCES of  MA_E_atsauces
    nested table MA_ELEM_ATSAUCES store as MA_IEK_TAB;


create or replace type  MA_Nodala_TYPE as object ( 
    ID Number(4),
    Nod_KODS Number(4),
    NODALA VARCHAR2(100),
    ORGAN_KODS Number(9),
    PILSETA VARCHAR2(50),
    RAJONS VARCHAR2(50),
    NOD_ATSAUCE REF MA_E_atsauces);

create table MA_Nodala of MA_Nodala_TYPE;

INSERT INTO MA_Nodala
    (ID,Nod_KODS,NODALA,ORGAN_KODS,PILSETA,RAJONS)
    SELECT ID,Nod_KODS,NODALA,ORGAN_KODS,PILSETA,RAJONS FROM NODALAS;

--Referenèu uz Nodaïu tabulu izveidoðana
DECLARE
    Nid         Number NOT NULL:= 1;
    NKODS       Number NOT NULL:= -1;
    NKODSs      Number NOT NULL:= -1;
    ats_1		REF MA_E_atsauces;
    cursor NODALAS_KUR is
        SELECT A.ID
        FROM MA_Nodala A;
BEGIN
    :Nid := 1;    
    FOR ID in NODALAS_KUR
    LOOP   
        SELECT A.NOD_KODS into :NKODSs
            FROM MA_Nodala A
            WHERE A.ID =:nid;        
        :Nkods := :NKODSs+100;
        insert into MA_TAB_ATSAUCES values (MA_E_atsauces(MA_Atsauces(MA_Atsauce(:NKODS, NULL))));        
        select REF(a) into ats_1
            from MA_TAB_ATSAUCES a, TABLE(a.MA_ELEM_ATSAUCES) b
            where b.MA_NUM = :NKODS;
            update MA_Nodala a set a.NOD_ATSAUCE = ats_1
            WHERE  a.Nod_KODS = :NKODSs;            
        :Nid := :Nid + 1;
   END LOOP;
END;
--Referenèu uz Nodaïu tabulu izveidoðana BEIGAS

--Referenèu uz Personu tabulu izveidoðana
DECLARE
    NPKODSs      Number NOT NULL:= -1;
    NPKODS      Number NOT NULL:= -1;    
    NPKODS1      Number NOT NULL:= -1;
    Patrasts    NUMBER NOT NULL:= -1;    
    NPKODSstr    varchar2(10) := 'AA';    
    ats_1       REF  MA_Persona_TYPE;    
    cursor PERSONAS_KUR is
        SELECT A.ID
        FROM MA_Personas A;
BEGIN
    FOR ID in PERSONAS_KUR
    LOOP
        SELECT A.NODALAS_KODS into :NPKODSs
            FROM MA_Personas A
            WHERE A.ID = ID.ID;            
        :NPKODS := :NPKODSs+100;
        :NPKODSstr:= to_char(:NPKODS);
        :NPKODSstr:= SUBSTR(:NPKODSstr, -2, 2);               
        Select Count (*) into :Patrasts
            from( 
                Select REF(a) 
                    from MA_TAB_ATSAUCES a, TABLE(a.MA_ELEM_ATSAUCES) b
                    where b.MA_NUM like '%'||:NPKODSstr              
                );     
        IF :Patrasts = 1 then              
            select REF(a) into ats_1
                from MA_Personas a
                where a.NUM = ID.ID;
                update  TABLE(select  a.MA_ELEM_ATSAUCES from MA_TAB_ATSAUCES a, TABLE(a.MA_ELEM_ATSAUCES) b
                WHERE  b.MA_NUM = :NPKODS) c
                set c.MA_PERSONA = ats_1
                where c.MA_NUM= :NPKODS;                     
            :NPKODS1 := :NPKODS + 100;              
            insert into TABLE(
                select a.MA_ELEM_ATSAUCES
                    from  MA_TAB_ATSAUCES a, TABLE(a.MA_ELEM_ATSAUCES) b
                    where  b.MA_NUM = :NPKODS)
                    values (MA_Atsauce(:NPKODS1, NULL));                              
        ELSE        
            :NPKODS1 := :NPKODS + 100*:Patrasts-100;                
            select REF(a) into ats_1
                from MA_Personas a
                where a.NUM = ID.ID;
                update  TABLE(select  a.MA_ELEM_ATSAUCES from MA_TAB_ATSAUCES a, TABLE(a.MA_ELEM_ATSAUCES) b
                WHERE  b.MA_NUM = :NPKODS1) c
                set c.MA_PERSONA = ats_1
                where c.MA_NUM= :NPKODS1;       
            :NPKODS1 := :NPKODS1 + 100;               
            insert into TABLE(
                select a.MA_ELEM_ATSAUCES
                    from  MA_TAB_ATSAUCES a, TABLE(a.MA_ELEM_ATSAUCES) b
                    where  b.MA_NUM = :NPKODS)
                    values (MA_Atsauce(:NPKODS1, NULL));                              
        END IF; 
    END LOOP;
END;
--Referenèu uz Personu tabulu izveidoðana BEIGAS

--TESTS SASAISTEI
select Value(c).MA_NUM, Value(c).MA_PERSONA.VARDS, Value(c).MA_PERSONA.NODALAS_KODS
    from TABLE
        (select DEREF(a.NOD_ATSAUCE).MA_ELEM_ATSAUCES b
            from MA_Nodala a
            where a.NOD_KODS = 31) c;