#Lab | My first queries 



```python
#1 What are the different genres
create database if not exists applestore;
use applestore;
select * from applestore;
select prime_genre from applestore
group by prime_genre;
'Games'
'Productivity'
'Weather'
'Shopping'
'Reference'
'Finance'
'Music'
'Utilities'
'Travel'
'Social Networking'
'Sports'
'Business'
'Photo & Video'
'Navigation'
'Entertainment'
'Education'
'Lifestyle'
'Food & Drink'
'News'
'Health & Fitness'
'Medical'
'Book'

```


```python
#2 Which is the genre with the most apps rated
'Social Networking'

select * from applestore;
select prime_genre from applestore
group by prime_genre
order by rating_count_tot desc;


```


```python
#3 . Which is the genre with most apps:
"weather"

select * from applestore;
select prime_genre from applestore
group by prime_genre
order by prime_genre desc;

```


```python
#4. Which is the one with least?
"book"
```


```python
#5.Find the top 10 apps most rated.
select track_name from applestore
order by rating_count_tot desc
limit 10

'Facebook'
'Pandora - Music & Radio'
'Bible'
'eBay: Best App to Buy, Sell, Save! Online Shopping'
'WeatherBug - Local Weather, Radar, Maps, Alerts'
'Evernote - stay organized'
'Yahoo Sports - Teams, Scores, News & Highlights'
'PayPal - Send and request money safely'
'OpenTable - Restaurant Reservations'
'TripAdvisor Hotels Flights Restaurants'


```


```python
#6.Find the top 10 apps best rated by users.
select track_name from applestore
order by user_rating desc
limit 10;
'Sudoku +'
'The Photographer\'s Ephemeris'
'Fragment\'s Note'
'Kurumaki Calendar -month scroll calendar-'
'Plants vs. Zombies HD'
'Daily Audio Bible App'
'Fragment\'s Note'
'Learn to Speak Spanish Fast With MosaLingua'
'Dragon Island Blue'
'Fieldrunners 2'


```


```python
#7. Take a look at the data you retrieved in question 5. Give some insights.
from the total of rating, the social network apps have the most highest rating among all of other applications.
The explication for this rating can be concered about how popular all of those application is and they are free. 
```


```python
#8. Take a look at the data you retrieved in question 6. Give some insights.
from the user rating, we can see that the users prefer in the game base on the reasonable price and how satify of people who play on those games.

```


```python
#9. Now compare the data from questions 5 and 6. What do you see:
Base on the data from question 5 and 6, there is not the same app which can be in both lists, totally different results.
```


```python
#10. How could you take the top 3 regarding both user ratings and number of votes?
select track_name from applestore
order by user_rating, rating_count_tot desc
limit 3
'eBook: War and Peace'
'OneCam'
'Learn to Speak Italian Fast With MosaLingua'

```


```python
#11. Do people care about the price of an app?Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

select track_name, price, user_rating from applestore
order by user_rating desc, price desc
limit 10;

#The answer is Yes, People care about the price. The table below is example of the 10 highest rating (5) from the users and apps' prices. we can see the price of those games is reasonable from 4.99-8.99 USD 
'The Photographer\'s Ephemeris', '8.99', '5'
'The Photographer\'s Ephemeris', '8.99', '5'
'Sudoku +', '4.99', '5'
'TurboScan Pro - document & receipt scanner: scan multiple pages and photos to PDF', '4.99', '5'
'Learn to Speak Spanish Fast With MosaLingua', '4.99', '5'
'TurboScan Pro - document & receipt scanner: scan multiple pages and photos to PDF', '4.99', '5'
'Sudoku +', '4.99', '5'
'Learn English quickly with MosaLingua', '4.99', '5'
'Learn English quickly with MosaLingua', '4.99', '5'
'Learn to Speak Spanish Fast With MosaLingua', '4.99', '5'


```
