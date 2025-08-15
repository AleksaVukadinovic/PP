parMax :: (Double, Double) -> Double
parMax p = max (fst p) (snd p)

threeMax :: (Double, Double, Double) -> Double
threeMax (a, b, c) max a (max b c)

not :: Bool -> Bool
not n
    | n == True = False
    | otherwise = True

not' :: Bool -> Bool
not' True = False
not' False = True

(&&) :: Bool -> Bool -> Bool
(&&) True True = True
(&&) a b = False

