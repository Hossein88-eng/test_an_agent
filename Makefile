setup:
	python -m venv .venv
	#virtualenv ~\.venv
	#source ~\.venv\bin\activate

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest --cov=multi_tool_agent --cov=tests --cov-report=term-missing

lint:
	pylint --disable=R,C /workspaces/test_an_agent/multi_tool_agent/agent.py
	python -m black --check /workspaces/test_an_agent/multi_tool_agent/agent.py
	python -m isort --check-only /workspaces/test_an_agent/multi_tool_agent/agent.py

format:
	python -m black /workspaces/test_an_agent/multi_tool_agent/agent.py
	python -m isort /workspaces/test_an_agent/multi_tool_agent/agent.py


all: install format lint test