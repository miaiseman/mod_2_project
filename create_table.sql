CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    reviewid INTEGER,
    title TEXT,
    artist TEXT,
    url TEXT,
    score DECIMAL,
    best_new_music BOOLEAN,
    author TEXT,
    author_type TEXT,
    pub_date DATE,
    pub_weekday INT,
    pub_day INT, 
    pub_month INT,
    pub_year INT
);
