module Main where

import Expr
import Eval
import Simplify
import Batch


main :: IO ()
main = do

    putStrLn "=============================================="
    putStrLn " EC8206 Functional Programming Project"
    putStrLn " Arithmetic Expression Interpreter"
    putStrLn "=============================================="


    -- Test 1
    putStrLn "\nTest 1: Numeric addition"

    let expr1 = Add (Lit 5) (Lit 3)

    putStrLn "Expression: 5 + 3"
    putStrLn "Expected: Right 8.0"
    putStr "Actual:   "
    print (eval [] expr1)


    -- Test 2
    putStrLn "\nTest 2: Variable evaluation"

    let env2 = [("x", 10)]
    let expr2 = Add (Var "x") (Lit 5)

    putStrLn "Expression: x + 5"
    putStrLn "Environment: x = 10"
    putStrLn "Expected: Right 15.0"
    putStr "Actual:   "
    print (eval env2 expr2)


    -- Test 3
    putStrLn "\nTest 3: Division"

    let expr3 = Div (Lit 20) (Lit 4)

    putStrLn "Expression: 20 / 4"
    putStrLn "Expected: Right 5.0"
    putStr "Actual:   "
    print (eval [] expr3)


    -- Test 4
    putStrLn "\nTest 4: Division by zero"

    let expr4 = Div (Lit 20) (Lit 0)

    putStrLn "Expression: 20 / 0"
    putStrLn "Expected: Left \"Division by zero\""
    putStr "Actual:   "
    print (eval [] expr4)


    -- Test 5
    putStrLn "\nTest 5: Undefined variable"

    let expr5 = Add (Var "y") (Lit 5)

    putStrLn "Expression: y + 5"
    putStrLn "Environment: empty"
    putStrLn "Expected: Left \"Undefined variable\""
    putStr "Actual:   "
    print (eval [] expr5)


    -- Test 6
    putStrLn "\nTest 6: Let expression"

    let expr6 =
            Let "x"
                (Lit 10)
                (Add (Var "x") (Lit 5))

    putStrLn "Expression: let x = 10 in x + 5"
    putStrLn "Expected: Right 15.0"
    putStr "Actual:   "
    print (eval [] expr6)


    -- Test 7
    putStrLn "\nTest 7: Simplification"

    let expr7 =
            Add
                (Mul (Var "x") (Lit 1))
                (Lit 0)

    putStrLn "Expression: (x * 1) + 0"
    putStrLn "Expected simplified form: x"
    putStr "Actual:   "
    print (simplify expr7)


    -- Test 8
    putStrLn "\nTest 8: Batch evaluation"

    let expressions =
            [ Add (Var "x") (Lit 5)
            , Mul (Lit 2) (Lit 3)
            , Var "y"
            , Div (Lit 10) (Lit 0)
            ]

    let env8 = [("x", 10)]

    putStrLn "Expressions:"
    putStrLn "1. x + 5"
    putStrLn "2. 2 * 3"
    putStrLn "3. y"
    putStrLn "4. 10 / 0"

    putStrLn "\nExpected:"
    putStrLn "[Right 15.0, Right 6.0, Left \"Undefined variable\", Left \"Division by zero\"]"

    putStrLn "\nActual:"
    print (evalBatch env8 expressions)


    -- Test 9
    putStrLn "\nTest 9: Successful results"

    putStrLn "Expected: [15.0, 6.0]"
    putStr "Actual:   "
    print (successfulResults env8 expressions)


    -- Test 10
    putStrLn "\nTest 10: Success/failure count"

    putStrLn "Expected: (2,2)"
    putStr "Actual:   "
    print (countResults env8 expressions)


    putStrLn "\n=============================================="
    putStrLn "All tests completed."
    putStrLn "=============================================="