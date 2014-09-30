create database heart_disease;
use heart_disease;
create table exercise_protocol (id int primary key, exercise_name varchar(64));
insert into exercise_protocol values (1,'Bruce')
insert into exercise_protocol values (2,'Kottus')
insert into exercise_protocol values (3,'McHenry')
insert into exercise_protocol values (4,'Fast Balke')
insert into exercise_protocol values (5,'Balke')
insert into exercise_protocol values (6,'Noughton')
insert into exercise_protocol values (7,'Bike 150 kpa')
insert into exercise_protocol values (8,'Bike 125 kpa')
insert into exercise_protocol values (9,'Bike 100 kpa')
insert into exercise_protocol values (10,'Bike 75 kpa')
insert into exercise_protocol values (11,'Bike 50 kpa')
insert into exercise_protocol values (12,'Arm Ergometer')
select hospital, exercise_name from all_data, exercise_protocol where all_data.proto = exercise_protocol.id;