SELECT 
    EXTRACT(MONTH FROM date) AS month,
    CASE 
        WHEN EXTRACT(MONTH FROM date) IN (12, 1, 2) THEN 'Summer'
        WHEN EXTRACT(MONTH FROM date) IN (3, 4, 5) THEN 'Autumn'
        WHEN EXTRACT(MONTH FROM date) IN (6, 7, 8) THEN 'Winter'
        WHEN EXTRACT(MONTH FROM date) IN (9, 10, 11) THEN 'Spring'
    END AS season,
    SUM(CASE WHEN available = 't' THEN 1 ELSE 0 END) AS available_nights,
    COUNT(*) AS total_nights,
    SUM(CASE WHEN available = 'f' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS occupancy_rate
FROM calendar
GROUP BY season, month
ORDER BY occupancy_rate DESC;