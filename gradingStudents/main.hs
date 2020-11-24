{-# LANGUAGE DuplicateRecordFields, OverloadedStrings, FlexibleInstances, UndecidableInstances #-}

module Main where

import Control.Monad
import Data.List
import Data.Functor ((<&>))
import System.IO
import System.Environment
--
-- Complete the 'gradingStudents' function below.
--
-- The function is expected to return an INTEGER_ARRAY.
-- The function accepts INTEGER_ARRAY grades as parameter.
--

gradingStudents grade 
    | grade >= 38 && r5 > 2 = grade + 5 - r5 
    | otherwise = grade
    where r5 = mod grade 5  

readArray :: IO [Int]
readArray =  getLine <&> read >>= (`replicateM` getLine) <&> map read

intoFile process fileName = do
    fptr <- openFile fileName WriteMode 
    process >>= hPutStrLn fptr 
    hFlush fptr
    hClose fptr

process = readArray <&> intercalate "\n" . map show . map gradingStudents

main :: IO()
main = getEnv "OUTPUT_PATH" >>= intoFile process

