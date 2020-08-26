-- NOTEIKT VARDU un VECUMU VISIEM nodala ar kodu 6 reìistrtajâm personâm
--Bez metodes
Select A.VARDS, 2018 - SUBSTR(A.DZIM_DAT, -4, 4) AS VECUMS, B.NODALA
    from MP_Personas A, NODALAS B
    where B.NODALA = 'Rîgas pilsçtas  Zemgales  filiâle' and A.NODALAS_KODS = B.NOD_KODS;

    