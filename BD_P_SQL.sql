-- Atrast to sievie�u skaitu, kuras ir re�istr�tas R�zeknes noda��
Select COUNT (A.VARDS) as skaits
    from P_Personas A, NODALAS B
    where B.Nodala = 'R�zeknes  fili�le' and A.dzimte = 'S' and A.NODALAS_KODS = B.NOD_KODS;


-- Atrast visus datus par liep�jas noda�� re�ist�etiem vien� v�rd� nosauktiem cilv�kiem
select *
    from P_Personas A, NODALAS B
    where A.NODALAS_KODS = B.NOD_KODS and B.Nodala = 'Liep�jas  fili�le' and A.Vards = upper('j�nis');


--Atrast katr� noda�� re�istr�to v�rie�u skaitu, kur� ir re�istr�ti vismaz 3 v�rie�i
SELECT COUNT(a.Vards) as skaits, b.NODALA as nodala
    FROM P_Personas A, NODALAS b
    WHERE A.NODALAS_KODS = b.NOD_KODS and A.DZIMTE = 'V'
    GROUP BY A.NODALAS_KODS, b.NODALA
    HAVING COUNT(a.Vards) > 2
    ORDER BY COUNT(a.Vards) ASC;