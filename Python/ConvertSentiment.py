import pandas as pd
from textblob import TextBlob


df = pd.read_csv('/Users/aharris/Documents/GitHub/Airbnb_Aus_Bris_DataProject/Airbnb Data/reviews.csv', delimiter=',', low_memory=False)

# Replace NaN values in the 'comments' column with an empty string
df['comments'] = df['comments'].fillna('')

# Function to convert sentiment polarity to star rating
def sentiment_to_stars(comment):
 polarity = TextBlob(comment).sentiment.polarity
 if polarity >= 0.6:
     return 5
 elif polarity >= 0.2:
     return 4
 elif polarity > -0.2:
     return 3
 elif polarity > -0.6:
     return 2
 else:
     return 1

# Apply the function to the comments column
df['Star Rating'] = df['comments'].apply(sentiment_to_stars)


df.to_csv('/Users/aharris/Documents/GitHub/Airbnb_Aus_Bris_DataProject/Airbnb Data/Pre_Cleaning.review_sentiment.csv', index=False)

print("CSV Created Successfully")
