-- NOTEIKT VARDU un VECUMU VISIEM nodala ar kodu 6 reìistrtajâm personâm

--BEZ METODES 
Select B.VARDS, 2018 - SUBSTR(B.DZIM_DAT, -4, 4) AS VECUMS, A.Nodala.Nodala
    from MB_SISTEMA A, Table(A.Personas) B
    where A.NODALA.NODALA = 'Rîgas pilsçtas  Zemgales  filiâle';  
--AR METODI 
Select B.VARDS, B.Vecums() AS VECUMS, A.Nodala.Nodala
    from MB_SISTEMA A, Table(A.Personas) B
    where A.NODALA.Nodala = 'Rîgas pilsçtas  Zemgales  filiâle';   