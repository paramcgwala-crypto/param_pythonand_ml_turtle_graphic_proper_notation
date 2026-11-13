# Name That LLM: Kaun se LLM ne ye passage likha?

18 alag LLMs mein se passage ka author pehchanne ka classification project.

## Models

Logistic Regression, Decision Tree, Random Forest, KNN, Gaussian Naive Bayes

## Features

20 style features (length, punctuation, em-dash, curly quotes, markdown) + top 200 TF-IDF words

## Result

- Best model: Logistic Regression (test accuracy 27.9%)
- Random guess: 5.6%
- Random Forest sabse zyada overfit hua (train 100%, test 22.2%)

## Run kaise karein

pip install -r requirements.txt
jupyter notebook LLM_Project.ipynb
