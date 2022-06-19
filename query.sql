--1) selectati jucatorii a caror nume incepe cu P, joaca la echipa cu id-ul 2 si au minim 5 litere in nume
select player_name, player_position, player_age
from Player p
join Team t on t.id_team = p.id_team
where lower(player_name) like 'p%' and length (player_name) >= 5 and t.id_team = 2
order by player_age;
--filtrare la nivel de linii, 2 functii pe siruri de caractere

--2) selectati jucatorii si stadionul aferent echipei lor, care joaca la echipe cu buget mai mare decat 4000000
select p.player_name, t.team_name, s.stadium_capacity, c.city_name
from Player P
join Team t on t.id_team = p.id_team
join Stadium s on t.id_team = s.id_team
join City c on s.id_city = c.id_city
where t.id_team in (select f.id_team
                        from Team f
                        where f.team_budget > 4000000
                        group by f.id_team);
--4 join-uri, subcerere nesincronizata, ordonari

--3) selectati pentru fiecare tip de antrenament numarul de jucatori care il practica, cu exceptia jucatorilor pe care ii cheama Cristea
select t.id_training, count(t.id_player)
from Trains t
join Player p on p.id_player = t.id_player
where lower(player_name) <> 'Cristea'
group by t.id_training
having count(t.id_player) > 1;

--4. Selectati numele si varsta jucatorilor care au varsta mai mare decat media varstei si diferita de 33.

with avg_age as (
    select avg(player_age) Age
    from Player
)
select player_name, player_age
from Player
where player_age > (
    select Age
    from avg_age
    where nvl(player_age, 33) <> 33 and decode(player_age, player_age, player_age, 33) <> 33
);

--5) Pentru echipele cu buget > 4000000, afisati bugetul. Pentru cele cu buget mai mic, afisati data curenta.

select t.team_name, t.team_budget,
    case
        when (
            (select team_budget
            from Team
            where id_team = t.id_team) > 4000000
        ) then (
            to_char(team_budget)
        )
        else (
            to_char(current_date)
        )
    end
from Team t;