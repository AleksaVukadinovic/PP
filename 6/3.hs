-- filter :: (a -> Bool) -> [a] -> [a]
-- map :: (a -> b) -> [a] -> [b]
-- all :: (a -> Bool) -> [a] -> Bool
-- any :: (a -> Bool) -> [a] -> Bool
-- reverse :: [a] -> [a]

all' :: (a -> Bool) -> [a] -> Bool
all' pred col = length (filter pred col) == length col

any' :: (a -> Bool) -> [a] -> Bool
any' pred kol = length (filter pred kol) > 0

-- foldl :: (b -> a -> b) -> b -> [a] -> 
-- foldl (+) 0 [1,2,3]
-- 0 + 1 = 1

-- foldl (+) 1 [2,3]
-- 1 + 2 = 3

-- foldl (+) 3 [3]
-- 3 + 3 = 6

-- foldl (+) 6 []
-- 6

-- foldr :: (a -> b -> b) b [a] -> b
-- folfl1, foldr1