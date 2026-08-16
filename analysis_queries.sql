-- ============================================================
-- Social Media Engagement Analysis
-- Dataset: Social Media Engagement Dataset (Kaggle)
-- Tool: MySQL 8.0 / MySQL Workbench
-- Author: Dhananjay
-- ============================================================

-- 1. Overall platform performance: which platform drives the most engagement?
SELECT platform,
       COUNT(*) AS total_posts,
       ROUND(AVG(engagement_rate), 4) AS avg_engagement_rate,
       SUM(likes_count + shares_count + comments_count) AS total_interactions
FROM engagement_data
GROUP BY platform
ORDER BY avg_engagement_rate DESC;


-- 2. Top 5 brands by total impressions
SELECT brand_name,
       SUM(impressions) AS total_impressions,
       SUM(likes_count + shares_count + comments_count) AS total_interactions
FROM engagement_data
GROUP BY brand_name
ORDER BY total_impressions DESC
LIMIT 5;


-- 3. Sentiment distribution by platform (% breakdown)
SELECT platform,
       sentiment_label,
       COUNT(*) AS post_count,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY platform), 2) AS pct_of_platform
FROM engagement_data
GROUP BY platform, sentiment_label
ORDER BY platform, pct_of_platform DESC;


-- 4. Top 3 performing posts per platform (window function: DENSE_RANK + PARTITION BY)
SELECT *
FROM (
    SELECT post_id, platform, brand_name, engagement_rate,
           DENSE_RANK() OVER (PARTITION BY platform ORDER BY engagement_rate DESC) AS rnk
    FROM engagement_data
) ranked
WHERE rnk <= 3;


-- 5. Top locations by toxicity score (brand safety angle)
SELECT location,
       COUNT(*) AS post_count,
       ROUND(AVG(toxicity_score), 3) AS avg_toxicity,
       ROUND(AVG(sentiment_score), 3) AS avg_sentiment
FROM engagement_data
GROUP BY location
HAVING post_count >= 5
ORDER BY avg_toxicity DESC
LIMIT 10;
