ALTER TABLE calendar
DROP COLUMN adjusted_price

-- The data collected from inside airbnb had only null values and no description of what adjusted_price meant

ALTER TABLE calendar
ALTER COLUMN date TYPE DATE USING date::DATE;

-- Altered colum in calendar table to date format rather than text format. 

ALTER TABLE calendar ADD COLUMN price_int BIGINT;

UPDATE calendar
SET price_int = CAST(
    REPLACE(
        REPLACE(price, '$', ''),  
        ',', ''                       
    ) AS NUMERIC
) ;

ALTER Table calendar
DROP COLUMN price

ALTER TABLE calendar
RENAME price_int TO price;

-- Update price column on calander table to remove '$' and ',' for better integration on Tableau and better analysis. 

UPDATE calendar
SET available = CAST(
    REPLACE(
        REPLACE(available, 't', '1'),  
        'f', '0'                       
    ) AS NUMERIC
);

ALTER Table calendar
Alter COLUMN available TYPE INT USING available::INT

-- Update available column to turn text values into computable binary values. 
