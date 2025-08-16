import Data.List as List (elemIndex, sortBy)

data StepenStudija = OsnovneStudije
                   | MasterStudije
                   | DoktorskeStudije
                   deriving Eq

instance Show StepenStudija where
         show OsnovneStudije   = "Bsc"
         show MasterStudije    = "Msc"
         show DoktorskeStudije = "PhD"

data Student = MkStudent  { indeks :: String
                          , ime :: String
                          , prezime :: String
                          , stepen :: StepenStudija
                          }

instance Show Student where
  show = showUtil

showUtil :: Student -> String
showUtil s = id ++ ":" ++ ip ++ "-" ++ ss
    where id = indeks s
          ip = (ime s) ++ "_" ++ prezime(s)
          ss = show (stepen s)

instance Eq Student where
  (==) s1 s2 = (indeks s1) == (indeks s2)

type Rezultat = (Student, Maybe Int)

formiraj :: [Student] -> [Rezultat]
formiraj studenti = map (\s -> (s, Nothing)) studenti

ponistiSve :: [Rezultat] -> [Rezultat]
ponistiSve rezultati = map (\r -> (fst r, Nothing)) rezultati

ponistiSingle :: Student -> [Rezultat] -> [Rezultat]
ponistiSingle student rezultati = foldr azuriraj [] rezultati
    where azuriraj elem l = if fst elem == student then (student, Nothing):l else elem:l

saStepena :: StepenStudija -> [Rezultat] -> [Rezultat]
saStepena ss rezultati = filter (\(s, _) -> stepen s == ss) rezultati

polozeni :: [Rezultat] -> [Rezultat]
polozeni rezultati = filter (\(s, p) -> (parsiraj p) > 50) rezultati
  where parsiraj Nothing     = 0
        parsiraj (Just broj) = broj

poeni :: Student -> [Rezultat] -> Either String (Maybe Int)
poeni s rez =
  case idx of Nothing  -> Left ("Nema studenta u listi!")
              (Just i) -> Right (snd (rez !! i))
  where idx = elemIndex s (map fst rez)

upisi :: Student -> Int -> [Rezultat] -> [Rezultat]
upisi s p rez = if elem s (map fst rez) 
                then foldr azuriraj [] rez
                else (s, Just p): rez
    where azuriraj elem l = if fst elem == s 
                            then (s, Just p): l
                            else elem:l

najbolji :: Int -> [Rezultat] -> [Int]
najbolji n rez = sortBy (flip compare)(map (\(Just p) -> p) (filter (\p -> p /= Nothing ) (map snd rez)))

-- Tests
s1 = MkStudent "41/2014" "Pera" "Peric" OsnovneStudije 
s2 = MkStudent "31/2015" "Ana" "Anic" OsnovneStudije
s3 = MkStudent "23/2020" "Nikola" "Nikolic" MasterStudije
s4 = MkStudent "11/2020" "Ivana" "Ivanic" DoktorskeStudije
s5 = MkStudent "44/2020" "Jelena" "Jelenic" OsnovneStudije
stud = [s1, s2, s3, s4]
rez :: [Rezultat]
rez= [(s1, Just 94), (s2, Just 43), (s4, Nothing), (s5, Just 100)]
