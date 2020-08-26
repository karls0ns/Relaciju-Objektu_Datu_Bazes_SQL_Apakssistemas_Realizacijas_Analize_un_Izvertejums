select Value(a) from TAB_Nodala_T a;

select *
from TAB_ATSAUCES_T a, TABLE(a.ELEM_ATSAUCES_T) b;

select Value(c).A_NUM, Value(c).A_PERSONA_T
from TABLE
(select DEREF(a.NOD_ATSAUCE).ELEM_ATSAUCES_T b
from TAB_NODALA_T a
where a.NOD_KODS=3) c;

select Value(c).A_NUM, Value(c).A_PERSONA_T.VARDS
from TABLE
(select DEREF(a.NOD_ATSAUCE).ELEM_ATSAUCES_T b
from TAB_NODALA_T a
where a.NOD_KODS=2) c;

select * from TAB_NODALA_T;

select * from Personas_T;

select * from TAB_ATSAUCES_T;

select REF(a) from PERSONAS_T a; 

select Value(b).A_Persona_T
from TAB_ATSAUCES_T a, TABLE(a.ELEM_ATSAUCES_T) b;

select b.A_NUM,b.A_PERSONA_T
from TAB_ATSAUCES_T a, TABLE(a.ELEM_ATSAUCES_T) b
where b.A_NUM = 11;

Select Value(A) from
A_Personas A;


Select DISTINCT Nodalas_KODS
FROM PERSONAS
ORDER BY Nodalas_KODS ASC;