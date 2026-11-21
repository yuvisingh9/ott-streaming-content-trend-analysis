# OTT Streaming Content Trend Analysis

## Deliverables
- `notebooks/ott_content_trend_eda.ipynb` — end-to-end EDA with 8 visualizations, cleaning, feature engineering, SQL exports and auto-generated memo.
- `sql/ott_analysis_queries.sql` — SQLite-compatible schema and 12 core analytical queries.
- `reports/content_strategy_memo_template.md` — concise memo framework. The notebook generates a measured memo at `reports/content_strategy_memo.md`.
- `requirements.txt` — Python dependencies.

## Dataset
Netflix Movies and TV Shows catalog snapshot from TidyTuesday (2021-04-20):
https://github.com/rfordatascience/tidytuesday/blob/main/data/2021/2021-04-20/readme.md

Raw CSV:
https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2021/2021-04-20/netflix_titles.csv

The notebook downloads the CSV on first run. It retains missing descriptive values as `Unknown`, removes duplicate `show_id` values, parses dates and duration, and creates normalized genre and country bridge tables.

## Run
```bash
python -m pip install -r requirements.txt
jupyter notebook
```
Open `notebooks/ott_content_trend_eda.ipynb` and choose **Run All**. Internet is needed for the first download. The notebook saves cleaned CSVs to `data/` and generates the measured memo in `reports/`.

## SQL
After running the notebook, import these files into SQLite:
- `data/netflix_titles_clean.csv` → `titles`
- `data/title_genres.csv` → `title_genres`
- `data/title_countries.csv` → `title_countries`

Then execute `sql/ott_analysis_queries.sql`. If using a SQLite GUI, use its CSV import wizard and preserve the table names above.

## Interpretation guardrails
This is a historical single-platform catalog snapshot, not a current catalog and not an engagement dataset. Counts show catalog supply, not demand. Multi-genre and multi-country titles count in every associated category. No valid cross-platform Netflix/Prime/Hotstar comparison is possible from this dataset alone.
