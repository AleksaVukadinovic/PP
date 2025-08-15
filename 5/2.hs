-- Suma prvih n prirodnih brojeva
sumaN :: Int -> Int
sumaN n = if n <= 0 then 0 else n + sumaN(n-1)

sumaN' :: Int -> Int
sumaN' n =
       if n == 0 then 0
       else n + sumaN'(n-1)

sumaN'' :: Int -> Int
sumaN'' n
    | n == 0 = 0
    | otherwise = n + sumaN'' (n-1)

sumaN''' :: Int -> Int
sumaN''' 0 = 0
sumaN''' n = n + sumaN''' (n-1)