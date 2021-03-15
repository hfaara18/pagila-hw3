/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
select distinct concat(first_name, ' ', last_name) as "Actor Name"
from actor
join film_actor using (actor_id)
where film_id in
(
    select distinct film_id
    from film_actor
    where actor_id in (
        select distinct(actor_id)
        from actor
        join film_actor using (actor_id)
        inner join (
            select film_id
            from actor
            inner join film_actor using (actor_id)
            where first_name='RUSSELL' and last_name='BACALL'
        ) as a using (film_id)
        where concat(first_name, ' ', last_name)!='RUSSELL BACALL'
    )
)
and
actor_id not in (
    select distinct(actor_id)
    from film_actor
    where film_id in (
        select film_id
        from actor
        inner join film_actor using (actor_id)
        where concat(first_name, ' ', last_name)='RUSSELL BACALL'
    )
)
order by "Actor Name";                                                                                                                                                                                                                                                                                                    ;
