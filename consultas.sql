select t.trainer_name, c.city_name, g.gym_name
from trainers t
join citys c on t.id_city = c.id_city
join gyms g on t.id_city = g.id_city;

select pokemon_name, pokemon_type
from pokemon;

select pokemon_name, power_level
from pokemon
where power_level > 50;

select p.pokemon_name, p.power_level, t.trainer_name
from pokemon p
join trainers t on p.id_trainer = t.id_trainer
where p.pokemon_type = 'fuego'
order by p.power_level asc;

select pokemon_name
from pokemon
where id_city in (
    select id_city
    from citys
    where city_name = 'celadon'
);

select pokemon_name, power_level
from pokemon
where power_level > (
    select avg(power_level)
    from pokemon
);

select pokemon_name
from pokemon
where battle_cleared > 0;