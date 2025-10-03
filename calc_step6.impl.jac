"""Implementation for Calculator Step 6 (AI explanations)"""

impl CalculatorAI.start {
    print("AI Calculator (server/cli ready)");
    visit [--> task];
    # Perform computation immediately for CLI runs, then ask LLM to explain
    result = None;
    if self.op == "add" {
        result = self.a + self.b;
    } elif self.op == "sub" {
        result = self.a - self.b;
    } elif self.op == "mul" {
        result = self.a * self.b;
    } elif self.op == "div" {
        if self.b == 0 {
            print("Error: division by zero");
            disengage;
        }
        result = self.a / self.b;
    } else {
        print(f"Unknown op: {self.op}");
        disengage;
    }

    print(f"{self.op}({self.a}, {self.b}) = {result}");

    msg = explain(self.op, self.a, self.b, result);
    if msg != None {
        print(msg);
    }

    disengage;
}

impl CalculatorAI.compute {
    result = None;
    if self.op == "add" {
        result = self.a + self.b;
    } elif self.op == "sub" {
        result = self.a - self.b;
    } elif self.op == "mul" {
        result = self.a * self.b;
    } elif self.op == "div" {
        if self.b == 0 {
            print("Error: division by zero");
            disengage;
        }
        result = self.a / self.b;
    } else {
        print(f"Unknown op: {self.op}");
        disengage;
    }

    print(f"{self.op}({self.a}, {self.b}) = {result}");

    # Ask LLM to explain the computation
    msg = explain(self.op, self.a, self.b, result);
    if msg != None {
        print(msg);
    }

    disengage;
}


