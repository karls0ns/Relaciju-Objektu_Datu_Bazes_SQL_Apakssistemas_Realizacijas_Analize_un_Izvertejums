create or replace type  MD_Nodala_TYPE as object ( 
    ID Number(4),
    Nod_KODS Number(4),
    NODALA VARCHAR2(100),
    ORGAN_KODS Number(9),
    PILSETA VARCHAR2(50),
    RAJONS VARCHAR2(50));

create table MD_Nodala of MD_Nodala_TYPE;

INSERT INTO MD_Nodala
    SELECT * FROM Nodalas;

create or replace type MD_Persona_TYPE as object ( 
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

create table  MD_Personas   of   MD_Persona_TYPE; 

INSERT INTO MD_Personas
    SELECT * FROM MP_PERSONAS;


create or replace type  MD_SKATS_TYPE as object (  
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
    NODALAS_KODS NUMBER(4),
    MEMBER function Vecums return number);
    
create or replace type body MD_SKATS_TYPE as
MEMBER function Vecums return number is
begin
    return (2018 - SUBSTR(SELF.DZIM_DAT, -4, 4));
end Vecums;
end;


CREATE VIEW MD_SKATS OF MD_SKATS_TYPE
WITH OBJECT OID(ID) AS
(
SELECT A.ID, A.NOD_KODS, A.Nodala, A.ORGAN_KODS, A.Pilseta, A.Rajons,
        B.ID_1, B.NUM, B.VALSTS, B.DZIM_DAT, B.KATEGORIJA, B.VARDS, B.UZVARDS, B.TIPS, B.DZIMTE, B.NODALAS_KODS
FROM MD_NODALA A INNER JOIN MD_PERSONAS B ON A.NOD_KODS = B.NODALAS_KODS
)
;

select * from Md_skats a;