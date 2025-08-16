type Tacka = (Float, Float)

-- 1.
data BulovskiTip = Tacno | Netacno

-- 2.
data Oblik = Kvadrat Float 
           | Pravougaonik Float Float 
           | Krug Float 
           | Trougao Float Float Float 
           deriving Show

-- 3. 
-- ime i godine su ujedno geteri
data Ljubimac = MkLjubimac { ime :: String 
                           , godine :: Int
                           } deriving Show

-- 4.
data Zivotinja = Pas | Macka | Papagaj deriving Eq
data LjubimacAdv = MkLjubimacAdv  { imeAdv :: String
                                  , godineAdv :: Int
                                  , tip :: Zivotinja 
                                  }

-- 5.
data Paralelogram = MkParalelogram  { a :: Int
                                    , b :: Int
                                    }

-- 6.
glavaListe :: [a] -> a
glavaListe l = if length(l) > 0 then head(l) else Nothing

glavaListe2 :: [a] -> a
glavaListe2 (x:_) = x

glavaListe3 :: [a] -> Maybe a
glavaListe3 [] = Nothing
glavaListe3 (x:_) = Just x

-- 7.
-- data Either a b = Left a | Right b
glava1 :: [a] -> Either String a
glava1 [] = Left "PraznaLista"
glava1 (x:_) = Right x

instance Show Paralelogram where
  show p = "Paralelogram sa stranicama: " ++ (show (a p)) ++ " i " ++ (show (b p))

instance Eq Paralelogram where
  (==) p1 p2 = (a p1) == (a p2) && (b p1) == (b p2)