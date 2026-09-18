drop database if exists pokemon;
create database pokemon;
use pokemon;

drop table if exists pokemon;
drop table if exists trainers;
drop table if exists teams;
drop table if exists gyms;
drop table if exists citys;

create table citys (
    id_city int primary key auto_increment,
    city_name varchar(100) not null
);

create table gyms (
    id_gym int primary key auto_increment,
    id_city int not null,
    gym_name varchar(100),
    constraint fk_gym_city foreign key (id_city) references citys(id_city)
);

create table teams (
    id_team int primary key auto_increment,
    first varchar(100),
    second varchar(100),
    third varchar(100),
    fourth varchar(100),
    fifth varchar(100),
    sixth varchar(100)
);

create table trainers (
    id_trainer int primary key auto_increment,
    id_team int not null,
    id_city int not null,
    trainer_name varchar(200),
    gym_cleared int not null,
    constraint fk_trainer_city foreign key (id_city) references citys(id_city),
    constraint fk_trainer_team foreign key (id_team) references teams(id_team)
);

create table pokemon (
    id_pokemon int primary key auto_increment,
    id_city int not null,
    id_trainer int,
    pokemon_name varchar(100),
    pokemon_type varchar(50),
    power_level int not null default 1,
    state varchar(100),
    captured varchar(5),
    battle_cleared int not null,
    constraint fk_pokemon_city foreign key (id_city) references citys(id_city),
    constraint fk_pokemon_trainer foreign key (id_trainer) references trainers(id_trainer)
);

insert into citys (city_name) values 
('celadon'),
('cerulean'),
('pallet');

insert into gyms (id_city, gym_name) values 
(1, 'gimnasio celadon'),
(2, 'gimnasio cerulean');

insert into teams (first, second, third, fourth, fifth, sixth) values 
('charizard', 'pikachu', 'blastoise', 'venusaur', 'snorlax', 'dragonite'),
('arcanine', 'rapidash', 'magmar', 'ninetales', 'flareon', 'charmeleon');

insert into trainers (id_team, id_city, trainer_name, gym_cleared) values 
(1, 3, 'ash ketchum', 2),
(2, 1, 'blaine', 1);

insert into pokemon (id_city, id_trainer, pokemon_name, pokemon_type, power_level, state, captured, battle_cleared) values 
(1, 1, 'charizard', 'fuego', 85, 'saludable', 'si', 5),
(1, 2, 'arcanine', 'fuego', 65, 'saludable', 'si', 3),
(1, 2, 'rapidash', 'fuego', 45, 'saludable', 'si', 1),
(2, 1, 'pikachu', 'electrico', 60, 'saludable', 'si', 4);
