create or replace type  C_Nodala_TYPE as object ( 
    ID Number(4),
    Nod_KODS Number(4),
    NODALA VARCHAR2(100),
    ORGAN_KODS Number(9),
    PILSETA VARCHAR2(50),
    RAJONS VARCHAR2(50));

create or replace type  C_Persona_TYPE as object ( 
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

create or replace type  C_Personas as table of   C_Persona_TYPE; 


create or replace type C_SISTEMA_TYPE as object(
    Nodala          C_Nodala_TYPE,
    Personas        C_Personas);

    
create table C_SISTEMA of  C_SISTEMA_TYPE 
    nested table Personas store as C_IEK_TAB;
    
    
 --Nodalu ierakst��ana tabul�
DECLARE
    cursor NODALAS_KUR is
        SELECT A.ID,A.NOD_KODS,A.NODALA,A.ORGAN_KODS,A.PILSETA,A.RAJONS
        FROM NodalaS A;
BEGIN    
    FOR ID in NODALAS_KUR
    LOOP   
        INSERT INTO C_SISTEMA values( 
            C_Nodala_TYPE(ID.ID,ID.NOD_KODS,ID.NODALA,ID.ORGAN_KODS,ID.PILSETA,ID.RAJONS),
            C_Personas(C_Persona_TYPE(0,Null,Null,Null,NULL,Null,Null,Null,NUll,Null)));
    END LOOP;
END;
--Nodalu ierakst��ana tabul� beigas


--Personu ierakst��ana tabul�
DECLARE
    cursor Personas_KUR is
        SELECT A.ID,A.NUM,A.VALSTS,A.DZIM_DAT,A.Kategorija,A.VARDS,A.UZVARDS,A.TIPS,A.DZIMTE,A.NODALAS_KODS
        FROM Personas A
        where rownum <= 100000;
    BEGIN    
        FOR ID in Personas_KUR
        LOOP   
                insert into TABLE(
                select A.PERSONAS
                    from  C_SISTEMA A
                    where A.NODALA.Nod_KODS = ID.NODALAS_KODS)
                    values (C_Persona_TYPE(ID.ID,ID.NUM,ID.VALSTS,ID.DZIM_DAT,ID.Kategorija,ID.VARDS,ID.UZVARDS,ID.TIPS,ID.DZIMTE,ID.NODALAS_KODS));
        END LOOP;
END;

Select value(A).NODALA.NODALA, value(c).vards, value(c). uzvards
from C_SISTEMA A, Table(A.Personas) c;

select * from c_sistema;

select Value(a)
from c_sistema a;
--Personu ierakst��ana tabul� beigas  
