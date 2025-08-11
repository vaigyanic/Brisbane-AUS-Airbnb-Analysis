ALTER TABLE review_sentiment 
ALTER COLUMN id TYPE BIGINT USING id::BIGINT; 

-- Used this SQL command to alter a data type from double precision to BIGINT to avoid scientific notiation during my analysis as this is an ID. 

ALTER TABLE review_sentiment 
ALTER COLUMN listing_id TYPE BIGINT USING listing_id::BIGINT;

-- ERROR:  invalid input syntax for type bigint: "<br/>Jean-Marc was happy for us to cook in his house and he was happy for us to do quite a bit of washing too. " 
-- recieved this error because some of the comments were too long and spilled over to new rows which cause my data to be incorrect. I will address this in the next query. 

ALTER TABLE review_sentiment
ALTER COLUMN date TYPE DATE USING date::DATE;

-- Alter Data type of Date from Text to Date. 

Delete FROM review_sentiment 
WHERE star_rating is null; 

-- With this change I removed all rows with incomplete or conflicting data which will make my analysis smoother. 

ALTER TABLE review_sentiment 
ALTER COLUMN listing_id TYPE BIGINT USING listing_id::BIGINT;

-- Updated the listing_id data type to BIGINT for uniformity.

