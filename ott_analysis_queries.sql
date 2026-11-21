-- OTT Streaming Content Trend Analysis (SQLite-compatible)
-- Load netflix_titles_clean.csv into `titles`, title_genres.csv into `title_genres`,
-- and title_countries.csv into `title_countries` using your SQLite GUI/import wizard.
-- The Python notebook creates these three CSVs.

CREATE TABLE IF NOT EXISTS titles (
    show_id TEXT PRIMARY KEY,
    type TEXT,
    title TEXT,
    director TEXT,
    cast TEXT,
    country TEXT,
    date_added TEXT,
    release_year INTEGER,
    rating TEXT,
    duration TEXT,
    listed_in TEXT,
    description TEXT,
    date_added_year INTEGER,
    date_added_month INTEGER,
    date_added_month_name TEXT,
    duration_value REAL,
    duration_unit TEXT,
    primary_country TEXT
);
CREATE TABLE IF NOT EXISTS title_genres (show_id TEXT, genre TEXT);
CREATE TABLE IF NOT EXISTS title_countries (show_id TEXT, country TEXT);

-- 1. Catalog size and content-type split
SELECT type, COUNT(DISTINCT show_id) AS title_count
FROM titles GROUP BY type ORDER BY title_count DESC;

-- 2. Genre popularity (multi-genre titles count once in each listed genre)
SELECT genre, COUNT(DISTINCT show_id) AS title_count
FROM title_genres GROUP BY genre ORDER BY title_count DESC;

-- 3. Genre mix by content type
SELECT g.genre, t.type, COUNT(DISTINCT t.show_id) AS title_count
FROM titles t JOIN title_genres g USING (show_id)
GROUP BY g.genre, t.type ORDER BY g.genre, title_count DESC;

-- 4. Content rating distribution
SELECT rating, COUNT(DISTINCT show_id) AS title_count
FROM titles WHERE rating <> 'Unknown'
GROUP BY rating ORDER BY title_count DESC;

-- 5. Original release trend
SELECT release_year, COUNT(DISTINCT show_id) AS title_count
FROM titles WHERE release_year IS NOT NULL
GROUP BY release_year ORDER BY release_year;

-- 6. Netflix addition trend (only rows with a valid date_added)
SELECT date_added_year, COUNT(DISTINCT show_id) AS titles_added
FROM titles WHERE date_added_year IS NOT NULL
GROUP BY date_added_year ORDER BY date_added_year;

-- 7. Regional content mix; multi-country titles contribute to each country
SELECT country, COUNT(DISTINCT show_id) AS title_count
FROM title_countries GROUP BY country ORDER BY title_count DESC;

-- 8. Movie runtime summary (minutes only; TV seasons excluded)
SELECT COUNT(*) AS movie_count,
       ROUND(AVG(duration_value), 1) AS avg_runtime_minutes,
       MIN(duration_value) AS min_runtime_minutes,
       MAX(duration_value) AS max_runtime_minutes
FROM titles
WHERE type = 'Movie' AND duration_unit = 'minutes' AND duration_value IS NOT NULL;

-- 9. TV show season distribution
SELECT duration_value AS seasons, COUNT(DISTINCT show_id) AS show_count
FROM titles
WHERE type = 'TV Show' AND duration_unit = 'seasons' AND duration_value IS NOT NULL
GROUP BY duration_value ORDER BY seasons;

-- 10. Country x genre matrix for regional acquisition exploration
SELECT c.country, g.genre, COUNT(DISTINCT c.show_id) AS title_count
FROM title_countries c JOIN title_genres g USING (show_id)
GROUP BY c.country, g.genre
ORDER BY c.country, title_count DESC;

-- 11. Titles added by month (seasonality in this snapshot; interpret cautiously)
SELECT date_added_month, date_added_month_name,
       COUNT(DISTINCT show_id) AS titles_added
FROM titles WHERE date_added_month IS NOT NULL
GROUP BY date_added_month, date_added_month_name
ORDER BY date_added_month;

-- 12. Catalog age: gap between original release year and addition year
SELECT (date_added_year - release_year) AS years_since_release,
       COUNT(DISTINCT show_id) AS title_count
FROM titles
WHERE date_added_year IS NOT NULL AND release_year IS NOT NULL
GROUP BY years_since_release
ORDER BY years_since_release;
