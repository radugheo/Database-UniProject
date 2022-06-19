--actualizam pozitia jucatorilor care au aceeasi pozitie ca si Burca
update Player
set player_position = (
    select p.player_position
    from Player p
    where p.player_name = 'Burca'
)
where player_age > 36;

--actualizam bugetul echipelor care au squad size-ul mai mic decat 24
update Team
set team_budget = (
    select t.team_budget
    from Team t
    where t.id_owner = 2
)
where squad_size < 24;

--actualizam capacitatea stadioanelor care au capacitatea mai mica decat 30000
update Stadium
set stadium_capacity = (
    select s.stadium_capacity
    from Stadium s
    where s.id_city = 5
)
where stadium_capacity < 30000;
