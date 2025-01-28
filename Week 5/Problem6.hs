-- Function to calculate even-indexed Fibonacci numbers
fibEven :: Int -> Int -> Int -> Int
fibEven 0 a _ = a
fibEven n a b = fibOdd (n-1) b (a + b)

-- Function to calculate odd-indexed Fibonacci numbers
fibOdd :: Int -> Int -> Int -> Int
fibOdd 0 _ b = b
fibOdd n a b = fibEven (n-1) a (a + b)

-- Function to generate the Fibonacci sequence up to the nth term
fibonacci :: Int -> [Int]
fibonacci n = generateFib n 0 1
  where
    generateFib 0 _ _ = []
    generateFib n a b = a : generateFib (n-1) b (a + b)

-- Main function to input n and print the Fibonacci sequence
main :: IO ()
main = do
    putStrLn "Enter the value of n:"
    n <- readLn
    print (fibonacci n)
