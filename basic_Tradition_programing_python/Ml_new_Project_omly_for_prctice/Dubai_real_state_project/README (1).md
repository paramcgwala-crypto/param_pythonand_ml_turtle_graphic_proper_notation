# Dubai Real Estate: Price and Deal Prediction

An end-to-end machine learning project on Dubai Land Department property transactions (January to 7 November 2026). It predicts the **price per sq.m** of a property, flags **"good deals"**, and groups **areas into segments** with an investment score.

## What this project does

| # | Task | Type | Models |
|---|------|------|--------|
| 1 | Predict price per sq.m | Regression | Linear Regression, Decision Tree, Random Forest |
| 2 | Detect a "Good Deal" | Classification | Logistic Regression, Decision Tree, Random Forest |
| 3 | Group areas and score them | Clustering | K-Means |

**Good Deal definition:** a deal is a Good Deal if its price per sq.m is at least 10% below the median of its peers (same area, property type and number of rooms).

## Data

- Source: Dubai Land Department transactions (`Dubai_Realstate_transactions-2026-11-07.csv`)
- Raw data: 186,662 rows, 23 columns
- After cleaning: **114,069 residential sales**

### Cleaning steps
1. Kept only real buy/sell deals (removed mortgages, gifts and grants)
2. Kept only residential Flats, Villas and Hotel Apartments
3. Removed very small or very large areas and zero prices
4. Removed duplicate transactions
5. Removed extreme price-per-sq.m outliers (bottom 1% and top 1%)

## Feature engineering

- `log_area`, `month_idx` (time), `has_parking`
- Peer features: `size_vs_peer`, `size_vs_project`, `peer_count`
- Small projects (fewer than 50 sales) grouped as "Other"
- Trees use label-coded categories; linear models use one-hot encoding and scaled numbers

## Train / test split

The data is split **by date, not randomly**: the oldest 90% is used for training and the **latest 10% (30 Sep to 7 Nov 2026) is the test set**. This mimics real life (learn from the past, predict the future) and avoids data leakage.

## Results (on unseen test deals)

### Regression: price per sq.m

| Model | R2 | Median error | Within 20% |
|-------|----|--------------|------------|
| Linear Regression | 0.791 | 8.0% | 84.3% |
| Decision Tree | 0.774 | 6.5% | 84.3% |
| **Random Forest (tuned)** | **0.816** | **5.7%** | **86.8%** |

Random Forest was tuned with `RandomizedSearchCV` (3-fold cross-validation, CV R2 0.854).

### Classification: Good Deal

About 24% of deals are Good Deals (imbalanced data), so `class_weight` was used and accuracy alone was not trusted.

| Model | Accuracy | Precision | Recall | F1 |
|-------|----------|-----------|--------|----|
| Logistic Regression | 0.714 | 0.491 | 0.838 | 0.619 |
| Decision Tree | 0.721 | 0.499 | 0.796 | 0.613 |
| **Random Forest (threshold 0.6)** | **0.829** | **0.685** | **0.709** | **0.697** |

### Clustering: area segments (K-Means, K = 4)

97 areas (with 100+ sales) were grouped into: **Luxury / premium**, **Affordable high-volume**, **Ready communities** and **Off-plan hotspots**. Each area also gets an **investment score** (30% liquidity, 25% price growth, 25% price stability, 25% value vs its cluster).

## Project structure

```
.
├── Dubai_RealEstate_ML_11.ipynb              # full notebook
├── Dubai_Realstate_transactions-2026-11-07.csv   # data (add this file to run)
├── models/
│   ├── price_regressor.joblib
│   ├── good_deal_classifier.joblib
│   ├── area_kmeans.joblib
│   ├── feature_info.joblib
│   ├── area_ranking.csv
│   ├── regression_results.csv
│   └── classification_results.csv
└── README.md
```

## How to run

```bash
pip install numpy pandas matplotlib seaborn scikit-learn joblib jupyter
jupyter notebook Dubai_RealEstate_ML_11.ipynb
```

Place the CSV file in the same folder as the notebook, then run all cells.

## Tech stack

Python, pandas, NumPy, scikit-learn, Matplotlib, Seaborn, joblib

## Limitations

- Only about 10 months of data from a single year, so seasonality and long-term trends are not captured. Price growth is a weak signal, not a forecast.
- No rent data, so rental yield and ROI cannot be calculated.
- The Good Deal label comes from peer comparison, not real returns. Unit details such as floor and view are missing, so precision stays near 70%.
- The investment score is a heuristic and is not trained on any financial return.

## Future work

- Add rental data (for example from Dubai Pulse) to compute yield
- Add more years of data
- Build a backend `predict()` function and a small web app using the saved models

## Author

**Parmeet Singh**: Aspiring Machine Learning Engineer
GitHub: [paramcgwala-crypto](https://github.com/paramcgwala-crypto)
