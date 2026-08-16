# Social Media Engagement Analysis (SQL)

SQL analysis of a social media engagement dataset covering brand campaigns
across five platforms (Instagram, Facebook, Twitter, Reddit, YouTube) —
exploring which platforms perform best, which brands convert reach into
engagement most efficiently, and where brand-safety risk (toxicity) is
highest by region.

**Tools:** MySQL 8.0, MySQL Workbench
**Dataset:** [Social Media Engagement Dataset (Kaggle)](https://www.kaggle.com/datasets/subashmaster0411/social-media-engagement-dataset/data)

## Key Questions Explored
- Which platform delivers the highest average engagement rate?
- Which brands are most efficient at converting impressions into interactions?
- Does sentiment (positive/negative/neutral) vary by platform?
- Which specific posts and brands top the charts on each platform?
- Which locations carry the highest brand-safety (toxicity) risk?

## Key Findings

- **Instagram leads engagement**, edging out Facebook and YouTube, and
  outperforming Twitter by ~11% (0.2871 vs 0.2593 average engagement rate)
  despite all platforms carrying a similar post volume (~2,350–2,430 posts each).

- **Adidas converts reach into engagement more efficiently than Microsoft.**
  Microsoft leads on raw impressions (62.66M), but Adidas generates nearly
  identical total interactions (4.93M vs 4.87M) from 1.4% fewer impressions —
  a sign of stronger content quality over sheer reach.

- **Sentiment is platform-agnostic.** The positive/negative/neutral split is
  nearly identical across all five platforms (roughly 40% negative, 40%
  positive, 19% neutral everywhere), suggesting audience sentiment is driven
  by brand and content rather than which platform a post appears on.

- **Brand-safety risk clusters geographically.** Lagos, Mumbai, and São Paulo
  post the highest average toxicity scores (0.53, 0.53, 0.53) among locations
  with 5+ posts, while average sentiment in those same regions stays close to
  neutral — flagging them as regions worth extra content moderation attention.

- **Top-post analysis surfaces platform champions individually** — e.g. Nike's
  top Instagram post hit a 30.43% engagement rate, more than double the next
  platform's leading post, showing outsized single-post performance is
  possible even in a fairly flat platform-level landscape.

## Techniques Used
- Aggregate functions (`AVG`, `SUM`, `COUNT`)
- Window functions (`DENSE_RANK() OVER (PARTITION BY ...)`, running percentage
  via `SUM(COUNT(*)) OVER (PARTITION BY ...)`)
- `GROUP BY` with `HAVING` for filtered aggregation (min post count threshold)
- Top-N-per-group filtering using subqueries
- Percentage-of-total calculations within groups

## Files
- `analysis_queries.sql` — all 5 queries with comments
- Dataset available on Kaggle (not included here — see link above)

## Author
Dhananjay
