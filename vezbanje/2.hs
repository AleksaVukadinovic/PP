-- Zadatak 5.24 Definisati funkciju uvecaj lista koja svaki element celobrojne liste uvećava
-- za jedan.

uvecajListu :: [Int] -> [Int]
uvecajListu lista = map (\t -> t + 1) lista

-- Zadatak 5.25 Definisati funkciju spoji lista1 lista2 koja pravi listu uređenih parova tako
-- što spaja redom elemente prve liste sa elementima druge liste u parove rezultujuće liste.

spojiListe :: [Int] -> [Int] -> [(Int, Int)]
spojiListe l1 l2 = zip l1 l2

-- Zadatak 5.26 Definisati funkciju pozitivni lista koja izdvaja sve pozitivne elemente iz
-- liste.

pozitivniListe :: [Int] -> [Int]
pozitivniListe lista = filter (\t -> t > 0) lista

-- Zadatak 5.27 Definisati funkciju prviNegativni lista koja izdvaja najduži prefiks negativnih elemenata liste.

prviNegativni :: [Int] -> [Int]
prviNegativni l = takeWhile (\t -> t < 0) l

-- Zadatak 5.28 Definisati funkciju sum lista koja računa sumu elemenata celobrojne liste
-- korišćenjem ugrađene funkcije foldr .

sumaListe :: [Int] -> Int
sumaListe l = foldr (+) 0 l

-- Zadatak 5.29 Definisati funkciju absSume lista_listi koja na osnovu liste listi celih brojeva
-- pravi listu apsolutnih suma elemenata liste listi korišćenjem kompozicije funkcija za rad sa listama

absSume :: [[Int]] -> [Int]
absSume l = map (absSuma) l
  where absSuma row = foldl (+) 0 (map (\t -> abs t) row)

-- Zadatak 5.30 Definisati funkciju sledbenici l koja vraća listu sledbenika elemenata liste l
-- koji su prirodni brojevi

sledbenici :: [Int] -> [Int]
sledbenici l = map (\t -> t+1) (filter (\t -> t > 0) l)

-- Zadatak 5.31 Definisati rekurzivnu funkciju list_elem x l koja proverava da li lista l sadrži
-- dati element x. Dodatno, definisati prethodnu funkciju korišćenjem funkcija or i map.

list_elem :: Eq a => a -> [a] -> Bool
list_elem x = or . map (== x)
list_elem' x = any (\t-> t==x)

-- Zadatak 5.32 Napisati biblioteku za rad sa tačkama u 2D ravni. Definisati tipove Tacka
-- (koordinate su realni brojevi) i Putanja (niz tačaka).  
-- Implementirati funkcije:
-- • tacka x y - konstruiše tačku sa datim koordinatama 
-- • putanja [t1, t2...] - konstruiše putanju od date liste tačaka 
-- • duzinaPutanje p - vraća dužinu putanje p 
-- • translirajTacku t dx dy - translira tacku t za vektor (dx, dy) 
-- • rastojanje t1 t2 - vraća rastojanje između tačaka t1 i t2 
-- • uKrugu r [t1, t2...] - iz liste tačaka vraća one koje se nalaze u krugu poluprečnika r od
-- tačke (0,0) 
-- • translirajPutanju p dx dz - translira sve tačke date putanje za vektor (dx, dy) 
-- • nadovezi t p - nadovezuje tačku t na kraj putanje p 
-- • spojiPutanje p1 p2 - spaja putanje p1 i p2 i vraća novu putanju 
-- • centroid [t1, t2...] - vraća centroid liste tačaka 
-- • kvadrantTacke t - vraća kvadrant tačke, 0 ako je to koordinatni početak
-- • kvadrantPutanje p - vraća kvadrant u kom se nalazi putanja ako je ona u celosti sadržana
-- u nekom od njih, 0 inače
-- • tackeUKvadrantu kv [t1, t2...] - iz liste tačaka vraća samo one koje su u kvadrantu kv
-- • tackeVanKvadranta kv [t1, t2...] - iz liste tačaka vraća one koje nisu u kvadrantu kv
-- • maksimumi [t1, t2...] - vraća uređeni par koji predstavlja maksimume x i y koordinata
-- tačaka iz date liste

type Tacka = (Double, Double)
type Putanja = [Tacka]

tacka :: Double -> Double -> Tacka
tacka x y = (x, y)

getX :: Tacka -> Double
getX = fst

getY :: Tacka -> Double
getY = snd

putanja :: [Tacka] -> Putanja
putanja l = l

duzinaPutanje :: Putanja -> Int
duzinaPutanje p = length p

translirajTacku :: Tacka -> Double -> Double -> Tacka
translirajTacku (x, y) dx dy = tacka (x + dx) (y + dy)

rastojanje :: Tacka -> Tacka -> Double
rastojanje (x1, y1) (x2, y2) = sqrt((x2-x1)^2 + (y2-y1)^2)

uKrugu :: Double -> [Tacka] -> [Tacka]
uKrugu r tacke = filter (\t -> rastojanje t (0.0, 0.0) < r) tacke

translirajPutanju :: Putanja -> Double -> Double -> Putanja
translirajPutanju p dx dy = map (\t -> translirajTacku t dx dy) p

nadovezi :: Tacka -> Putanja -> Putanja
nadovezi t p = p ++ [t]

spojiPutanje :: Putanja -> Putanja -> Putanja
spojiPutanje p1 p2 = p1 ++ p2

centroid :: [Tacka] -> Tacka
centroid cluster = tacka prosekX prosekY
        where prosekX = average (map getX cluster)
              prosekY = average (map getY cluster)
              average l =  (sum l) / (fromIntegral(length l))

