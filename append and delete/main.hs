{-# LANGUAGE FlexibleInstances, UndecidableInstances, DuplicateRecordFields #-}

module Main where

import Control.Monad
import Data.List
import           Data.List.Split                ( splitOn )
import           Data.Functor                   ( (<&>) )
import System.Environment
import System.IO

-- Complete the appendAndDelete function below.
removePrefixes :: Int -> String -> String -> Int -> String
removePrefixes prefixCount (s1:ss) (t1:ts) k 
    | s1 == t1 = removePrefixes (prefixCount+1) ss ts  k
removePrefixes pc s t k = appendAndDelete (s, t, pc, k)


appendAndDelete :: (String, String, Int, Int) -> String
appendAndDelete ([],[], pc, k) 
    | (pc * 2) < k || mod k 2 == 0 = "Yes" 
    | otherwise = "No"
appendAndDelete (_,_, _, k) | k <= 0 = "No"
appendAndDelete ((s:ss), (t:ts), pc, k) = appendAndDelete (ss, ts, pc, k-2)
appendAndDelete ((s:ss), [], pc, k) = appendAndDelete (ss, [], pc, k-1)
appendAndDelete ([], (t:ts), pc, k) = appendAndDelete ([], ts, pc, k-1)




main :: IO()
main = removePrefixes 0 <$> getLine <*> getLine <*> readLn >>= putStrLn
-- main :: IO()
-- main = do
--     outputPath <- getEnv "OUTPUT_PATH"
--     fptr <- openFile outputPath WriteMode

--     s <- getLine

--     let result = timeConversion s

--     hPutStrLn fptr result

--     hFlush fptr
--     hClose fptr
