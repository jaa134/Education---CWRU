-- Jacob Alspaw
-- EECS 345
-- 4 / 15 / 2019
-- Programming 3

{- 1. rotate -}
--  Create the function rotate that takes three elements and a list. 
--  It returns a list that is the same as the input list except that 
--  each occurrence of the first element is replaced by the second, 
--  the second element is replaced by the third, and the third is 
--  replaced by the first.
rotate x y z [] = []
rotate x y z (h : t)
  | h == x    = (y : (rotate x y z t))
  | h == y    = (z : (rotate x y z t))
  | h == z    = (x : (rotate x y z t))
  | otherwise = (h : (rotate x y z t)) 

{- 2. squareroot -}
--  The function will compute the squareroot of the value using iteration 
--  rounds of Newton's method, starting with an initial value equal to 
--  the input value.
squareroot val i
  | i == 0    = val
  | otherwise = old - ((old * old) - val) / (2 * old)
  where
    old = (squareroot val (i - 1)) 

{- 3. squareroot_cps -}
--  Create a continuation passing version of squareroot_cps
squareroot_cps val i return
  | i == 0    = (return val)
  | otherwise = squareroot_cps val (i - 1) (\v -> return (v - ((v * v) - val) / (2 * v)))

{- 4. nested list type -}
--  Create a type that allows us to have nested lists. Your type 
--  should have two kinds of values, elements and sublists.
data NestedList t = Element t | SubList [NestedList t] deriving (Show)

{- 5. grotate -}
--  Create the function grotate that takes three values and list 
--  containing elements and sublists and returns a list with the 
--  same structure, but if any "element" is the first input, it 
--  is replaced by the second, if an "element" is the second input, 
--  it is replaced by the third, and if it is the "third" input, it 
--  is replaced by the first.
grotate x y z [] = []
grotate x y z ((SubList a) : b) = (SubList (grotate x y z a) : (grotate x y z b))
grotate x y z ((Element a) : b)
  | a == x    = ((Element y) : (grotate x y z b))
  | a == y    = ((Element z) : (grotate x y z b))
  | a == z    = ((Element x) : (grotate x y z b))
  | otherwise = ((Element a) : (grotate x y z b)) 

{- 6. removeMin -}
--  Using the Tree type created in class, write a function removeMin 
--  that takes a Tree as input. Assuming the tree is in proper order 
--  (all values in the left child are smaller than the value in the 
--  node, and all the values in the right child are equal or larger 
--  than the node), the function will return a new tree with the smallest 
--  value of the tree removed.
data BinTree t = Empty | Leaf t | InnerNode t (BinTree t) (BinTree t) deriving (Show)

removeMin Empty                        = Empty
removeMin (Leaf t)                     = Empty
removeMin (InnerNode t Empty Empty)    = Empty
removeMin (InnerNode t (Leaf v) Empty) = Leaf t
removeMin (InnerNode t Empty (Leaf v)) = Leaf v
removeMin (InnerNode t Empty r)        = InnerNode (findMin r) Empty (removeMin r)
removeMin (InnerNode t l r)            = InnerNode t (removeMin l) r

findMin (Leaf t) = t
findMin (InnerNode t Empty r) = t
findMin (InnerNode t l r) = findMin l

{- 7. dotproduct -}
--  Create the function dotproduct that takes two vectors (lists of numbers) 
--  and returns the dot product of the vectors. Normally, this would crash if 
--  the vectors have different lengths. You will prevent this using the Maybe 
--  monad of Haskell.

--dotproduct [] [] = Just 0
--dotproduct [] v = Nothing
--dotproduct v [] = Nothing
--dotproduct (h1:t1) (h2:t2) = do
--   r <- (dotproduct t1 t2) 
--   return ((h1 * h2) + r)

dotproduct v1 v2 = if (length v1) /= (length v2)
  then Nothing
  else return (sum (zipWith (*) v1 v2))

{- 8. vectormult -}
-- Create the function vectormult that takes a row vector (a list of numbers) 
-- and matrix (a list of lists of numbers) and multiplies the vector times the
-- matrix. The result should be a vector embedded in a Maybe where the ith element 
-- of the result is the dotproduct of the input vector and the ith column of the matrix.

afterFirstCol [] = Just []
afterFirstCol (h:t) = do
  afc <- afterFirstCol t
  if h == []
    then Nothing
    else return ((tail h) : afc)

allEmpty:: Eq a => [[a]] -> Bool 
allEmpty = all (== [])

vectormult [] _ = Just []
vectormult _ [] = Just []
vectormult v m = do
  dp <- dotproduct v (map head m)
  afc <- afterFirstCol m 
  if allEmpty afc
    then return [dp]
    else do r <- vectormult v afc
            return (dp : r)

{- 9. matrixmultiply -}
-- Takes two matrices (a list of lists of numbers) and multiplies them. The result 
-- should be embedded in a Maybe, and if any of the matrix dimensions do not fit or 
-- if a matrix is not rectangular, then the result should be Nothing.

matrixmultiply [] _ = Just []
matrixmultiply _ [] = Just []
matrixmultiply (h:t) m = do
  v <- vectormult h m
  r <- matrixmultiply t m
  return (v : r)

{- 10. Monad List -}
--  Create a list monad that generalizes a list. This will not be a Haskell Monad 
--  type, but instead one of our own creation like the Value type from lecture.
data List t = Null | Pair t (List t) deriving (Show)

lbind :: (List t1) -> (t1 -> t2) -> (List t2)
lbind (Pair t1 t2) f = (Pair (f t1) (lbind t2 f))
lbind Null _         = Null

lreturn t = t