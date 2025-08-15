factoriel :: Integer -> Integer
factoriel n = if (n <= 1) then 1 else n * factoriel(n-1)

factoriel2 :: Integer -> Integer
factoriel2 n
           | n == 0 = 1
           | otherwise = n * factoriel2(n-1)