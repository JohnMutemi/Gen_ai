# Jac Calculator – Step 5 and Step 6 Examples

- Step 5: `calc_step5.jac` (scale-agnostic calculator)
- Step 6: `calc_step6.jac` (AI-enhanced calculator explanations via byLLM)

## Prerequisites
- Python 3.10+
- Jac toolchain: `pip install jaclang`
- For Step 6 AI explanations:
  - `pip install byllm`
  - Configure provider credentials (e.g., environment variables). Default uses `gemini/gemini-2.0-flash` in `calc_step6.jac`.

## WSL setup (Ubuntu)
```bash
sudo apt update && sudo apt install -y python3 python3-venv python3-pip
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install jaclang byllm
```
Then run the commands in the sections below from the activated venv.

## Files
- `calc_step5.jac` – Walker/node declarations, CLI entry
- `calc_step5.impl.jac` – Implementation (start/compute)
- `calc_step6.jac` – Declarations plus LLM model and `explain` ability
- `calc_step6.impl.jac` – Implementation with AI explanation

## Run locally (CLI)
From the project root:

```bash
jac run calc_step5.jac
```

and

```bash
jac run calc_step6.jac
```

You will see demo computations printed. In Step 6, if credentials are set, an LLM explanation follows the result.

## Serve as HTTP APIs
Either file can be served to expose walker abilities as endpoints:

```bash
jac serve calc_step5.jac
```

or

```bash
jac serve calc_step6.jac
```

Typical flow (exact routes may vary by jac version):
- `POST /spawn/Calculator` or `POST /spawn/CalculatorAI` with body `{"args": [op, a, b]}`
- `POST /call/Calculator/start` then `POST /call/Calculator/compute`
- Same for `CalculatorAI`

Use `jac serve --help` for your installed version to see precise routes.

## Choose LLM Provider and API keys (Step 6)
Edit `calc_step6.jac` and pick a provider:

```jac
# glob llm = byllm.llm.Model(model_name="gpt-4o", verbose=False);
glob llm = byllm.llm.Model(model_name="gemini/gemini-2.0-flash", verbose=False);
```

Set the provider credentials before running (examples):

WSL/Linux/macOS:
```bash
# Gemini
export GOOGLE_API_KEY="YOUR_KEY"

# OpenAI
export OPENAI_API_KEY="YOUR_KEY"
```

PowerShell (Windows):
```powershell
# Gemini
$Env:GOOGLE_API_KEY = "YOUR_KEY"

# OpenAI
$Env:OPENAI_API_KEY = "YOUR_KEY"
```

Then run `jac run calc_step6.jac`.

## Notes
- The CLI `with entry:__main__` blocks only run in `jac run` mode, not in server mode.
- Operations supported: add, sub, mul, div (div checks division by zero).
