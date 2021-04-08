module RegExpParser
       ( RegExp(..)
       , parseRegExp
       ) where

import Text.ParserCombinators.ReadP
-- Codewars : https://www.codewars.com/kata/5470c635304c127cad000f0d/haskell

data RegExp = Normal Char       -- ^ A character that is not in "()*|."
            | Any               -- ^ Any charater
            | ZeroOrMore RegExp -- ^ Zero or more occurances of the same regexp
            | Or RegExp RegExp  -- ^ A choice between 2 regexps
            | Str [RegExp]      -- ^ A sequence of regexps.
  deriving (Show, Eq)


parseRegExp :: String -> Maybe RegExp
parseRegExp = out . readP_to_S reg

out ((Or _ _, '|':cs):ps) = Nothing
out [(r,"")] = Just r
out (x:xs) = out xs
out [] = Nothing

reg = str <$> many1 (choice [ base, zom, o])

str [x] = x
str xs = Str xs

base = choice
    [ fmap Normal $ satisfy $ not . (`elem` ".*|()")
    , Any <$ char '.'
    , between (char '(') (char ')') reg
    ]

zom = ZeroOrMore <$> base <* char '*'

nor = fmap str $ many1 $ choice [ zom, base ]

o = Or <$> nor <* char '|' <*> nor