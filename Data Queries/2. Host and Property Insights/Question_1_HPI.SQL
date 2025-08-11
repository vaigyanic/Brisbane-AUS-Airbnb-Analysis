-- Create a temporary table with occupancy and average rating
CREATE TEMPORARY TABLE temp_occupancy AS
WITH average_ratings AS (
    SELECT
        listing_id,
        AVG(star_rating) AS average_rating
    FROM
        review_sentiment
    GROUP BY
        listing_id
),
occupancy AS (
    SELECT
        c.listing_id,
        COUNT(*) AS total_days,
        SUM(CASE WHEN c.available = 0 THEN 1 ELSE 0 END) AS booked_days,
        SUM(CASE WHEN c.available = 0 THEN 1 ELSE 0 END)::FLOAT / COUNT(*)::FLOAT AS occupancy_rate,
        COALESCE(a.average_rating, 0) AS average_rating, 
        l.number_of_reviews
    FROM
        calendar c
    LEFT JOIN
        average_ratings a ON c.listing_id = a.listing_id
    LEFT JOIN
        listings l ON c.listing_id = l.id
    GROUP BY
        c.listing_id, l.number_of_reviews, a.average_rating
)
SELECT *
FROM occupancy;

-- Create Temp Table for calculations. 

SELECT 
	*
FROM 
	temp_occupancy
WHERE 
	booked_days Between 10 and 355
ORDER BY 
	average_rating DESC;

-- Select Temp occupancy table for Tableau visualization. 

-- Join occupancy with listings

SELECT
    l.id AS listing_id,
    l.number_of_reviews,
    l.reviews_per_month, 
    o.occupancy_rate
FROM
    listings l
JOIN
    temp_occupancy o ON l.id = o.listing_id;

-- Calculate correlations

SELECT
    CORR(number_of_reviews, reviews_per_month) AS reviews_rating_corr,
    CORR(number_of_reviews, occupancy_rate) AS reviews_occupancy_corr,
    CORR(reviews_per_month, occupancy_rate) AS rating_occupancy_corr
FROM (
    SELECT
        l.number_of_reviews,
        l.reviews_per_month,
        o.occupancy_rate
    FROM
        listings l
    JOIN
        temp_occupancy o ON l.id = o.listing_id
) AS correlations;

-- Calculate correlations between number of reviews, reviews per month and occupancy rate. 