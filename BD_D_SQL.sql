-- Atrast to sievieðu skaitu, kuras ir reìistrçtas Rçzeknes nodaïâ
Select COUNT (A.VARDS) as skaits
    from D_SKATS A
    where A.Nodala = 'Rçzeknes  filiâle' and A.dzimte = 'S';

-- Atrast visus datus par liepâjas nodaïâ reìistºetiem vienâ vârdâ nosauktiem cilvçkiem
select *
    from D_SKATS A
    where A.Vards = upper('jânis') and A.Nodala = 'Liepâjas  filiâle';

--Atrast katrâ nodaïâ reìistrçto vîrieðu skaitu, kurâ ir reìistrçti vismaz 3 vîrieði
SELECT COUNT(A.Vards) as skaits, A.NODALA as nodala
    FROM D_SKATS A
   -- WHERE A.DZIMTE = 'V'
    GROUP BY A.NODALAS_KODS, A.NODALA
    HAVING COUNT(a.Vards) > 2
    ORDER BY (SKAITS) ASC;