-- NOTEIKT VARDU un VECUMU VISIEM nodala ar kodu 6 re�istrtaj�m person�m

--BEZ METODES 
Select B.VARDS, 2018 - SUBSTR(B.DZIM_DAT, -4, 4) AS VECUMS, A.Nodala.Nodala
    from MB_SISTEMA A, Table(A.Personas) B
    where A.NODALA.NODALA = 'R�gas pils�tas  Zemgales  fili�le';  
--AR METODI 
Select B.VARDS, B.Vecums() AS VECUMS, A.Nodala.Nodala
    from MB_SISTEMA A, Table(A.Personas) B
    where A.NODALA.Nodala = 'R�gas pils�tas  Zemgales  fili�le';   