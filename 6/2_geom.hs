-- Tipovi

type Tacka = (Float, Float) 
type Putanja = [Tacka]

-- "Konstruktori" funkcije

tacka :: Float -> Float -> Tacka
tacka x y = (x, y)

o :: Tacka
o = tacka 0 0

projX :: Tacka -> Float
projX = fst

projY :: Tacka -> Float
projY = snd

putanja :: [Tacka] -> Putanja
putanja l = l

-- Util funkcije
duzinaPutanje :: Putanja -> Int
duzinaPutanje p = length p

translacijaTacka :: Tacka -> Float -> Float -> Tacka
translacijaTacka (x, y) dy dy = tacka (x + dx) (y + dy)

rastojanje :: Tacka -> Tacka -> Float
rastojanje (x1, y1) (x2, y2) = sqrt(dx^2 +dy^2)
            where dx = x1 - x2
                  dy = y1 - y2


uKrugu :: Float -> [Tacka] -> [Tacka]
uKrugu r l = [tacka | tacka <- l, rastojanje tacka o <= r]

uKrugu' :: Float -> [Tacka] -> [Tacka]
uKrugu' r tacke = filter (\r -> rastojanje t o <= r) tacke

translacijaPutanja :: Putanja -> Float -> Float -> Putanja
translacijaPutanja putanja dx dy = map (\t -> translacijaTacka t dx dy) putanja

nadovezi :: Tacka -> Putanja -> Putanja
nadovezi t p = putanja (t : p)

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

spojiPutanje :: Putanja -> Putanja -> Putanja
spojiPutanje p1 p2 = putanja ((++) p1 p2)

centroid :: [Tacka] -> Tacka
centroid cluster = tacka prosekX prosekY
        where prosekX = average (map projX cluster)
              prosekY = average (map projY cluster)
              average l =  (sum l) / (fromIntegral(length l))


kvadrant :: Tacka -> Int
kvadrant t
    | projX t > 0 && projY t > 0 = 1
    | projX t < 0 && projY t > 0 = 2
    | projX t < 0 && projY t < 0 = 3
    | projX t > 0 && projY t ><0 = 4
    | otherwise = 0

kvadrantPutanje :: Putanja -> Int
kvadrantPutanje p = if isti then head kvadranti else 0
      where kvadranti = map kvadrant p
            isti = all (==head kvadranti) kvadranti

uKvadrantu :: Int -> [Tacka] -> [Tacka]
uKvadrantu k t = filter (\x -> kvadrant x == k) t