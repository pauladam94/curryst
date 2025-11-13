all: tests examples

tests:
    typst compile tests/tests.typ 'tests/test-{p}.png' --root .

examples:
    typst c examples/math-formula.typ -f svg --root .
    typst c examples/natural-deduction.typ -f svg --root .
    typst c examples/rule-as-premise.typ -f svg --root .
    typst c examples/rule-set.typ -f svg --root .
    typst c examples/usage.typ -f svg --root .

    


