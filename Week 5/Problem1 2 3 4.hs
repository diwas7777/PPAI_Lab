splitOn :: Eq a => [a] -> [a] -> [[a]]
splitOn _ [] = []
splitOn delim str =
    let (first, rest) = breakList (isPrefixOf delim) str
    in first : case rest of
        [] -> []
        x  -> splitOn delim (drop (length delim) x)

breakList :: ([a] -> Bool) -> [a] -> ([a], [a])
breakList _ [] = ([], [])
breakList p xs@(x:xt)
    | p xs = ([], xs)
    | otherwise = let (ys, zs) = breakList p xt in (x:ys, zs)

isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf [] _ = True
isPrefixOf _ [] = False
isPrefixOf (x:xs) (y:ys) = x == y && isPrefixOf xs ys

-- Problem 1: Pure function to calculate power
calculatePower :: (Num a, Integral b) => a -> b -> a
calculatePower base 0 = 1
calculatePower base exponent = base * calculatePower base (exponent - 1)

-- Problem 2: Recursive function to calculate factorial
factorial :: (Eq a, Num a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Problem 3: Higher-order function to apply a function to a list
applyFunction :: (a -> b) -> [a] -> [b]
applyFunction f xs = map f xs

-- Problem 4: Main program to put it all together
mainProgram :: IO ()
mainProgram = do
    -- Power calculation
    putStrLn "Enter the base:"
    base <- readLn
    putStrLn "Enter the exponent:"
    exponent <- readLn
    putStrLn $ "Result of power: " ++ show (calculatePower base exponent)

    -- Factorial calculation
    putStrLn "Enter a non-negative integer for factorial:"
    n <- readLn
    putStrLn $ "Factorial: " ++ show (factorial n)

    -- Apply a function to a list
    putStrLn "Enter a comma-separated list of integers:"
    inputList <- getLine
    let numbers = map read (splitOn "," inputList) :: [Int]
    let square x = x * x
    putStrLn $ "Squared values: " ++ show (applyFunction square numbers)

main :: IO ()
main = mainProgram
