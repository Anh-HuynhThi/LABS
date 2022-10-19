use applestore;
select * from applestore;
select prime_genre from applestore
group by prime_genre;

select * from applestore;
select prime_genre from applestore
group by prime_genre
order by rating_count_tot desc;

select * from applestore;
select prime_genre from applestore
group by prime_genre
order by prime_genre desc;

select track_name from applestore
order by rating_count_tot desc
limit 10;



select track_name from applestore
order by user_rating desc
limit 10;

select track_name from applestore
order by user_rating, rating_count_tot desc
limit 3;

select track_name, price, user_rating from applestore
order by user_rating desc, price desc
limit 10;
