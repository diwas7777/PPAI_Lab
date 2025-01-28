isPalindrome :: String -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome (x:xs)
    | x == last xs = isPalindrome (init xs)
    | otherwise = False

mainPalindrome :: IO ()
mainPalindrome = do
    putStrLn "Enter a string to check if it's a palindrome:"
    str <- getLine
    if isPalindrome str
        then putStrLn "The string is a palindrome."
        else putStrLn "The string is not a palindrome."

main :: IO ()
main = mainPalindrome
