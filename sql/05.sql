/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
select title 
from film 
where 'Behind the Scenes'=any(special_features) 
intersect (
    select title 
    from film 
    where 'Trailers'=any(special_features)
) 
order by title;
