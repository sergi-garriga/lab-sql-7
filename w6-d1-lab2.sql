use sakila;

-- In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you 
-- would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
-- These three actors have the same last name. So we do not want to include this
-- last name in our output. Last name "Astaire" is present only one time with actor 
-- "Angelina Astaire", hence we would want this in our output list.
select first_name, last_name
from actor
where last_name in(
	select last_name
    from actor
    group by last_name
    having count(*) = 1
    )
order by last_name asc;



-- Which last names appear more than once? We would use the same logic as in the previous 
-- question but this time we want to include the last names of the actors where the last 
-- name was present more than once
		-- this returns the actors with repeated last_names
select first_name, last_name
from actor
where last_name in(
	select last_name
    from actor
    group by last_name
    having count(*) != 1
    )
order by last_name asc;

		-- this returns only the last_names repeated
select distinct(last_name)
from actor
where last_name in(
	select last_name
    from actor
    group by last_name
    having count(*) != 1
    )
order by last_name asc;



-- Using the rental table, find out how many rentals were processed by each employee.
select count(*) 
from rental
where staff_id = 1;
			-- 8041

select count(*) 
from rental
where staff_id = 2;
			-- 8004



-- Using the film table, find out how many films were released each year.
select release_year, count(*) 
from film 
group by release_year;
			-- 1000 films on 2006



-- Using the film table, find out for each rating how many films were there.
select rating, count(*) 
from film 
group by rating;
			-- R = 195
            -- PG-13 = 223
            -- PG = 194
            -- NC-17 = 210
            -- G = 178



-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select rating, round(avg(length), 2)
from film
group by rating;
			-- R = 118.66
            -- PG-13 = 120.44
            -- PG = 112.02
            -- NC-17 = 112.23
            -- G = 111.05
            


-- Which kind of movies (rating) have a mean duration of more than two hours?
select rating, round(avg(length), 2)
from film
group by rating
having avg(length) > 120;
			-- PG-13 = 120.44
	

