{- More Haskell Type -}
data Coordinate t = Coord3D t t t | Coord2D t t | Coord1D t | Zero deriving (Eq, Show)

{- Give a haskell type for a binary tree that stores a value at every node -}
data BinTree t = Empty | Leaf t | InnerNode t (BinTree t) (BinTree t) deriving (Show)

{- Create a fuction to convert the tree into a list "in-order" -}
inorder Empty             = []
inorder (Leaf a)          = [a]
inorder (InnerNode a l r) = (inorder l) ++ (a : inorder r)

{- Create a function to convert the tree into a list "pre-order" -}

{- Create  a function to insert a value inot a tree in the proper place (smaller than node in left child and larger than node in right child) -}
insert a Empty    = Leaf a
insert a (Leaf b)
  | a < b     = InnerNode b (Leaf a) Empty
  | otherwise = InnerNode b Empty (Leaf a)
insert a (InnerNode b l r)
  | a < b     = InnerNode b (insert a l) r
  | otherwise = InnerNode b l (insert a r)

  {- appluInOrder takes a function and a tree and applies the function to every node in the tree, returning the resulting tree -}




  {- foldinorder takes a function an initial value and a tree and "flds" using an inorder traversal -}
  foldinorder f i Empty             = i
  foldinorder f i (Leaf a)          = (f a i)
  foldinorder f i (InnerNode a l r) = foldinorder f (f a (foldinorder f i r)) l


  better_inorder tree = foldinorder (:) [] tree