drop database if exists Pokemon;
create database Pokemon;
use Pokemon;

drop table if exists Teams;
drop table if exists Trainers;
drop table if exists Pokemons;
drop table if exists Citys;
drop table if exists Gyms;

create table Pokemon(
 id_city int not null,
 id_pokemon int not null,
 pokemon_name varchar(100),
 state varchar(100),
 captured varchar(5),
 battle_cleared int not null,
 constraint fk_city foreign key (id_city) 
        references City(id_city)
);
create table Teams(
 id_team int primary key auto_increment,
 ferst varchar(100),
 sicond varchar(100),
 third varchar(100),
 fourth varchar(100),
 fifth varchar(100),
 sixth varchar(100)
);

create table Trainers(
 id_team int not null,
 id_city int not null,
 id_trainer int primary key auto_increment,
 trainer_name varchar(200),
 constraint fk_city foreign key (id_city) 
        references City(id_city),
 gym_cleared int not null,
 constraint fk_team foreign key (id_team) 
        references Teams(id_team)
);
