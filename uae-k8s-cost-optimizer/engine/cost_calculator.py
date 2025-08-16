from .utils import get_env_float

def calculate_cost(usd_cost: float) -> dict:
    aed_rate = get_env_float("AED_RATE", 3.6725)
    vat_rate = get_env_float("VAT_RATE", 0.05)
    aed = usd_cost * aed_rate
    aed_with_vat = aed * (1 + vat_rate)
    return {"usd": usd_cost, "aed": aed, "vat_rate": vat_rate, "aed_with_vat": aed_with_vat}
