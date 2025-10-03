"""Calculator (Step 6 – AI-Enhanced byLLM)"""

import byllm.llm;

# Choose an LLM (configure credentials per provider)
# glob llm = Model(model_name="gpt-4o", verbose=False);
glob llm = byllm.llm.Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Explain the computation in a helpful, friendly way"""
def explain(op: str, a: float, b: float, result: float) -> str by llm();

walker CalculatorAI {
    has op: str, a: float, b: float;

    can start with `root entry;
    can compute with task entry;
}

node task {}

# CLI mode only
with entry:__main__ {
    root spawn CalculatorAI("add", 12, 30);
    root spawn CalculatorAI("sub", 100, 33);
    root spawn CalculatorAI("mul", 9, 9);
    root spawn CalculatorAI("div", 144, 12);
}