kvadrant :: Tacka -> Int
kvadrant t
    | getX t > 0 && getY t > 0 = 1
    | getX t < 0 && getY t > 0 = 2
    | getX t < 0 && getY t < 0 = 3
    | getX t > 0 && getY t > 0 = 4
    | otherwise = 0

kvadrantPutanje :: Putanja -> Int
kvadrantPutanje p = if isti then head kvadranti else 0
      where kvadranti = map kvadrant p
            isti = all (==head kvadranti) kvadranti

uKvadrantu :: Int -> [Tacka] -> [Tacka]
uKvadrantu k t = filter (\x -> kvadrant x == k) t

-- Zadatak 5.33 Napisati funkcije koje određuju glavu i rep proizvoljne liste bez korišćenja
-- ugrađenih funkcija za rad sa listama.

glava :: [a] -> a
glava (x:_) = x

rep :: [a] -> [a]
rep (_:x) = x

-- Zadatak 5.34 Napisati funkciju parni a b koja generiše listu parnih celih brojeva iz segmenta
-- [a, b] i funkciju neparni a b koja generiše listu neparnih celih brojeva iz segmenta [a, b].

parni :: Int -> Int -> [Int]
parni a b = filter (\t -> mod t 2 ==0) [a..b] 

neparni :: Int -> Int -> [Int]
neparni a b = filter (\t -> mod t 2 ==1) [a..b] 

-- Zadatak 5.35 Napisati funkciju parovi a b c d koja generiše listu parova celih brojeva
-- (x, y), za koje x pripada segmentu [a, b], a y pripada segmentu [c, d].

parovi :: Int -> Int -> Int -> Int -> [(Int, Int)]
parovi a b c d = [(x, y) | x <- [a..b], y <- [c..d]]

-- Zadatak 5.36 Napisati funkciju zavisnoY a b koja generiše listu parova celih brojeva (x, y),
-- za koje x pripada segmentu [a, b], a y pripada segmentu [x, b].

zavisnoY :: Int -> Int -> [(Int, Int)]
zavisnoY a b = [(x, y) | x <- [a..b], y <- [x..b]]

-- Zadatak 5.37 Napisati funkciju bezbedanRep l koja ukoliko je lista l prazna vraća praznu
-- listu, inače vraća rep liste l, koristeći: a) uslovne izraze b) ograđene jednačine c) uparivanje šablona

bezbedanRepA :: [a] -> [a]
bezbedanRepA l =
  if null l
    then []
    else tail l

bezbedanRepB :: [a] -> [a]
bezbedanRepB l
  | null l    = []
  | otherwise = tail l

bezbedanRepC :: [a] -> [a]
bezbedanRepC []     = []
bezbedanRepC (_:xs) = xs

-- Zadatak 5.38 Napisati funkciju savrseni n koja pravi listu savršenih brojeva manjih od n.
-- Broj je savršen ukoliko je jednak sumi svojih faktora (tj. delilaca), ne uključujući taj broj.



-- Zadatak 5.39 Napisati funkciju zbirPar n koja pravi listu parova (a, b) takvih da su a i b
-- prirodni brojevi čiji je zbir jednak n.

zbirPar :: Int -> [(Int, Int)]
zbirPar n = [(a, b) | a <- [1..n], b <- [1..n], a+b==n]

-- Zadatak 5.40 Napisati funkciju poslednji l koja određuje poslednji element proizvoljne
-- liste l.

poslednji :: [a] -> a
poslednji l = head (reverse l)

-- Zadatak 5.41 Napisati funkciju spoji l koja spaja listu listi istog tipa l u jednu listu.

-- Zadatak 5.42 Napisati funkciju sufiksi l koja pravi listu svih sufiksa proizvoljne liste l.


-- Zadatak 5.43 Napisati funkciju izbaci k l koja izbacuje k-ti element iz liste l. U slučaju
-- da je zadata neispravna pozicija u listi, funkcija vraća nepromenjenu listu.

-- Zadatak 5.44 Napisati funkciju ubaci k n l koja ubacuje u listu l na poziciju k element
-- n. U slučaju da je zadata neispravna pozicija u listi, dodati element n na kraj liste.

-- Zadatak 5.45 Korišćenjem funkcija and i map, definisati funkciju list_all p l koja proverava
-- da li svi elementi liste l zadovoljavaju dato svojstvo p.

-- Zadatak 5.46 Definisati funkciju obrni l za obrtanje liste l pomoću funkcije foldl.

-- Zadatak 5.47 Definisati funkciju delioci n koja pravi listu delilaca datog prirodnog broja
-- n korišćenjem funkcije filter. Korišćenjem prethodne funkcije definisati funkciju prost n koja
-- proverava da li je dati prirodan broj n prost. Dodatno, koristeći funkcije prost i generisanje listi
-- definisati funkciju prosti n koja određuje sve proste brojeve od 1 do n.

-- Zadatak 5.48 Definisati funkciju sufiks l pomoću funkcije scanr koja određuje sve sufikse
-- date liste.

-- Zadatak 5.49 Definisati funkciju prefiks l koja određuje sve prefikse date liste l (dozvoljena
-- je rekurzija).

-- Zadatak 5.50 Definisati rekurzivnu funkciju ukloniDuplikate l koja pomoću funkcija iz
-- familije fold uklanja sve duplikate iz liste l.

-- Zadatak 5.51 Definisati funkciju qsort l sortira listu l u rastućem poretku. Za pivot uzeti
-- prvi element liste.

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (p:xs) = qsort [x | x <- xs, x <= p] ++ [p] ++ qsort [x | x <- xs, x > p]
