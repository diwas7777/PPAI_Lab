isSpam :: String -> Bool
isSpam email = any (`elem` words email) ["win", "prize", "free", "cash", "urgent"]

main :: IO ()
main = do
    let email = "Congratulations! You've won a free prize!"
    print (isSpam email)

    let email = "Hello Diwas, How are you?"
    print (isSpam email )
    
    
-- Output --
-- True
-- False