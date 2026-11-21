# Content Strategy Memo — Netflix Catalog Snapshot

**To:** Content Acquisition & Strategy Team  
**From:** Data Analysis  
**Subject:** Catalog mix, genre concentration and regional opportunity

> The completed, data-populated memo is generated automatically by running all cells in `notebooks/ott_content_trend_eda.ipynb`. This template is provided as the deliverable source. The notebook writes `reports/content_strategy_memo.md` with measured counts and metrics.

## Three decisions to take to the acquisition team

1. **Protect breadth while auditing genre concentration.** Compare the most common catalog genres with first-party viewing hours, completion and acquisition cost. Do not equate catalog supply with audience demand.
2. **Build a regional acquisition shortlist.** Identify low-representation production markets, then validate audience demand, local-language opportunity, rights availability and cost. Multi-country titles are counted for each listed country.
3. **Segment slate planning by format and release window.** Compare movies and TV shows separately; evaluate runtime/season-length bands against engagement and cost. Treat `date_added` as a snapshot field, not a complete history of catalog additions.

## Required validation data
Viewing hours, unique viewers, completion, repeat viewing, subscriber impact, title costs, rights windows, marketing spend and complete catalog ingestion history.

## Limitations
This dataset is a historical Netflix catalog inventory. It does not contain viewer ratings scores, viewership, engagement, revenue, acquisition costs or other platform catalogs. It cannot support direct Netflix-vs-Prime-vs-Hotstar comparisons.
