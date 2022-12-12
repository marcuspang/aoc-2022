module Main (main) where

import qualified DayOne (partA, partB)
import qualified DayTwo (partA, partB)

main :: IO ()
main = do
    dayOneInput <- readFile "input/day-one.txt"
    putStrLn $ "Day 1 Part 1: " ++ show (DayOne.partA dayOneInput)
    putStrLn $ "Day 1 Part 2: " ++ show (DayOne.partB dayOneInput)
    dayTwoInput <- readFile "input/day-two.txt"
    putStrLn $ "Day 2 Part 1: " ++ show (DayTwo.partA dayTwoInput)
    putStrLn $ "Day 2 Part 2: " ++ show (DayTwo.partB dayTwoInput)

