-- NOTEIKT VARDU un VECUMU VISIEM nodala ar kodu 6 reìistrtajâm personâm

--BEZ METODES
Select C.MA_PERSONA.VARDS, 2018 - SUBSTR(C.MA_PERSONA.DZIM_DAT, -4, 4) AS VECUMS, B.Nodala
            from MA_NODALA B, TABLE
            (select DEREF(a.NOD_ATSAUCE).MA_ELEM_ATSAUCES b
                from MA_Nodala a
                where a.NODALA = 'Rîgas pilsçtas  Zemgales  filiâle') c
            where B.NOD_KODS = c.MA_PERSONA.NODALAS_KODS;        
--AR METODI   
Select C.MA_PERSONA.VARDS, C.MA_PERSONA.Vecums() as Vecums, B.Nodala
            from MA_NODALA B, TABLE
            (select DEREF(a.NOD_ATSAUCE).MA_ELEM_ATSAUCES b
                from MA_Nodala a
                where a.NODALA = 'Rîgas pilsçtas  Zemgales  filiâle') c
            where B.NOD_KODS = c.MA_PERSONA.NODALAS_KODS;      