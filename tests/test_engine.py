from engine.cost_calculator import calculate_cost
from engine.carbon_calc import carbon_from_kwh

def test_cost_basic():
    r = calculate_cost(10)
    assert r["usd"] == 10
    assert r["aed"] > 0
    assert r["aed_with_vat"] > r["aed"]

def test_carbon_basic():
    r = carbon_from_kwh(100)
    assert r["kwh"] == 100
    assert r["co2_kg"] > 0
