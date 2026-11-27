# Dubai Property Price Prediction

Estimates the **price per sq.m** of residential property in Dubai from 2026 Dubai Land Department transactions.

**Live demo:** https://dubai-price-predictor.streamlit.app/

## What the app does

- Choose area, project, property type, rooms and off-plan/ready status
- Enter size and parking to get an estimated price per sq.m and total price
- Optionally enter an asking price: it is flagged as a **Good Deal** if its price per sq.m is at least 10% below the median of similar deals (same area, type and rooms). This is a rule, not a model prediction.

## Data

- Dubai Land Department transactions, January to November 2026
- Raw data: 186,662 rows and 23 columns
- After cleaning: **114,069 sales** (residential flats, villas and hotel apartments, 15 to 1000 sq.m, top and bottom 1% of price per sq.m removed)

## Method

- Target: log of price per sq.m
- Time-based split: oldest 90% for training, newest 10% for testing (11,407 deals, 30 Sep to 7 Nov 2026)
- 15 features, including location, project, property type, size and peer-group comparisons

## Price prediction results (test data)

| Model                                 | R² (log price) | Median error | Within 20%   |
| ------------------------------------- | -------------- | ------------ | ------------ |
| Linear Regression                     | 0.791          | 8.0%         | 84.3%        |
| Decision Tree                         | 0.774          | 6.5%         | 84.3%        |
| Random Forest (tuned)                 | 0.816          | 5.7%         | 86.8%        |
| **Random Forest (deployed, smaller)** | **0.815**      | **5.8%**     | not measured |

The deployed model uses fewer, shallower trees to keep the file small. It is retrained on all cleaned data after being scored on the test split.

## Other analysis in the notebook

- **Good Deal classifier** (Random Forest, threshold 0.6): accuracy 0.829, precision 0.685, recall 0.709, F1 0.697. Not used in the app.
- **Area clustering:** K-Means (K=4) on areas with at least 100 sales, plus a heuristic investment score.

## Limitations

- **Some data leakage:** peer-group statistics, project size medians, the rare-project grouping and the Good Deal label were computed on the full dataset, including test rows. The scores above may be optimistic.
- Only about 10 months of data, so this is not a price forecast.
- No floor, view or rent data.
- Expensive properties (above roughly AED 35,000 per sq.m) tend to be under-predicted.
- Learning project, not investment advice.

## Run locally

From this project folder:

```bash
pip install -r Deploy/requirements.txt
python -m streamlit run Deploy/app.py
```

## Files

- `Dubai_RealEstate_ML_11.ipynb`: cleaning, analysis and models
- `Deploy/app.py`: Streamlit app
- `Deploy/model.pkl`: deployed model and lookup tables
- `Deploy/export_cell.py`: creates the model file (run in the notebook with `%run -i Deploy/export_cell.py`)

## Tech stack

Python, pandas, NumPy, scikit-learn, seaborn, Matplotlib, Streamlit
