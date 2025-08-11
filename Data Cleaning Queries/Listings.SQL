UPDATE public.listings
SET neighbourhood_group = n.neighbourhood_group
FROM public.neighbourhoods n
WHERE public.listings.neighbourhood = n.neighbourhood
AND public.listings.neighbourhood_group IS NULL;

-- The raw data had neighbourhoods with an empty neighbourhood group column so I used Excel to fill series. Then used the filled series to assign ID's to the neighbourhoods. Then used the above function to assign the new neighbourhood ID's to the Neighbourhoods in the listings table. I learned that you cannot initialize an abbreviation in the set statement in PostgreSQL

Alter Table listings
Drop Column license

-- License appeared as null from the raw data set and this column is not integral to my data analysis. 

Delete From listings
Where price is null;

-- Deleted rows where price values were null to avoid errors later on in the analysis. 

ALTER TABLE listings
ALTER COLUMN last_review TYPE DATE USING last_review::DATE;

-- Altered the data type of last_review to type DATE from type TEXT