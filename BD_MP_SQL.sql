-- NOTEIKT VARDU un VECUMU VISIEM nodala ar kodu 6 re�istrtaj�m person�m
--Bez metodes
Select A.VARDS, 2018 - SUBSTR(A.DZIM_DAT, -4, 4) AS VECUMS, B.NODALA
    from MP_Personas A, NODALAS B
    where B.NODALA = 'R�gas pils�tas  Zemgales  fili�le' and A.NODALAS_KODS = B.NOD_KODS;

    