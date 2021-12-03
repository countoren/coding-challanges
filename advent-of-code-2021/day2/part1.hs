main = readFile "./input" >>= print . f (0,0) . map words . lines

f (h,d) (["forward", x]:ls) = f (h + read x,d) ls
f (h,d) (["up", x]:ls) = f (h,d - read x) ls
f (h,d) (["down", x]:ls) = f (h,d + read x) ls
f (h,d) [] = h*d
