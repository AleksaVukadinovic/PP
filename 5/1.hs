saberi :: Int -> Int -> Int
saberi a b = a + b

saberi10 :: Int -> Int
saberi10 a = a + 10

saberi10' = saberi 10

saberi10_20 = saberi 10 20

constanta = 50

-- svi operatori su fje tj a + b <=> (+) a b
-- mozemo da ih predefinisemo
-- (-) a b = 300 

oduzmi:: Int -> Int -> Int
oduzmi a b = a - b

-- Tipovi podataka:
-- Bool
-- Char, String
-- Int, Integer
-- Float, Double

-- Tipski razredi:
-- Eq -         (==), (!=)
-- Ord -        (<), (>), (<=), (>=), min, max
-- Num -        (+), (-), (*), abs, fromInteger etc.
-- Integral -   div, mod
-- Fractional - (/), recip, etc.

f :: Num a => a -> a -> a
f x y = x + 3*y - x*y 

g :: (Num a, Ord a) => a -> a -> a
g x y = max (abs(x)) (abs(y))

dupli :: Int -> Int
dupli x = 2*x

dupli' :: Int -> Int
dupli' = (*) 2

mod3 :: Integral a => a -> a
mod3 n = mod n 3

sqrt' :: Int -> Double
sqrt' n = sqrt (fromIntegral n)