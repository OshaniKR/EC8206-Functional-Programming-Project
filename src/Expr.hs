module Expr
    ( Expr(..)
    , Env
    ) where


-- Arithmetic expression language
data Expr
    = Lit Double
    | Var String
    | Add Expr Expr
    | Sub Expr Expr
    | Mul Expr Expr
    | Div Expr Expr
    | Let String Expr Expr
    deriving (Show, Eq)


-- Environment containing variable bindings
type Env = [(String, Double)]