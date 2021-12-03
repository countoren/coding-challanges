main = readFile "./input" >>= print . f (0,0,0) . map words . lines

f (a,h,d) (["forward", x]:ls) = f (a,h + read x,d + read x * a) ls
f (a,h,d) (["up", x]:ls) = f (a - read x,h,d) ls
f (a,h,d) (["down", x]:ls) = f (a + read x,h,d) ls
f (a,h,d) [] = h*d
