create sequence auto_increment
start with 1
increment by 1
minvalue 1
maxvalue 1000
nocycle;

insert into League(id_league, league_size) values (auto_increment.nextval, 20);
insert into League(id_league, league_size) values (auto_increment.nextval, 18);
insert into League(id_league, league_size) values (auto_increment.nextval, 14);