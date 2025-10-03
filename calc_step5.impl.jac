"""Implementation for Calculator Step 5"""

impl Calculator.start {
    print("Calculator (server/cli ready)");
    visit [--> task];
    # Perform computation immediately for CLI runs
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
    disengage;
}

impl Calculator.compute {
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
    disengage;
}


