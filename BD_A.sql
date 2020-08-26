create or replace type  A_Persona_TYPE as object ( 
    ID Number(9),
    NUM Varchar2(9),
    VALSTS Varchar2(3),
    DZIM_DAT VARCHAR2(10),
    Kategorija VARCHAR2(3),
    VARDS VARCHAR2(40),
    UZVARDS VARCHAR2(40),
    TIPS VARCHAR2(1),
    DZIMTE VARCHAR2(1),
    NODALAS_KODS NUMBER(4));

create table  A_Personas   of   A_Persona_TYPE; 

INSERT INTO A_Personas
    SELECT * FROM PERSONAS
    where rownum <= 100000;

create or replace type  A_Atsauce   as object(  
    A_NUM          	number,                                                             
    A_PERSONA  	REF  A_Persona_TYPE);

create or replace type  A_Atsauces  as table of   A_Atsauce;                                       

create or replace type A_E_atsauces as object(
    A_ELEM_ATSAUCES		A_Atsauces);

create table A_TAB_ATSAUCES of  A_E_atsauces
    nested table A_ELEM_ATSAUCES store as A_IEK_TAB;


create or replace type  A_Nodala_TYPE as object ( 
    ID Number(4),
    Nod_KODS Number(4),
    NODALA VARCHAR2(100),
    ORGAN_KODS Number(9),
    PILSETA VARCHAR2(50),
    RAJONS VARCHAR2(50),
    NOD_ATSAUCE REF A_E_atsauces);

create table A_Nodala of A_Nodala_TYPE;

INSERT INTO A_Nodala
    (ID,Nod_KODS,NODALA,ORGAN_KODS,PILSETA,RAJONS)
    SELECT ID,Nod_KODS,NODALA,ORGAN_KODS,PILSETA,RAJONS FROM NODALAS;

--Referenèu uz Nodaïu tabulu izveidoðana
DECLARE
    Nid         Number NOT NULL:= 1;
    NKODS       Number NOT NULL:= -1;
    NKODSs      Number NOT NULL:= -1;
    ats_1		REF A_E_atsauces;
    cursor NODALAS_KUR is
        SELECT A.ID
        FROM A_Nodala A;
BEGIN
    :Nid := 1;    
    FOR ID in NODALAS_KUR
    LOOP   
        SELECT A.NOD_KODS into :NKODSs
            FROM A_Nodala A
            WHERE A.ID =:nid;        
        :Nkods := :NKODSs+100;
        insert into A_TAB_ATSAUCES values (A_E_atsauces(A_Atsauces(A_Atsauce(:NKODS, NULL))));        
        select REF(a) into ats_1
            from A_TAB_ATSAUCES a, TABLE(a.A_ELEM_ATSAUCES) b
            where b.A_NUM = :NKODS;
            update A_Nodala a set a.NOD_ATSAUCE = ats_1
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
    ats_1       REF  A_Persona_TYPE;    
    cursor PERSONAS_KUR is
        SELECT A.ID
        FROM A_Personas A;
BEGIN
    FOR ID in PERSONAS_KUR
    LOOP
        SELECT A.NODALAS_KODS into :NPKODSs
            FROM A_Personas A
            WHERE A.ID = ID.ID;            
        :NPKODS := :NPKODSs+100;
        :NPKODSstr:= to_char(:NPKODS);
        :NPKODSstr:= SUBSTR(:NPKODSstr, -2, 2);               
        Select Count (*) into :Patrasts
            from( 
                Select REF(a) 
                    from A_TAB_ATSAUCES a, TABLE(a.A_ELEM_ATSAUCES) b
                    where b.A_NUM like '%'||:NPKODSstr              
                );     
        IF :Patrasts = 1 then              
            select REF(a) into ats_1
                from A_Personas a
                where a.NUM = ID.ID;
                update  TABLE(select  a.A_ELEM_ATSAUCES from A_TAB_ATSAUCES a, TABLE(a.A_ELEM_ATSAUCES) b
                WHERE  b.A_NUM = :NPKODS) c
                set c.A_PERSONA = ats_1
                where c.A_NUM= :NPKODS;                     
            :NPKODS1 := :NPKODS + 100;              
            insert into TABLE(
                select a.A_ELEM_ATSAUCES
                    from  A_TAB_ATSAUCES a, TABLE(a.A_ELEM_ATSAUCES) b
                    where  b.A_NUM = :NPKODS)
                    values (A_Atsauce(:NPKODS1, NULL));                              
        ELSE        
            :NPKODS1 := :NPKODS + 100*:Patrasts-100;                
            select REF(a) into ats_1
                from A_Personas a
                where a.NUM = ID.ID;
                update  TABLE(select  a.A_ELEM_ATSAUCES from A_TAB_ATSAUCES a, TABLE(a.A_ELEM_ATSAUCES) b
                WHERE  b.A_NUM = :NPKODS1) c
                set c.A_PERSONA = ats_1
                where c.A_NUM= :NPKODS1;       
            :NPKODS1 := :NPKODS1 + 100;               
            insert into TABLE(
                select a.A_ELEM_ATSAUCES
                    from  A_TAB_ATSAUCES a, TABLE(a.A_ELEM_ATSAUCES) b
                    where  b.A_NUM = :NPKODS)
                    values (A_Atsauce(:NPKODS1, NULL));                              
        END IF; 
    END LOOP;
END;
--Referenèu uz Personu tabulu izveidoðana BEIGAS

--TESTS SASAISTEI
select Value(c).A_NUM, Value(c).A_PERSONA.VARDS, Value(c).A_PERSONA.NODALAS_KODS
    from TABLE
        (select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES b
            from A_Nodala a
            where a.NOD_KODS = 31) c;

-- ieveito references
--insert into TABLE(
--        select a.A_ELEM_ATSAUCES
--        from  A_TAB_ATSAUCES a, TABLE(a.A_ELEM_ATSAUCES) b
--        where  b.A_NUM = 38)
--        values (A_Atsauce(28, NULL));