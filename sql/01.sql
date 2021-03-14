/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 */
select title 
from film 
where rating='G' 
intersect 
(
    select title 
    from film 
    where 'Trailers'=any(special_features)
) 
order by title desc;
