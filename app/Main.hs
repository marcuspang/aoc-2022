module Main (main) where

import qualified Data.Text.IO as TIO

import qualified DayOne (dayOnePartOne, dayOnePartTwo)

main :: IO ()
main = do
    dayOneInput <- TIO.readFile "input/day-one.txt"
    putStrLn $ "Day 1 Part 1: " ++ show (DayOne.dayOnePartOne dayOneInput)
    putStrLn $ "Day 1 Part 2: " ++ show (DayOne.dayOnePartTwo dayOneInput)

