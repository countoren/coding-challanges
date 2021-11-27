import Text.ParserCombinators.ReadP
import Data.Maybe

example = 
    ["0: 1 2"
    ,"1: \"a\""
    ,"2: 1 3 | 3 1"
    ,"3: \"b\""
    ]

main = print f example

evaluate = fst . last . readP_to_S p 


p :: ReadP ((Int -> Maybe String) -> Int -> Maybe String)
p = do
    ix <- number <* char ':'
    ns <- many1 (skipSpaces *> number)
    return $ \f i->  if i == ix then Just $ ns >>= fromMaybe "ERROR" . f else Nothing


number :: ReadP Int
number = read <$> munch1 (`elem` ['0'..'9'])