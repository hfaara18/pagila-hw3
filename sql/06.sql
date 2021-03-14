/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1;
 * That is, list all actors that have appeared in a film with 'RUSSEL BACALL'.
 * Do not list 'RUSSEL BACALL', since he has a Bacall Number of 0.
 */
select distinct concat(first_name, ' ', last_name) as "Actor Name" 
from actor 
join film_actor using (actor_id) 
inner join (
    select film_id 
    from actor 
    inner join film_actor using (actor_id) 
    where first_name='RUSSELL' and last_name='BACALL'
) as a using (film_id) 
where concat(first_name, ' ', last_name)!='RUSSELL BACALL' 
order by "Actor Name";
