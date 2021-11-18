{- Monad -}
data Value t = Value t | NoValue deriving (Show, Eq)

{- the "return" function converts a value into a monad -}
myreturn x = Value x

{-"bind" takes a monad and a function and applies the function to the value in the monad -}
mybind:: Value t -> (t -> Value s) -> Value s
mybind (Value x) f = f x
mybind NoValue _   = NoValue


{- let's create a divide function on the monad -}
(//) vx vy = mybind vx (\x -> mybind vy (\y -> if y == 0 then NoValue else myreturn (x / y)))
(~~) vx vy = mybind vx (\x -> mybind vy (\y -> myreturn (x - y)))
(+++) vx vy = mybind vx (\x -> mybind vy (\y -> myreturn (x + y)))



{- Haskell has a built in monad called Maybe
    data Maybe t = Just t | Nothing
    
    the "return" function is return
    the "bind" function is >>=
-}

(///) mx my = mx >>= (\x -> my >>= (\y -> if y == 0 then Nothing else return (x / y)))



{- Squareroot -}
msqrt mx = mx >>= (\x -> if x < 0 then Nothing else return sqrt x)

msqrt mx = do
  x <- mx
  if x < 0 then Nothing else return (sqrt x)


{- mapply takes two monads and a function and creates a monad that applies the function to the two operands -}
mapply mx f my = do
  x <- mx
  y <- my
  return (f x y)