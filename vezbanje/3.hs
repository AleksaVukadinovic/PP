import Data.List as List (elemIndex, sortBy)

-- Zadatak 5.52 Definisati bulovski tip podataka.

data BulovskiTip = Tacno | Netacno

-- Zadatak 5.53 Definisati tip podataka Oblik koji može biti Kvadrat (karakterisan stranicom),
-- Pravougaonik (karakterisan dvema stranicama), Krug (karakterisan poluprečnikom) ili Trougao
-- (karakterisan sa tri stranice).

data Oblik =  Kvadrat Double
            | Pravougaonik Double Double
            | Krug Double
            | Trougao Double Double Double
            deriving Show


-- Zadatak 5.54 Definisati tip podataka Zivotinja koji može biti Pas, Macka ili Papagaj. Zatim
-- definisati tip Ljubimac (karakterisan imenom, godinama i tipom zivotinje).

data Zivotinja = Pas | Macka | Papagaj
data Ljubimac = MkLjubimac {
                            ime :: String,
                            godine :: Int,
                            tip :: Zivotinja
                           }

-- Zadatak 5.55 Definisati tip podataka Pravougaonik (karakterisan dvema stranicama) i instancirati klase Show i Eq nad kreiranim tipom.

data Pravougaonik = MkPravougaonik {
                      a :: Int
                    , b :: Int     
                    }

instance Show Pravougaonik where
    show (MkPravougaonik a b) =
       "(" ++ show a ++ "," ++ show b ++ ")"

instance Eq Pravougaonik where
    (==) (MkPravougaonik a1 b1) (MkPravougaonik a2 b2) =
        a1 == a2 && b1 == b2 || a1 == b2 && b1 == a2


-- Zadatak 5.56 Napisati funckije glava i rep koje bezbedno vraćaju glavu i rep liste koristeći
-- tip Maybe.

glava :: [a] -> Maybe a
glava [] = Nothing
glava (x:_) = Just x

rep :: [a] -> Maybe[a]
rep [] = Nothing
rep (_:xs) = Just xs 

-- Zadatak 5.57 Napisati funckije glava i rep koje bezbedno vraćaju glavu i rep liste koristeći
-- tip Either. U slučaju da je lista prazna, vratiti String sa porukom o grešci.

glava :: [a] -> Either String a
glava [] = Left "Prazna lista"
glava (x:_) = Right x

rep :: [a] -> Either String a
rep [] = Left "Prazna lista"
rep (_:xs) =  Right xs

-- Zadatak 5.58 Napisati biblioteku za pomoć asistentima u arhiviranju i održavanju rezultata ispita. 
-- Definisati tipove StepenStudija (osnovne, master, doktorske), Student (karakterisan
-- brojem indeksa, imenom, prezimenom i stepenom studija) i Rezultat (svaki student ima opcioni
-- rezultat predstavljen brojem poena). Obezbediti da se student može ispisati na standardni izlaz i
-- porediti po jednakosti sa ostalim studentima po broju indeksa. Implementirati funkcije:
-- • rezultati studenti - konstruiše listu rezultata za date studente, gde je svaki rezultat trenutno prazan
-- • poeni student rezultati - vraća broj poena datog studenta iz liste rezultata ili poruku
-- ako se student ne nalazi u istoj
-- • ponisti student rezultati - poništava poene za datog studenta iz liste rezultata
-- • ponistiSve rezultati - poništava poene za sve studente iz liste rezultata
-- • studije stepenStudija rezultati - vraća samo one rezultate za studente sa datog stepena
-- studija
-- • polozeni rezultati - vraća samo one rezultate gde je student položio ispit
-- • upisi student poeni rezultati - upisuje novi rezultat za datog studenta u listu rezultata
-- • najboljih n rezultati - vraća n najboljih rezultata (samo broj poena) iz liste rezultata,
-- sortiranih opadajuće

data StepenStudija =  Osnovne 
                    | Master 
                    | Doktorske
                    deriving Eq

instance Show StepenStudija where
    show Osnovne = "BSc"
    show Master = "MSc"
    show Doktorske = "PhD"

data Student = MkStudent  {
                            indeks :: String,
                            ime :: String,
                            prezime :: String,
                            stepen :: StepenStudija
                          }

instance Show Student where
  show = formatirajStudenta

formatirajStudenta :: Student -> String
formatirajStudenta s = id ++ ":" ++ ip ++ "-" ++ ss
    where id = indeks s
          ip = (ime s) ++ "_" ++ prezime(s)
          ss = show (stepen s)

instance Eq Student where
  (==) s1 s2 = (indeks s1) == (indeks s2)

type Rezultat = (Student, Maybe Int)

rezultatiStudenata :: [Student] -> [Rezultat]
rezultatiStudenata studenti = map (\s -> (s, Nothing)) studenti

poeni :: Student -> [Rezultat] -> Either String (Maybe Int)
poeni s rez =
    case idx of Nothing -> Left "Nema studenata u listi"
                (Just i)
--  TODO