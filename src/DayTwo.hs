module DayTwo (partA, partB) where

data Move = Rock | Paper | Scissors deriving (Show, Eq, Enum)
data Outcome = Win | Lose | Draw deriving (Show, Eq)

winnerOf :: Move -> Move
winnerOf Rock = Paper
winnerOf Paper = Scissors
winnerOf Scissors = Rock

loserOf :: Move -> Move
loserOf Rock = Scissors
loserOf Paper = Rock
loserOf Scissors = Paper

getScore :: (Move, Move) -> Int
getScore (theirs, mine)
    | mine == winnerOf theirs = 6 + moveValue mine
    | mine == loserOf theirs = 0 + moveValue mine
    | otherwise = 3 + moveValue mine

moveValue :: Move -> Int
moveValue m = fromEnum m + 1

parseMove :: Char -> Move
parseMove x
    | x `elem` "AX" = Rock
    | x `elem` "BY" = Paper
    | otherwise = Scissors

getCorrespondingMove :: (Move, Char) -> Move
getCorrespondingMove (theirs, outcome)
    | outcome == 'X' = loserOf theirs
    | outcome == 'Z' = winnerOf theirs
    | otherwise = theirs

partA :: String -> Int
partA x = sum $ map getScore parsedRounds
    where parsedRounds = map (\[x,_,y] -> (parseMove x, parseMove y)) $ lines x

partB :: String -> Int
partB x = sum $ map getScore parsedRounds
    where
        parsedRounds = map (\[x,_,y] -> (parseMove x, getCorrespondingMove (parseMove x, y))) $ lines x
