module Simplify
    ( simplify
    ) where

import Expr


simplify :: Expr -> Expr

-- x + 0 = x
simplify (Add expr (Lit 0)) =
    simplify expr

-- 0 + x = x
simplify (Add (Lit 0) expr) =
    simplify expr

-- x - 0 = x
simplify (Sub expr (Lit 0)) =
    simplify expr

-- x * 1 = x
simplify (Mul expr (Lit 1)) =
    simplify expr

-- 1 * x = x
simplify (Mul (Lit 1) expr) =
    simplify expr

-- x * 0 = 0
simplify (Mul _ (Lit 0)) =
    Lit 0

-- 0 * x = 0
simplify (Mul (Lit 0) _) =
    Lit 0

-- x / 1 = x
simplify (Div expr (Lit 1)) =
    simplify expr


-- Recursively simplify addition
simplify (Add e1 e2) =
    Add (simplify e1) (simplify e2)


-- Recursively simplify subtraction
simplify (Sub e1 e2) =
    Sub (simplify e1) (simplify e2)


-- Recursively simplify multiplication
simplify (Mul e1 e2) =
    Mul (simplify e1) (simplify e2)


-- Recursively simplify division
simplify (Div e1 e2) =
    Div (simplify e1) (simplify e2)


-- Recursively simplify Let expressions
simplify (Let name value body) =
    Let name (simplify value) (simplify body)


-- Literals and variables need no simplification
simplify expr =
    expr