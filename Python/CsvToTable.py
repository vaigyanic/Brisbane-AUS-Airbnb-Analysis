import pandas as pd
from sqlalchemy import create_engine

db_username = 'postgres'
db_password = 'Mudkip'

db_host = 'localhost'
db_port = '5432'
db_name = 'BrisbaneQLDAirBNBData'

engine = create_engine(f'postgresql://{db_username}:{db_password}@{db_host}:{db_port}/{db_name}')

df1 = pd.read_csv('/Users/aharris/Documents/GitHub/Airbnb_Aus_Bris_DataProject/Airbnb Data/listings.csv', low_memory=False)
df1.to_sql('listings', engine, if_exists='replace', index=False)

df2 = pd.read_csv('/Users/aharris/Documents/GitHub/Airbnb_Aus_Bris_DataProject/Airbnb Data/neighbourhoods.csv', low_memory=False)
df2.to_sql('neighbourhoods', engine, if_exists='replace', index=False)

df3 = pd.read_csv('/Users/aharris/Documents/GitHub/Airbnb_Aus_Bris_DataProject/Airbnb Data/reviews.csv', low_memory=False)
df3.to_sql('reviews', engine, if_exists='replace', index=False)

# df4 = pd.read_json('/Users/aharris/Documents/GitHub/Airbnb_Aus_Bris_DataProject/Airbnb Data/neighbourhoods.geojson', low_memory=False)
# df4.to_sql('Brisbane.QLDAirBNB.Data', engine, if_exists='replace', index=False)

df5 = pd.read_csv('/Users/aharris/Documents/GitHub/Airbnb_Aus_Bris_DataProject/Airbnb Data/calendar.csv', low_memory=False)
df5.to_sql('calendar', engine, if_exists='replace', index=False)

df6 = pd.read_csv('/Users/aharris/Documents/GitHub/Airbnb_Aus_Bris_DataProject/Airbnb Data/ID_Date.reviews.csv', low_memory=False)
df6.to_sql('id_date_reviews', engine, if_exists='replace', index=False)

df7 = pd.read_csv('/Users/aharris/Documents/GitHub/Airbnb_Aus_Bris_DataProject/Airbnb Data/comments_with_ratings.csv', low_memory=False)
df7.to_sql('review_sentiment', engine, if_exists='replace', index=False)

print("Tables created and data imported successfully!")