# EC8206 – Functional Programming Project

## Arithmetic Expression Interpreter

A Haskell-based arithmetic expression interpreter developed for the **EC8206 – Functional Programming** module at the **University of Ruhuna**.

### Features

* Algebraic Data Types (ADTs)
* Pattern matching & recursion
* Variables and arithmetic operations
* `Let` expressions
* Error handling using `Either`
* Expression simplification
* Higher-order functions (`map`, `foldr`)
* Currying / partial application
* Immutable data handling

### Project Structure

```text
├── src/
│   ├── Expr.hs
│   ├── Eval.hs
│   ├── Simplify.hs
│   └── Batch.hs
├── app/
│   └── Main.hs
├── .gitignore
└── README.md
```

### Run

Compile:

```bash
ghc -isrc app/Main.hs
```

Run:

```bash
./app/Main
```

**Windows:**

```powershell
.\app\Main.exe
```

### Example

```haskell
eval [] (Add (Lit 5) (Lit 3))
```

Output:

```text
Right 8.0
```

### Module

**EC8206 – Functional Programming**
Department of Electrical and Information Engineering
University of Ruhuna

### Author

**Oshani Ranathunga**
