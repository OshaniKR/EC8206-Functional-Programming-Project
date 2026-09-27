module Batch
    ( evalBatch
    , successfulResults
    , countResults
    ) where

import Expr
import Eval


-- Evaluate every expression in a list
evalBatch :: Env -> [Expr] -> [Either String Double]
evalBatch env expressions =
    map (eval env) expressions


-- Keep only successful results
successfulResults :: Env -> [Expr] -> [Double]
successfulResults env expressions =
    [value | Right value <- map (eval env) expressions]


-- Count successful and failed evaluations
countResults :: Env -> [Expr] -> (Int, Int)
countResults env expressions =
    foldr count (0, 0) (map (eval env) expressions)
    where
        count (Right _) (successes, failures) =
            (successes + 1, failures)

        count (Left _) (successes, failures) =
            (successes, failures + 1)