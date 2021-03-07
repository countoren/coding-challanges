import Text.ParserCombinators.ReadP
import Control.Applicative

main = interact $ unlines . cmdsToOutput [] . map parseCmds . tail . lines

cmdsToOutput l (f:fs) = output : cmdsToOutput l' fs
    where (output, l') = f l

cmdsToOutput _ [] = []
parseCmds = fst . last . readP_to_S (push <|> pop <|> inc)
push = push' <$>  (string "push" *> skipSpaces *> number )
push' n a = (show n , n:a)

pop = pop' <$ string "pop"
pop' [] = ("EMPTY", [])
pop' (n:a) = (show n, a)

inc = inc' <$> (string "inc" *> skipSpaces *> number) <* skipSpaces <*> number
inc' n1 n2 a =(fst $ pop' a, p1 ++ map (+ n2) p2)
    where (p1,p2) =  splitAt (length a - n1) a

number :: ReadP Int
number = read <$> munch1 (`elem` ['0'..'9'])