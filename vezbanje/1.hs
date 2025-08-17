-- Zadatak 5.2 Napisati funkciju duplo n koja računa dvostruku vrednost celog broja n.

duplo :: Int -> Int
duplo n = 2*n

duplo' :: Int -> Int
duplo' = (*2)

-- Zadatak 5.3 Napisati funkciju ostatak3 n koja računa ostatak pri deljenju broja n brojem

ostatak3 :: Int -> Int
ostatak3 n = mod n 3

ostatak3' n = n `mod` 3

-- Zadatak 5.4 Napisati funkciju korenCeli n koja računa realni koren celog broja n korišćenjem
-- ugrađene funkcije sqrt.

korenCeli :: Int -> Double
korenCeli n = sqrt(fromIntegral n)

-- Zadatak 5.5 Napisati funkciju sumaPrvih n koja računa sumu prvih n prirodnih brojeva
-- (rekurzivno, bez korišćenja formule).

sumaPrvih :: Int -> Int
sumaPrvih n = 
            if n == 0 then 0 
            else n + sumaPrvih(n-1)

sumaPrvih' :: Int -> Int
sumaPrvih' n 
            | n == 0 = 0
            | otherwise = n + sumaPrvih'(n-1)

-- Zadatak 5.6 Napisati funkciju parMax p koja određuje veći element iz para realnih brojeva p.

parMax :: Double -> Double -> Double
parMax a b = 
            if a >= b then a
            else b

parMax' :: Double -> Double -> Double
parMax' a b
            | a>=b = a
            | otherwise = b

-- Zadatak 5.7 Napisati funkciju lista a b koja pravi listu celih brojeva iz segmenta [a, b]. U
-- slučaju da granice segmenta nisu ispravne, rezultat je prazna lista

lista :: Int -> Int -> [Int]
lista a b = 
            if a <= b then [a..b]
            else []

lista' :: Int -> Int -> [Int]
lista' a b
            | a <= b = [a..b]
            | otherwise = []

-- Zadatak 5.8 Napisati funkciju proizvodPrvih n koja računa proizvod prvih n prirodnih
-- brojeva (rekurzivno, bez korišćenja formule). Pretpostaviti da je argument ispravan.

proizvodPrvih :: Int -> Int
proizvodPrvih n =  
                if n == 1 then 1
                else n * proizvodPrvih(n-1)

proizvodPrvih' :: Int -> Int
proizvodPrvih' n 
                | n == 1 = 1
                | otherwise = n * proizvodPrvih(n-1)

-- Zadatak 5.9 Napisati funkciju prost n koja vraća True ako je n prost, False inače. Pretpostaviti da je argument ispravan.

prost :: Int -> Bool
prost n
    | n==4 = False
    | n>1 && n<=5 = True
    | mod n 6 == 1 = True
    | mod n 6 == 5 = True
    | otherwise = False

-- Zadatak 5.10 Napisati funkciju nzd a b koja računa najveći zajednički delilac brojeva a i b
-- (koristiti Euklidov algoritam). Pretpostaviti da su argumenti ispravni.

nzd :: Int -> Int -> Int
nzd a b 
        | a == b = a
        | a > b = nzd (a-b) b
        | a < b  = nzd a (b-a)


-- Zadatak 5.11 Napisati funkciju tipJednacine a b c koja vraća tip kvadratne jednačine
-- a ∗ x^2 + b ∗ x + c = 0 (Degenerisana, Jedno resenje, Dva resenja, Bez resenja).

tipJednacine :: Int -> Int -> Int -> String
tipJednacine a b c
  | a == 0 && b == 0 && c == 0 = "Degenerisana"
  | a == 0 && b == 0           = "Bez resenja"
  | a == 0                     = "Jedno resenje"
  | diskriminanta == 0         = "Jedno resenje"
  | diskriminanta > 0          = "Dva resenja"
  | otherwise                  = "Bez resenja"
  where
    diskriminanta = b^2 - 4*a*c


-- Zadatak 5.12 Napisati funkciju izDekadne x osn koja prebacuje broj x iz dekadne u osnovu
-- osn i funkciju uDekadnu x osn koja prebacuje broj x iz osnove osn u dekadnu osnovu. Pretpostaviti da je osn > 1 i osn < 10.

izDekadne :: Int -> Int -> String
izDekadne 0 _   = ""
izDekadne x osn = izDekadne (x `div` osn) osn ++ show (x `mod` osn)

-- Zadatak 5.13 Napisati funkciju ceoDeo x koja računa ceo deo korena pozitivnog broja x
-- (bez korišćenja ugrađenih funkcija za koren i/ili stepen).

ceoDeo :: Int -> Int
ceoDeo x = helper 0
    where 
        helper k
            | (k+1)*(k+1) > x = k
            | otherwise = helper (k+1)
        

-- Zadatak 5.14 Napisati funkciju harm n koja pravi listu prvih n elemenata harmonijskog
-- reda. Pretpostaviti da je argument ispravan.

harm :: Int -> [Double]
harm n
  | n == 1 = [1.0]
  | otherwise = harm(n-1) ++ [1.0/fromIntegral n]

-- Zadatak 5.15 Napisati funkciju delioci n koja pravi listu svih pravih delioca pozitivnog
-- broja n. Pretpostaviti da je argument ispravan.

delioci :: Int -> [Int]
delioci n = [d | d <- [1..n-1], n `mod` d == 0]

-- Zadatak 5.16 Napisati funkciju nadovezi l1 l2 n koja nadovezuje na listu l1 n puta listu
-- l2. Pretpostaviti da je argument n pozitivan broj.

nadovezi :: [Int] -> [Int] -> Int -> [Int]
nadovezi l1 l2 n 
                | n == 0 = l1
                | otherwise = nadovezi l1 l2 (n-1) ++ l2

-- Zadatak 5.17 Napisati funkciju sumaKvadrata n koja računa sumu kvadrata prvih n prirodnih brojeva (rekurzivno, bez korišćenja formule).

sumaKvadrata :: Int -> Int
sumaKvadrata n 
            | n == 0 = 0
            | otherwise = n*n + sumaKvadrata(n-1)

-- Zadatak 5.18 Napisati funkciju brojDelilaca n koja vraća broj pravih delilaca prirodnog
-- broja n.

brojDelilaca :: Int -> Int
brojDelilaca n = length delioci n

-- Zadatak 5.19 Napisati funkciju fib n koja računa n-ti element Fibonačijevog niza. Pretpostaviti da je argument ispravan

fib :: Int -> Int
fib n =
        if (n == 0 || n == 1) then 1
        else fib(n-1) + fib(n-2)

-- Zadatak 5.21 Napisati funkciju parni n koja pravi listu prvih n parnih prirodnih brojeva.
-- Pretpostaviti da je argument ispravan.

parni :: Int -> [Int]
parni n 
    | n == 2 = [2]
    | mod n 2 == 0 = parni(n-2) ++ [n]
    | otherwise = parni(n-1)

-- Zadatak 5.22 Napisati funkciju fibLista n koja pravi listu prvih n elemenata Fibonačijevog
-- niza. Pretpostaviti da je argument ispravan.

fibLista :: Int -> [Int]
fibLista n
        | n == 1 = [1]
        | otherwise = fibLista(n-1) ++ [fib(n)]

-- Zadatak 5.23 Napisati funkciju jednocifreniDelioci n koja pravi listu svih jednocifrenih
-- delilaca prirodnog broja n. Pretpostaviti da je argument ispravan.

jednocifreniDelioci :: Int -> [Int]
jednocifreniDelioci n = [d | d <- [1..9], mod n d] == 0