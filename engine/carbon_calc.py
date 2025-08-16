from .utils import get_env_float

def carbon_from_kwh(kwh: float) -> dict:
    grid_factor = get_env_float("GRID_CO2_KG_PER_KWH", 0.42)
    tree_absorb = get_env_float("TREE_CO2_KG_PER_YEAR", 21)
    co2_kg = kwh * grid_factor
    trees = co2_kg / tree_absorb
    return {"kwh": kwh, "co2_kg": co2_kg, "trees_equivalent": trees}
