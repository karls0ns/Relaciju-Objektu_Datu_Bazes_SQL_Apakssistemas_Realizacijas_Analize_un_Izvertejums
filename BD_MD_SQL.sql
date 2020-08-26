

--BEZ METODES
Select A.VARDS, 2018 - SUBSTR(A.DZIM_DAT, -4, 4) AS VECUMS, A.Nodala
    from MD_SKATS A
    where A.Nodala = 'Rîgas pilsçtas  Zemgales  filiâle';  

--AR METODI  
Select A.VARDS, A.Vecums() AS VECUMS, A.Nodala
    from MD_SKATS A
    where A.NODALA = 'Rîgas pilsçtas  Zemgales  filiâle';   