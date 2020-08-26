-- Atrast to sievieðu skaitu, kuras ir reìistrçtas Rçzeknes nodaïâ
Select COUNT (A.VARDS) as skaits
    from P_Personas A, NODALAS B
    where B.Nodala = 'Rçzeknes  filiâle' and A.dzimte = 'S' and A.NODALAS_KODS = B.NOD_KODS;


-- Atrast visus datus par liepâjas nodaïâ reìistºetiem vienâ vârdâ nosauktiem cilvçkiem
select *
    from P_Personas A, NODALAS B
    where A.NODALAS_KODS = B.NOD_KODS and B.Nodala = 'Liepâjas  filiâle' and A.Vards = upper('jânis');


--Atrast katrâ nodaïâ reìistrçto vîrieðu skaitu, kurâ ir reìistrçti vismaz 3 vîrieði
SELECT COUNT(a.Vards) as skaits, b.NODALA as nodala
    FROM P_Personas A, NODALAS b
    WHERE A.NODALAS_KODS = b.NOD_KODS and A.DZIMTE = 'V'
    GROUP BY A.NODALAS_KODS, b.NODALA
    HAVING COUNT(a.Vards) > 2
    ORDER BY COUNT(a.Vards) ASC;