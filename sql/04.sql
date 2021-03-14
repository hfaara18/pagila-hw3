/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
select distinct first_name || ' ' || last_name as "Actor Name" 
from film 
join film_actor using (film_id) 
join actor using (actor_id) 
where 'Behind the Scenes'=any(special_features)
order by "Actor Name";
