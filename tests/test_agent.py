import pytest
from multi_tool_agent.agent import get_weather, get_current_time


def test_get_weather():
    response = get_weather("New York")
    assert response["status"] == "success"
    assert "sunny" in response["report"]

    response = get_weather("Unknown City")
    assert response["status"] == "error"
    assert "Weather information" in response["error_message"]

def test_get_current_time():
    response = get_current_time("New York")
    assert response["status"] == "success"
    assert "New York" in response["report"]

    response = get_current_time("Unknown City")
    assert response["status"] == "error"
    assert "don't have timezone information" in response["error_message"]
