--Average Price per day by listing property type and neighbourhood. 
SELECT 
	l.neighbourhood,
	l.room_type,
	c.date,
	AVG(l.price) as avg_price
FROM 
	listings l
JOIN 
	calendar c ON l.id = c.listing_id
GROUP By 
	l.neighbourhood,
	l.room_type,
	c.date
ORDER BY 
	l.neighbourhood;