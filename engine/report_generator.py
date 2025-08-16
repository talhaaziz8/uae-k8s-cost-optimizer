#!/usr/bin/env python3
import argparse
import os
from dotenv import load_dotenv
from .cost_calculator import calculate_cost
from .carbon_calc import carbon_from_kwh

def make_reports(usd, kwh):
    cost = calculate_cost(usd)
    carbon = carbon_from_kwh(kwh)
    report_en = f"Cost: {cost}\nCarbon: {carbon}"
    report_ar = f"التكلفة: {cost}\nالكربون: {carbon}"
    return report_en, report_ar

def main():
    load_dotenv()
    parser = argparse.ArgumentParser()
    parser.add_argument("--usd", type=float, required=True)
    parser.add_argument("--kwh", type=float, required=True)
    parser.add_argument("--out", type=str, default="")
    args = parser.parse_args()
    en, ar = make_reports(args.usd, args.kwh)
    if args.out:
        with open(args.out, "w", encoding="utf-8") as f:
            f.write(en + "\n---\n\n" + ar)
        print(f"Saved report → {args.out}")
    else:
        print(en)
        print("---")
        print(ar)

if __name__ == "__main__":
    main()
