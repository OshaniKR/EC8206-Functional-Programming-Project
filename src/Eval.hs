module Eval
    ( eval
    , lookupVar
    ) where

import Expr


-- Find a variable value in the environment
lookupVar :: String -> Env -> Either String Double
lookupVar _ [] =
    Left "Undefined variable"

lookupVar name ((variable, value) : rest)
    | name == variable = Right value
    | otherwise        = lookupVar name rest


-- Evaluate an expression
eval :: Env -> Expr -> Either String Double

-- Numeric literal
eval _ (Lit value) =
    Right value


-- Variable
eval env (Var name) =
    lookupVar name env


-- Addition
eval env (Add e1 e2) =
    case eval env e1 of
        Left err -> Left err
        Right v1 ->
            case eval env e2 of
                Left err -> Left err
                Right v2 -> Right (v1 + v2)


-- Subtraction
eval env (Sub e1 e2) =
    case eval env e1 of
        Left err -> Left err
        Right v1 ->
            case eval env e2 of
                Left err -> Left err
                Right v2 -> Right (v1 - v2)


-- Multiplication
eval env (Mul e1 e2) =
    case eval env e1 of
        Left err -> Left err
        Right v1 ->
            case eval env e2 of
                Left err -> Left err
                Right v2 -> Right (v1 * v2)


-- Division
eval env (Div e1 e2) =
    case eval env e1 of
        Left err -> Left err
        Right v1 ->
            case eval env e2 of
                Left err -> Left err
                Right v2 ->
                    if v2 == 0
                        then Left "Division by zero"
                        else Right (v1 / v2)


-- Let expression
--
-- let x = valueExpr in bodyExpr
--
-- Example:
-- Let "x" (Lit 10) (Add (Var "x") (Lit 5))
--
-- evaluates to 15
eval env (Let name valueExpr bodyExpr) =
    case eval env valueExpr of
        Left err -> Left err
        Right value ->
            eval ((name, value) : env) bodyExpr