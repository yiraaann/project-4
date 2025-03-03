# Project 4| Data Modeling: The Hit Equation

# Team Members:
* Michelle Moody: Data Acquisition, EDA, ML Modeling
* Yiran Zhang: ERD, SQL, Lyric API Analysis → scrape/parse → language model, Spotify & Genius APIs
* Wayne Mitchell: EDA (initial insights), ML Modeling, Lyric Analysis
* Ashley Cooper: Data Acquisition, EDA (initial insights), Tableau

# Project Objectives:
This project explores music popularity trends from 2000 to 2023 by analyzing song attributes such as popularity scores, genres, and key musical features. Our goal is to train a machine learning model to predict hit songs by identifying patterns in past successful and unsucessful tracks. 

Goal: 
* To test our model by “predicting” 2024 hit songs based on attributes and improve the model if time allows.

Research Question:
* Can we predict if a song will be a hit based on its features? 
* What defines a hit song? Is it the instrumentation, lyrics, both, or neither?

# Project Overview:

# Instructions - Use and Interaction:
Programming & Software:
* Microsoft Excel: used for viewing and manipulating csv files
* QuickDBD: used for sketching the ERD table and generating sql import
* PostgresSQL: relational database management system
* Jupyter Notebook: used for data cleaning and processing
* VBS:
* Google Colab: used for cloud-based experimentation with pretrained language models from Hugging Face
* Tableau:

Part 1 | ETL (Michelle, Ashley, Wayne)
Using Jupyter Notebook or VSC, import the multiple excel files that were extracted from:
* playlist_2010to2023.csv = contains data from 2000 to 2023
* unpopular_songs.csv

Part 2 | Create Databases (Yiran)
Using QuickDBD, we sketched an Entity Relationship Diagram (ERD) to form a table schema. We identified the dependencies between each table (primary and foreign keys) and their relationships (one to one/one to many) and the relevant datatypes for each column.
* Schema = 
* ERD Diagram = 
![QuickDBD-MusicLyricsERD](https://github.com/user-attachments/assets/561e94de-8995-49d0-829d-a8e8f0973ad5)

Part 3 | Import Data into Database (Yiran)
Databases Used = SQL

Created a SQL database in Postgres through pgAdmin. The table schema sql file generated through the ERD diagram was uploaded to create a table structure and dependencies.

Part 4 | Exploratory Analysis as a duplicate comparison for Tableau output (Michelle and Wayne)

![Popular Bar Graph](https://github.com/yiraaann/project-4/blob/main/Moody%20-%20Project%204/Images/popoular_bar.png)
![Popoular Boxplot](https://github.com/yiraaann/project-4/blob/main/Moody%20-%20Project%204/Images/popular_boxplot.png)

Part 5 | Supervised Machine Learning: Using known datasets for popular and unpopular (Michelle)

Machine Learning Models Used:
1) Logistic Regression
2) Random Forest Classifier
3) Support Vector Machine (SVM)

Feature Importance and Confusion Matrices were assessed for each model:
![Feature Importance Log](https://github.com/yiraaann/project-4/blob/main/Moody%20-%20Project%204/Images/feat_importance_log.png)
![Feature Importance RF](https://github.com/yiraaann/project-4/blob/main/Moody%20-%20Project%204/Images/feat_importance_rf.png)
![Feature Importance SVM](https://github.com/yiraaann/project-4/blob/main/Moody%20-%20Project%204/Images/feat_importance_svm.png)

![CM Plots](https://github.com/yiraaann/project-4/blob/main/Moody%20-%20Project%204/Images/cm_plots.png)

Final Output:

![Accuracy](https://github.com/yiraaann/project-4/blob/main/Moody%20-%20Project%204/Images/Accuracy.png)

Random Forest was the highest rate of accuracy at 82%. It handles non-linear data better than other models. Most music attributes don't have a simple linear relationship when it comes to popularity. It can capture more complex, non-linear interactions between features without needing manual transormations. This would allow for using this model with additional datasets outside of Spotify that had different attributes. 

Part 6 | Supervised Machine Learning: Using the known popular dataset and generating a synthetic unpopular dataset (Wayne)

Once it was determined that Random Forest performed at the hightest accuracy. This model was selected to test the performance with the synthetically generated unpopular data. 

![Accuracy - Round 2]() 

Part 7 | Lyric API Analysis (Yiran)

The goal of this analysis was to examine words and language patterns used in popular & unpopular songs' lyrics. Most of the time was spent in ETL to set up API calls and creating processes to scrape lyrics for each song in an efficient manner, resulting in a very large dataset of popular songs and their full lyrics. 

Process
* created popular_lyrics dataset to focus on only songs with a popularity score of 50+
* cleaned up popular_lyrics dataset to drop duplicate songs (in order to not have double or triple lyrics for future language analysis) and remove special characters
* loaded popular_lyrics dataset into Google colab to use hugging face pretrained models
* trialed several pretrained language models, focusing primarily on zero-shot classification for simplicity
  * additionally looked into training a model from scratch (https://huggingface.co/blog/how-to-train) using popular vs unpopular lyrics datasets
* selected BART language model to categorize lyrics based on "positive", "negative", and "neutral" messaging
* other attempts included "happy", "sad", and "neutral"
* unsuccessful attempts to categorize full songs' lyrics; given more time, a line-by-line analysis would be more helpful

Conclusion: Ideally, using "popular" and "unpopular" song lyrics datasets would help train a language model if given enough time and resources. Using a pretrained model, however, is useful in categorizing and analyzing sentiment. It would be interesting to experiment with different ways of breaking down a song so that smaller pieces of the song (e.g., line by line) are passed through the model for more precision. With more time, this could be a powerful tool for analyzing the content of lyrics.

Part 8 | Tableau Dashboard (Ashley)

# Data Sources:
* https://www.kaggle.com/datasets/josephinelsy/spotify-top-hit-playlist-2010-2022 
* https://www.kaggle.com/datasets/estienneggx/spotify-unpopular-songs
* https://developer.spotify.com/documentation/web-api/reference/get-audio-features
* https://docs.genius.com/
* https://pypi.org/project/lyricsgenius/
* https://huggingface.co/facebook/bart-large-mnli

# Challenges:
1) Originally didn't have an unpopular dataset and determined it would be better to also include unpopoular data so we could compare the attributes of both and use them for supervised machine learning. 
2) While performing lyric analsis, it took time to determine the time out parameters. Determined batches of 600 worked. Dataset contained 2,400 rows. 
3) Challenge with generating synthetic unpopular data and properly modeling using Random Forest supervised machine learning. 
4) Too many API calls to Genius.com - limitations to daily use
5) Future 2024 music analysis - API deprecation as of November 27, 2024, removing developer access to information. 

# Further Explorations:
1) Could use pulled data from other sources to obtain future music to perform analysis. This is due to Random Forest being able to model different non-linear attributes. 
2) Deeper dive into lyric analysis 
* Pre-trained sentiment analysis laguage models
3) Test additional supervised ML models
* Design Neural Network for advanced predictions
4) Explore additional datasets and their attributes
* YouTube: music, plays, popularity, LIKES
* Apple Music: streams, playlists
* Tidal: different artists & genres
* Genius: different attributes and lyrics' keywords
5) Explore 718 unique genres using Unsupervised Learning

# Conclusion:

