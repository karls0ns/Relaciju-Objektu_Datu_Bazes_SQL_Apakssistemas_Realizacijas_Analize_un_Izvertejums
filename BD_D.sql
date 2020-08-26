create or replace type  D_Nodala_TYPE as object ( 
    ID Number(4),
    Nod_KODS Number(4),
    NODALA VARCHAR2(100),
    ORGAN_KODS Number(9),
    PILSETA VARCHAR2(50),
    RAJONS VARCHAR2(50));

create table D_Nodala of D_Nodala_TYPE;

INSERT INTO D_Nodala
    SELECT * FROM Nodalas;

create or replace type  D_Persona_TYPE as object ( 
    ID_1 Number(9),
    NUM Varchar2(9),
    VALSTS Varchar2(3),
    DZIM_DAT VARCHAR2(10),
    Kategorija VARCHAR2(3),
    VARDS VARCHAR2(40),
    UZVARDS VARCHAR2(40),
    TIPS VARCHAR2(1),
    DZIMTE VARCHAR2(1),
    NODALAS_KODS NUMBER(4));

create table  D_Personas   of   D_Persona_TYPE; 

INSERT INTO D_Personas
    SELECT * FROM PERSONAS
    where rownum <= 100000;

 
select column_name, DATA_TYPE 
from USER_TAB_COLUMNS
where table_NAME='D_NODALA' or table_NAME='D_PERSONAS' ; 

create or replace type  D_SKATS_TYPE as object (  
    ID Number(4),
    Nod_KODS Number(4),
    NODALA VARCHAR2(100),
    ORGAN_KODS Number(9),
    PILSETA VARCHAR2(50),
    RAJONS VARCHAR2(50),
    ID_1 Number(9),
    NUM Varchar2(9),
    VALSTS Varchar2(3),
    DZIM_DAT VARCHAR2(10),
    Kategorija VARCHAR2(3),
    VARDS VARCHAR2(40),
    UZVARDS VARCHAR2(40),
    TIPS VARCHAR2(1),
    DZIMTE VARCHAR2(1),
    NODALAS_KODS NUMBER(4));

CREATE VIEW D_SKATS OF D_SKATS_TYPE
WITH OBJECT OID(ID) AS
(
SELECT A.ID, A.NOD_KODS, A.Nodala, A.ORGAN_KODS, A.Pilseta, A.Rajons,
        B.ID_1, B.NUM, B.VALSTS, B.DZIM_DAT, B.KATEGORIJA, B.VARDS, B.UZVARDS, B.TIPS, B.DZIMTE, B.NODALAS_KODS
FROM D_NODALA A INNER JOIN D_PERSONAS B ON A.NOD_KODS = B.NODALAS_KODS
)
;

select * from d_skats a;