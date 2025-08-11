SELECT 
    room_type,
	neighbourhood,
    AVG(price::numeric * (1 - (availability_365 / 365))) AS avg_revenue
FROM 
	listings
WHERE 
	availability_365 BETWEEN 10 AND 335  
GROUP BY 
	room_type,
	neighbourhood
ORDER BY 
	neighbourhood, 
	avg_revenue DESC;

-- This query is meant to display how property types in each neighbourhood perform based on their average revenue. 