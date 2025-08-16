-- Lista
-- [el1, el2, ...]
-- Istog tipa
-- (:) :: a -> [a] -> [a]

-- : dodaje element na pocetak liste
-- [1, 2, 3] = 1 : (2 : (3 : []))

-- ++ sabira dve liste
-- [1, 2, 3] + [4, 5, 6] = [5, 7, 9]

-- !! vraca elemnt na indeksu
-- [12, 123, -34, 1234] !! 2  daje -34

-- "test" == ['t', 'e', 's', 't']

-- lambda fje
-- \arg1 arg2 etc -> telo

-- [1..10] == [1,2,3,4,5,6,7,8,9,10]
-- [1,3..10] == [1,3,5,7,9]
-- [10,8,..0] == [10,8,6,4,2,0]
-- [10..0] == []

-- iteriranje
-- [elem | elem <- list]

-- head vraca prvi element
-- tail vraca sve osim prvog elementa
-- take n uzima prvih n elemenata
-- drop n odbacuje prvih n elemenata
-- length vraca duzinu liste (ili bilo cega sto je iterable)
-- null vraca true/false u zavinosti da li je lista prazna
-- elem a list vraca da li je element a u list
