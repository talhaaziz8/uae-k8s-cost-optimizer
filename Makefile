# Makefile for UAE Kubernetes Cost Optimizer

# Activate venv automatically
VENV=.venv

.PHONY: venv install report clean

# Create & activate virtual environment
venv:
	python3 -m venv $(VENV)
	@echo "Virtual environment created. Activate with: source $(VENV)/bin/activate"

# Install Python dependencies
install:
	$(VENV)/bin/pip install python-dotenv
	$(VENV)/bin/pip freeze > requirements.txt

# Run a sample report
report:
	$(VENV)/bin/python -m engine.report_generator --usd 12.35 --kwh 97 --out docs/demo_report.md

# Clean generated files
clean:
	rm -f docs/demo_report.md
