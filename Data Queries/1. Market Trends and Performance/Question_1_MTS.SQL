SELECT neighbourhood,
       AVG(price::numeric) AS average_daily_rate,
	   AVG(latitude) AS avg_lat,
	   AVG(longitude) AS avg_long
FROM listings
GROUP BY neighbourhood
ORDER BY average_daily_rate DESC;

-- Using this query I am able to calculate the average price (converted to a numeric type) for listings in each neighborhood, giving you the ADR. 
-- I also included the Latitude and Longitude to better map the area in case I want to add mapping to my Tableau dashboard for this question. 
