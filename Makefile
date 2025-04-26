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
	pylint --disable=R,C multi_tool_agent.agent
	
format:
	python -m black multi_tool_agent/

all: install format lint test