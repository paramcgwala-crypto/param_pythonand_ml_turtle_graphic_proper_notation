# Ise notebook ke END mein naye cell mein paste karke chalao
import os, joblib, sklearn, numpy, pandas
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import r2_score

os.makedirs("deploy", exist_ok=True)
# chhota model, taaki file GitHub aur free hosting par chal sake
small = dict(n_estimators=60, min_samples_leaf=8, max_features=0.6, max_depth=22, n_jobs=-1, random_state=0)

test_model = RandomForestRegressor(**small).fit(X_tree_train, y_train)
pred = np.exp(test_model.predict(X_tree_test)); actual = df.loc[test_idx, "ppsm"]
err = (pred - actual).abs() / actual
print("Deploy model R2:", round(r2_score(y_test, np.log(pred)), 3),
      "| Median error %:", round(100 * err.median(), 1))

deploy_model = RandomForestRegressor(**small).fit(X_tree, y)

keys = ["AREA_EN", "PROJECT_EN", "PROP_SB_TYPE_EN", "ROOMS_EN", "IS_OFFPLAN_EN"]
extra = ["IS_FREE_HOLD_EN", "NEAREST_METRO_EN", "NEAREST_MALL_EN", "NEAREST_LANDMARK_EN"]
combos = df.groupby(keys + extra, dropna=False).size().reset_index(name="n")
combos = combos.sort_values("n", ascending=False).drop_duplicates(keys)

joblib.dump({
    "model": deploy_model,
    "features": list(X_tree.columns),
    "cat_cols": cat_cols,
    "maps": {c: {v: i for i, v in enumerate(df[c].astype("category").cat.categories)} for c in cat_cols},
    "combos": combos,
    "peer": df.groupby(peer).agg(area=("ACTUAL_AREA", "median"), count=("ppsm", "size"), ppsm=("ppsm", "median")),
    "project_area": df.groupby("PROJECT_EN")["ACTUAL_AREA"].median(),
    "month_idx": float(df["month_idx"].max()),
}, "deploy/model.pkl", compress=("xz", 3))

with open("deploy/requirements.txt", "w") as f:
    f.write(f"streamlit\njoblib=={joblib.__version__}\nnumpy=={numpy.__version__}\n"
            f"pandas=={pandas.__version__}\nscikit-learn=={sklearn.__version__}\n")
print("model.pkl size (MB):", round(os.path.getsize("deploy/model.pkl") / 1e6, 1))
