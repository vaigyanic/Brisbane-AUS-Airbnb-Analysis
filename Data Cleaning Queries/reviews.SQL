ALTER TABLE reviews 
ALTER COLUMN date TYPE DATE USING date::DATE; 

-- Updated the data type from text to Date to make future analysis easier. 