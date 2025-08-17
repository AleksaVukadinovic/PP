-- Napisati biblioteku funkcija koje pružaju korisniku podršku za rad sa prostim brojevima. Implementirati:
-- (a) (8p) Funkciju delioci n, čiji je tip: delioci :: Int -> [Int] koja vraća rastuće sortiranu listu pravih delilaca broja n.

delioci :: Int -> [Int]
delioci n = [x | x <- [2..n-1], mod n x == 0]

-- (b) (8p) Funkciju prost n, čiji je tip: prost :: Int -> Bool koja vraća True ukoliko je n prost, a False inače.

prost :: Int -> Bool
prost n =  if n==1 then False else length (delioci n) == 0

-- (c) (8p) Funkciju generisiProste n, čiji je tip: generisiProste :: Int -> [Int] koja generiše proste brojeve u intervalu [2..n].

generisiProste :: Int -> [Int]
generisiProste n = [x | x <- [2..n], prost x]

-- (2p) Kreirati tip podataka Broj koji se može konstruisati putem konstruktora MkBroj i sadrži dva atributa tip (String)
-- i vrednost (Int) (npr. (prost, 19) i (slozen, 10)), kao i funkcije tip i vrednost koje omogućavaju pristup poljima
-- tip i vrednost. Za kreirani tip instancirati klasu Show (podrazumevano) i klasu Ord tako da se brojevi porede po
-- vrednosti.

data Broj = MkBroj  {
                      tip :: String,
                      vrednost :: Int  
                    }

instance Show Broj where
    show b = "(" ++ tip b ++ ", " ++ (show (vrednost b)) ++ ")"

instance Eq Broj where
    b1 == b2 = vrednost b1 == vrednost b2

instance Ord Broj where
    compare b1 b2 = compare (vrednost b1) (vrednost b2)

-- (e) (12p) Funkciju sumaProstih a b, čiji je tip: sumaProstih :: [Broj] -> Int koja vraća sumu prostih brojeva liste.

sumaProstih :: [Broj] -> Int
sumaProstih l = sum [vrednost b | b <- l, tip b == "prost"]

-- (f) (12p) Funkciju faktori n, čiji je tip: faktori :: Broj -> [Int] koja vraća listu uređenih parova koji predstavljaju
-- proste faktore broja n kao i broj njihovih ponavljanja.

faktori :: Broj -> [(Int, Int)]
faktori b
    | tip b == "prost" = [(vrednost b, 1)]
    | otherwise        = faktorizuj (vrednost b) 2
  where
    faktorizuj 1 _ = []
    faktorizuj n p
        | p * p > n      = [(n,1)]  -- n je prost
        | n `mod` p == 0 = let (m, count) = skini n p 0
                           in (p,count) : faktorizuj m (p+1)
        | otherwise      = faktorizuj n (p+1)

    skini n p c
        | n `mod` p == 0 = skini (n `div` p) p (c+1)
        | otherwise      = (n, c)
