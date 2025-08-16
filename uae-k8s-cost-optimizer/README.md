# 🇦🇪 UAE‑Focused Kubernetes Cost Optimizer

> **Tagline:** Cost, carbon, and culture‑aware optimization for Kubernetes in the GCC — with AED + VAT, Ramadan‑aware scaling, and bilingual reports.

![Project Banner](assets/hero.png)

---

## 🔑 Highlights

* **AED cost reporting** with **5% VAT** breakdown (configurable)
* **Ramadan‑aware auto‑scaling** windows (Iftar & Suhoor)
* **Carbon footprint** calculator (kgCO₂ → **trees equivalence**)
* **Khazna Cloud** benchmark section (data placeholders + methodology)
* **Bilingual** outputs (English / العربية)
* **ARM‑friendly** local dev (Apple Silicon / Raspberry Pi)
* **Budget mode**: spin up EKS (me‑south‑1) briefly → screenshot → **destroy**

---

## 🗂 Repository Structure

```
uae-k8s-cost-optimizer/
│── assets/                 # Logos, banners, screenshots
│── cluster/                # EKS config (me-south-1, Spot)
│   └── cluster.yaml
│── monitoring/             # Prometheus & Grafana (values.yaml)
│── engine/                 # Python analysis engine
│   ├── cost_calculator.py
│   ├── carbon_calc.py
│   └── report_generator.py
│── cronjobs/               # K8s CronJob for daily run
│   └── optimizer-cron.yaml
│── docs/                   # Architecture, notes, benchmarks
│── README.md               # This file
```

---

## 📸 Demo (to be added later)

* [ ] **AED + VAT** savings report (screenshot)
* [ ] **CO₂ → trees** chart (screenshot)
* [ ] **Grafana** panel snapshot
* [ ] **EKS** nodes showing **Spot** instances (kubectl get nodes)

> Place all images in `assets/` and update links above.

---

## 🧭 Why This Project (1‑minute read)

Cloud cost is business; culture and sustainability matter too. This tool demonstrates:

* Localization (**AED + VAT**, bilingual reports)
* Culture‑aware ops (**Ramadan windows**)
* Green IT (**carbon & trees**)
* Practical FinOps on **EKS** with **Spot** + monitoring

Perfect for a DevOps/FinOps portfolio in the **UAE/GCC** market.

---

## ⚙️ Quickstart (Local — No AWS yet)

**Requirements:** Python 3.10+, `pip`, optional: Apple Silicon/ARM okay

```bash
python -m venv .venv
source .venv/bin/activate      # Windows: .venv\\Scripts\\activate
pip install -r requirements.txt
python engine/report_generator.py
```

**Environment (optional)** — create `.env` (values can be overridden via CLI later):

```
AED_RATE=3.6725
VAT_RATE=0.05
TIMEZONE=Asia/Dubai
RAMADAN_WINDOWS=18:30-21:00,03:30-05:30
TREE_CO2_KG_PER_YEAR=21
GRID_CO2_KG_PER_KWH=0.42
```

> **Note:** USD→AED is pegged; still exposed for flexibility.

---

## 🧪 Simulate Data (Before Cluster)

Run the engine with sample values:

```bash
python engine/report_generator.py --usd 12.35 --kwh 97 --out reports/report_$(date +%F).md
```

Outputs bilingual report with cost + VAT and CO₂→trees.

---

## ☁️ Deploy (Later) on AWS EKS — Budget Mode

> **Goal:** create cluster, take screenshots, destroy everything.

1. Create cluster (Spot, Bahrain):

```bash
eksctl create cluster -f cluster/cluster.yaml
```

2. Install monitoring (Prometheus/Grafana) via Helm (add files under `monitoring/`).
3. Apply CronJob to run the Python engine daily:

```bash
kubectl apply -f cronjobs/optimizer-cron.yaml
```

4. Take screenshots → push to repo.
5. **Destroy resources**:

```bash
eksctl delete cluster -f cluster/cluster.yaml
```

> Estimated cost for a short session (2–3h): well under **\$5** if destroyed promptly.

---

## 🧩 How It Works

1. **Collect/Simulate metrics** (cluster usage → CPU hrs/kWh)
2. **Cost engine** converts USD → AED and adds **VAT**
3. **Carbon engine** maps energy → kgCO₂ → **trees**
4. **Ramadan windows** modulate scaling schedules
5. **Reports** generated in **English + Arabic** (Markdown/JSON)

---

## 🔧 Configuration

| Key                    |                 Default | Description                  |
| ---------------------- | ----------------------: | ---------------------------- |
| `AED_RATE`             |                  3.6725 | USD→AED peg                  |
| `VAT_RATE`             |                    0.05 | 5% VAT (configurable)        |
| `TIMEZONE`             |              Asia/Dubai | Report & cron windows        |
| `RAMADAN_WINDOWS`      | 18:30-21:00,03:30-05:30 | Iftar/Suhoor scaling windows |
| `TREE_CO2_KG_PER_YEAR` |                      21 | Tree absorption per year     |
| `GRID_CO2_KG_PER_KWH`  |                    0.42 | Emissions factor             |

> For Ramadan actual dates, see `docs/ramadan.md` and update windows.

---

## 🧱 Tech Stack

* **Python** (analysis engine)
* **Kubernetes** CronJob / HPA (logic layer)
* **Prometheus + Grafana** (metrics & dashboards)
* **AWS EKS** (Bahrain / me‑south‑1, Spot)

---

## 📊 Benchmarks — Khazna Cloud (Placeholder)

* Add AED price references & assumptions in `docs/khazna-benchmark.md`
* Clearly state **source/date** and **normalization method** (vCPU, RAM, storage)

---

## 🔒 Cost Guardrails

* Run EKS **only for screenshots**
* Set **TTL** labels on namespaces (optional)
* Provide `delete` script example in `docs/cleanup.md`

---

## 🗺 Roadmap

* [ ] Polish Python engine CLI (`--usd`, `--kwh`, `--json`, `--out`)
* [ ] Read Prometheus metrics when cluster exists
* [ ] Ramadan schedule file + tests
* [ ] Grafana dashboard JSON export
* [ ] Arabic typography improvements
* [ ] Khazna benchmark doc

---

## 🌐 Bilingual Snapshot

<details>
<summary>Arabic (العربية)</summary>

**الهدف:** تقارير تكلفة بالدرهم مع ضريبة القيمة المضافة، وضبط التوسّع تلقائيًا خلال فترات الإفطار والسحور، وحساب البصمة الكربونية وتحويلها إلى مكافئ عدد الأشجار.

</details>

---

## 📣 Share / LinkedIn (Template)

> 🎉 Just launched my **UAE‑Focused Kubernetes Cost Optimizer**: AED + VAT reporting, Ramadan‑aware scaling, CO₂→trees, and Grafana — all on EKS Spot (Bahrain). Repo + screenshots inside.

* GitHub: `https://github.com/<you>/uae-k8s-cost-optimizer`
* Stack: Python • Kubernetes • Prometheus/Grafana • EKS (me‑south‑1)

---

## 📝 License

MIT (add LICENSE file)

---

## 👤 Author

**Talha Aziz** — DevOps/Cloud | UAE‑focused FinOps & Green IT

