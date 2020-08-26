-- Atrast to sievieðu skaitu, kuras ir reìistrçtas Rçzeknes nodaïâ
select COUNT(c.A_PERSONA.VARDS) as skaits 
        from TABLE
            (select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES b
                from A_Nodala a
                where a.Nodala = 'Rçzeknes  filiâle' ) c
        where c.A_PERSONA.dzimte = 'S';

-- Atrast visus datus par liepâjas nodaïâ reìistºetiem vienâ vârdâ nosauktiem cilvçkiem
select Value(a).ID as ID, VALUE(a).Nod_KODS as Nod_KODS, Value(a).Nodala as Nodala, VALUE(a).ORGAN_KODS as ORGAN_KODS, 
        value(a).PILSETA as PILSETA ,Value(a).Rajons as Rajons,
        Value(c).A_PERSONA.ID as ID, Value(c).A_PERSONA.NUM as NUM, Value(c).A_PERSONA.VALSTS as VALSTS,
        Value(c).A_PERSONA.DZIM_DAT as DZIM_DAT, Value(c).A_PERSONA.KATEGORIJA as KATEGORIJA, Value(c).A_PERSONA.VARDS as VARDS, 
        Value(c).A_PERSONA.UZVARDS as UZVARDS, Value(c).A_PERSONA.TIPS as TIPS, Value(c).A_PERSONA.DZIMTE as DZIMTE, 
        Value(c).A_PERSONA.Nodalas_KODS as NODALAS_KODS
    from A_NODALA a, TABLE
            (select DEREF(b.NOD_ATSAUCE).A_ELEM_ATSAUCES 
                from A_Nodala b
                where b.NODALA = 'Liepâjas  filiâle') c
        where a.NOD_KODS = c.A_PERSONA.NODALAS_KODS and c.A_PERSONA.VARDS = upper('jânis');

--Atrast katrâ nodaïâ reìistrçto vîrieðu skaitu, kurâ ir reìistrçti vismaz 3 vîrieði
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table (select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 2) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION           
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table (select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 3) c
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2        
    UNION        
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 4) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2        
    UNION        
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 5) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2        
    UNION   
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 6) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION    
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 7) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2        
    UNION    
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 8) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2        
    UNION         
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 10) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2       
    UNION                     
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 13) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION    
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 14) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION    
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 15) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION    
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 16) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION    
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 17) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 18) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION        
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 19) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 20) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION        
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 21) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION        
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 22) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 23) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 24) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 25) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B,table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 26) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 27) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B,table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 28) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 29) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 30) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 31) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 32) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 33) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 35) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 36) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 37) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 38) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 39) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 40) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 41) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 42) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    UNION
select Count(c.A_PERSONA.VARDS) as skaits, B.nodala as nodala 
        from A_NODALA B, table(select DEREF(a.NOD_ATSAUCE).A_ELEM_ATSAUCES from A_Nodala a where A.Nod_KODS = 99) c            
        WHERE C.A_PERSONA.DZIMTE = 'V' and C.A_PERSONA.NODALAS_KODS = b.NOD_KODS      
        GROUP BY B.NODALA
        HAVING COUNT(C.A_PERSONA.VARDS) > 2
    ORDER BY (Nodala) ASC;