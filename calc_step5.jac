"""Calculator (Step 5 – Scale Agnostic)"""

walker Calculator {
    has op: str, a: float, b: float;

    can start with `root entry;
    can compute with task entry;
}

node task {}

# CLI mode only
with entry:__main__ {
    # Some demo computations
    root spawn Calculator("add", 2, 3);
    root spawn Calculator("sub", 10, 4);
    root spawn Calculator("mul", 6, 7);
    root spawn Calculator("div", 22, 7);
}


