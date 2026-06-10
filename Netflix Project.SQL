-- Netflix Prject
Drop table if exists netflix;
CREATE TABLE netflix (
    show_id VARCHAR(20),
    type VARCHAR(20),
    title VARCHAR(150),
    director VARCHAR(208),
    casts VARCHAR(1000),
    country VARCHAR(150),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(20),
    listed_in VARCHAR(150),
    description VARCHAR(250)
);

select * from netflix;



select 
count(*) as Total_count
from netflix;

select distinct type  from netflix;

select * from netflix;

---Check missing values:
SELECT
COUNT(*) FILTER (WHERE director IS NULL) AS missing_director,
COUNT(*) FILTER (WHERE country IS NULL) AS missing_country,
COUNT(*) FILTER (WHERE casts IS NULL) AS missing_cast
FROM netflix;

--- Business Prolems

--- 1. Count the number of Movies vs TV Shows

select type, count(*) as total_content from netflix
group by type;


--- 2. List all movies released in a specific year (e.g., 2020)

select * from netflix
where 
	type='Movie'
	and
	release_year = 2020


--- 3. Find the top 5 countries with the most content on Netflix

select 
	unnest(string_to_array(country,',')) as new_country
from netflix;

select 
	unnest(string_to_array(country,',')) as new_country,
	count(show_id) as total_content
from netflix
group by 1
order by 2 desc
limit 5;

--- 4. Identify the longest movie

''' select * from netflix
where 
type = 'movie'
and
duration = (select max(duration) from netflix)


SELECT *
FROM netflix
WHERE type = 'Movie'
ORDER BY SPLIT_PART(duration, ' ', 1)::INT DESC
LIMIT 1;
'''

--- 4. Find content added in the last 5 years
select *	
from netflix
where
	To_Date(date_added, 'month, DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';

select CURRENT_DATE - INTERVAL '5 years'

-- 5. Find all the movies/TV shows by director 'Rajiv Chilaka'!
select 
	*
	from netflix
	where director like 'Rajiv Chilaka';

-- If the director name with  % starting or ending it shows because movie directed by mltiple directors
-- here Iike is case senstive

select 
	*
	from netflix
	where director Ilike '%Rajiv Chilaka%';


--- 6. List all TV shows with more than 5 seasons

select *
	--- split_part(duration, ' ', 1) as sessions
	from netflix
where 
	type = 'TV Show'
	AND 
	split_part(duration, ' ', 1):: numeric > 5;

--- logic for split_part
select split_part('Apple banana cherry', ' ',1);


--- 7. Count the number of content items in each genre
select 
unnest(string_to_array(listed_in, ',')) as genre,
count(show_id) as total_content
from netflix
group by 1;

--- SELECT COUNT(DISTINCT listed_in) FROM netflix;


--- 8. List all movies that are documentaries

select * from netflix
where 
	listed_in Ilike '%documentaries%'


--- 9. Find all content without a director

select * from netflix
where director is null;

--- 10. Find how many movies actor 'Salman Khan' appeared in last 10 years!

select * from netflix 
where casts Ilike '%Salman Khan%'
and
release_year > extract(year from current_date) -10;

--- 11. Find the top 10 actors who have appeared in the highest number of movies produced in India.

select 
unnest(string_to_array(casts, ',')) as actors,
count(*) as total_content
from netflix 
where country ilike '%india%'
group by 1
order by 2 desc
limit 10;






