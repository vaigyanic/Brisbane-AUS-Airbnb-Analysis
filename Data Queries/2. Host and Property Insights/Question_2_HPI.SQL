-- Average price per day by Neighbourhoood
SELECT 
    calendar.date,
	l.neighbourhood,
    AVG(calendar.price) AS avg_price
FROM 
    listings l
JOIN 
    calendar ON l.id = calendar.listing_id
GROUP BY 
    calendar.date,l.neighbourhood
ORDER BY 
    2,1;