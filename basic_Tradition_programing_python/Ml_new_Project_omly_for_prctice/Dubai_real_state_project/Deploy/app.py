from pathlib import Path

import joblib
import numpy as np
import pandas as pd
import streamlit as st

st.set_page_config(page_title="Dubai Property Price Predictor")


@st.cache_resource
def load_bundle():
    return joblib.load(Path(__file__).parent / "model.pkl")


b = load_bundle()

st.title("Dubai Property Price Predictor")
st.write("Property ki details chuno aur estimated price dekho.")

rows = b["combos"]
for col, label in [("AREA_EN", "Area"), ("PROJECT_EN", "Project"),
                   ("PROP_SB_TYPE_EN", "Property type"), ("ROOMS_EN", "Rooms"),
                   ("IS_OFFPLAN_EN", "Off-plan / Ready")]:
    choice = st.selectbox(label, sorted(rows[col].unique()))
    rows = rows[rows[col] == choice]
r = rows.iloc[0]

size = st.number_input("Size (sq.m)", min_value=15.0, max_value=1000.0, value=75.0)
parking = st.checkbox("Parking hai", value=True)
asking = st.number_input("Asking price (AED), optional", min_value=0.0, value=0.0, step=50000.0)

if st.button("Predict"):
    peer = b["peer"].loc[(r["AREA_EN"], r["PROP_SB_TYPE_EN"], r["ROOMS_EN"])]
    values = {c: b["maps"][c][r[c]] for c in b["cat_cols"]}
    values.update({
        "log_area": np.log(size),
        "month_idx": b["month_idx"],
        "has_parking": int(parking),
        "size_vs_peer": min(size / peer["area"], 5),
        "size_vs_project": min(size / b["project_area"][r["PROJECT_EN"]], 5),
        "peer_count": np.log(peer["count"]),
    })
    X = pd.DataFrame([values], columns=b["features"])
    ppsm = float(np.exp(b["model"].predict(X)[0]))

    st.metric("Estimated price per sq.m", f"AED {ppsm:,.0f}")
    st.metric("Estimated total price", f"AED {ppsm * size:,.0f}")

    if asking > 0:
        asking_ppsm = asking / size
        diff = (asking_ppsm / peer["ppsm"] - 1) * 100
        st.write(f"Similar deals (same area, type, rooms) ka median: AED {peer['ppsm']:,.0f} per sq.m, "
                 f"{int(peer['count'])} deals. Asking price median se {diff:+.1f}% par hai.")
        if peer["count"] < 20:
            st.warning("Similar deals kam hain, isliye comparison par zyada bharosa mat karo.")
        if asking_ppsm <= 0.90 * peer["ppsm"]:
            st.success("Good Deal: peers se 10% ya zyada sasta.")
        else:
            st.info("Good Deal rule (10% sasta) match nahi hua.")

st.caption("Learning project, 2026 ke Dubai Land Department data par. Ye investment advice nahi hai.")
