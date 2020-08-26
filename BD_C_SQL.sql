-- Atrast to sievie�u skaitu, kuras ir re�istr�tas R�zeknes noda��
Select COUNT (B.VARDS) as skaits
    from C_Sistema A, Table(A.Personas) B
    where A.Nodala.NODALA = 'R�zeknes  fili�le' and B.dzimte = 'S' ;

-- Atrast visus datus par liep�jas noda�� re�ist�etiem vien� v�rd� nosauktiem cilv�kiem
select A.NODALA.ID as ID,A.NODALA.Nod_KODS as Nod_KODS, A.NODALA.Nodala as Nodala, A.NODALA.ORGAN_KODS as ORGAN_KODS, 
        A.NODALA.PILSETA as PILSETA ,A.NODALA.Rajons as Rajons,
        Value(B).ID as ID, Value(B).NUM as NUM, Value(B).VALSTS as VALSTS, Value(B).DZIM_DAT as DZIM_DAT, 
        Value(B).KATEGORIJA as KATEGORIJA, Value(B).VARDS as VARDS, Value(B).UZVARDS as UZVARDS, 
        Value(B).TIPS as TIPS, Value(B).DZIMTE as DZIMTE, Value(B).Nodalas_KODS as NODALAS_KODS
    from C_SISTEMA A, Table(A.personas) B
    where B.Vards = upper('j�nis') and A.Nodala.Nodala ='Liep�jas  fili�le' ;

--Atrast katr� noda�� re�istr�to v�rie�u skaitu, kur� ir re�istr�ti vismaz 3 v�rie�i 
SELECT COUNT(B.Vards) as skaits, A.NODALA.NODALA as nodala
    FROM C_SISTEMA A, Table(A.PERSONAS) B
    WHERE B.DZIMTE = 'V'
    GROUP BY A.NODALA.NOD_KODS, A.NODALA.NODALA
    HAVING COUNT(B.Vards) > 2
    ORDER BY (A.NODALA.NODALA) ASC;