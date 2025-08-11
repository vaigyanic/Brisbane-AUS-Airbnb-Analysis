WITH similar_properties AS (
    SELECT 
        neighbourhood,
        room_type,
        AVG(price::numeric) AS avg_price
    FROM 
        listings
    GROUP BY 
        neighbourhood, room_type
),
price_comparison AS (
    SELECT 
        l.id AS listing_id,
        l.name,
        l.neighbourhood,
        l.room_type,
		l.latitude,
		l.longitude,
        l.price::numeric AS listing_price,
        sp.avg_price,

        ((l.price::numeric - sp.avg_price) / sp.avg_price) * 100 AS price_difference_percent
    FROM 
        listings l
    JOIN 
        similar_properties sp 
    ON 
        l.neighbourhood = sp.neighbourhood
        AND l.room_type = sp.room_type
)
SELECT 
    listing_id,
	latitude,
	longitude,
    neighbourhood,
    room_type,
    listing_price,
    avg_price,
    price_difference_percent,
    CASE 
        WHEN price_difference_percent > 20 THEN 'Overpriced'
        WHEN price_difference_percent < -20 THEN 'Underpriced'
        ELSE 'Fairly Priced'
    END AS price_status
FROM 
    price_comparison
ORDER BY 
	neighbourhood,
    price_difference_percent DESC;


-- This SQL Query calculates the average price of similar properties in the same neighbourhood and room type and calculates the difference between the average price and the listing price. These calcullations are then joined to the listings table by listings ID. Then a calculation on the percentage difference between the listing price and the average price is used to determine what percentage the listing is overpriced by. I have also implemented a case function to make it easier to show what listings are overpriced, fairly priced or underpriced. The result returns a CSV returning all 4332 listings sampled from InsideAirBNB.com(Brisbane) labled overpriced, underpriced or fairly priced. 

-- Please note that the data that I sampled does not include information like SQ M, beds/bath, and amenities. 