import Detection
import Properties
import Tools

{-Verify If the Two Detections inserted Are Different.
* Input: Two Strings.
* Output An Error If the Two Detections inserted Aren't Different, "True" Otherwise.-}
verifyDetections :: String -> String -> Bool
verifyDetections detA detB 
                          | detA == detB = error "Inserted the same detection twice"
                          | otherwise = True

{-A Function to Print the Course properties.
* Input: The Strings of the two Detections Required from the Main.
* Output: Print the Course properties.-}
printInfo :: String -> String -> IO ()
printInfo [] [_] = error "The First Argument Is Null"
printInfo [_] [] = error "The Second Argument Is Null"
printInfo detA detB = do
    putStr "First Detection in Decimal Format ---> "
    putStrLn (show (round3dp (head (getPoint detA)))++ "," ++ show (round3dp (getPoint detA !! 1)))
    putStr "Second Detection in Decimal Format ---> "
    putStrLn (show (round3dp (head (getPoint detB)))++ "," ++ show (round3dp (getPoint detB !! 1)))
    putStr "Distance between First & Second Detections ---> "
    putStrLn (show (round2dp (distance (getPoint detA) (getPoint detB))) ++ "Km")
    putStr "Positive direction between First & Second Detections ---> "
    putStrLn (show (round2dp (direction (getPoint detA) (getPoint detB))) ++ "°")
    putStr "Negative direction between First & Second Detections ---> "
    putStrLn (show (round2dp (invDirection (getPoint detA) (getPoint detB))) ++ "°")
    
{-Main.-}
main :: IO ()
main = do
    putStrLn "Detections Properties Calculator V1.0 \nWarning: The Detections must be in D.M.G \
    \format and inserted into the program like: N 40 45 36.000 - E 073 59 02.400"
    putStrLn "Insert the First Detection..."
    detA <- getLine
    putStrLn "Insert the Second Detection..."
    detB <- getLine 
    putStrLn "Proceed [yes/no]?"
    answ <- getLine 
    if answ  == "yes" && verifyDetections detA detB
        then printInfo detA detB
        else putStrLn "Aborted..."