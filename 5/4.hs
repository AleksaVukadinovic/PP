prost :: Int -> Bool
prost n
    | n==4 = False
    | n>1 && n<=5 = True
    | mod n 6 == 1 = True
    | mod n 6 == 5 = True
    | otherwise = False

nzd :: Int -> Int -> Int
nzd a b = if b==0 then a else nzd b ((mod) a b)

tipJ :: Double -> Double -> Double -> String
tipJ a b c
    | a == 0 && b/=0 = "Jedno"
    | a == 0 && b == 0 = if c==0 then "Beskonacno" else "Nema"
    | b**2 - 4*a*c > 0 = "Dva"
    | b**2 - 4*a*c == 0 = "Jedno"
    | otherwise "Nema"