# OTT Streaming Content Trend Analysis 📺

## 📌 Project Overview

This project explores the Netflix streaming content catalog to identify patterns and trends in genre popularity, content ratings, release years, regional distribution, and content duration.

The objective is to transform raw catalog data into meaningful business insights that can help streaming platforms make better content acquisition and strategy decisions.

## 🎯 Project Objectives

- Analyze popular content genres.
- Understand the distribution of Movies and TV Shows.
- Explore content ratings and classifications.
- Identify release-year and content addition trends.
- Analyze regional content distribution.
- Study movie runtime patterns.
- Develop actionable content strategy recommendations.

## 🛠️ Tools & Technologies

- **Python**
- **Pandas** – Data cleaning and manipulation
- **Matplotlib** – Data visualization
- **Seaborn** – Statistical visualization
- **SQL** – Data aggregation and analysis
- **Excel** – Data exploration

## 📊 Key Analysis

1. Content distribution by type (Movies vs TV Shows).
2. Top 15 popular genres.
3. Content rating distribution.
4. Content release trends by year.
5. Netflix content addition trends.
6. Regional content distribution.
7. Movie runtime analysis.
8. Genre distribution by content type.

## 📁 Project Structure

```text
OTT-Streaming-Content-Trend-Analysis/
│
├── data/
│   ├── netflix_titles_clean.csv
│   ├── title_genres.csv
│   └── title_countries.csv
│
├── notebooks/
│   └── ott_content_trend_eda.ipynb
│
├── sql/
│   └── ott_analysis_queries.sql
│
├── reports/
│   └── content_strategy_memo_template.md
│
├── requirements.txt
└── README.md
```

## 📂 Dataset

**Source:** Netflix Movies and TV Shows Dataset (TidyTuesday, April 20, 2021).

[View Dataset](https://github.com/rfordatascience/tidytuesday/tree/main/data/2021/2021-04-20)

The dataset contains information about:
- Title
- Content type
- Director
- Cast
- Country
- Release year
- Content rating
- Duration
- Genre
- Date added

## 🚀 How to Run This Project

**Step 1: Clone the repository**

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

**Step 2: Install dependencies**

```bash
pip install -r requirements.txt
```

**Step 3: Open Jupyter Notebook**

```bash
jupyter notebook
```

**Step 4:** Open `notebooks/ott_content_trend_eda.ipynb` and run all cells.

The notebook downloads the dataset on its first run and generates
