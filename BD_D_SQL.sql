-- Atrast to sievie�u skaitu, kuras ir re�istr�tas R�zeknes noda��
Select COUNT (A.VARDS) as skaits
    from D_SKATS A
    where A.Nodala = 'R�zeknes  fili�le' and A.dzimte = 'S';

-- Atrast visus datus par liep�jas noda�� re�ist�etiem vien� v�rd� nosauktiem cilv�kiem
select *
    from D_SKATS A
    where A.Vards = upper('j�nis') and A.Nodala = 'Liep�jas  fili�le';

--Atrast katr� noda�� re�istr�to v�rie�u skaitu, kur� ir re�istr�ti vismaz 3 v�rie�i
SELECT COUNT(A.Vards) as skaits, A.NODALA as nodala
    FROM D_SKATS A
   -- WHERE A.DZIMTE = 'V'
    GROUP BY A.NODALAS_KODS, A.NODALA
    HAVING COUNT(a.Vards) > 2
    ORDER BY (SKAITS) ASC;