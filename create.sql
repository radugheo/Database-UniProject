create table League
(
    id_league   int
        constraint LEAGUE_PK
            primary key,
    league_size int
);
create table Sponsor
(
    id_sponsor   int
        constraint SPONSOR_PK
            primary key,
    sponsor_name varchar2(20)
);
create table City
(
    id_city   int
        constraint CITY_PK
            primary key,
    city_name varchar2(20)
);
create table Owner
(
    id_owner   int
        constraint OWNER_PK
            primary key,
    owner_name varchar2(20)
);
drop table Referee;
create table Referee
(
    id_referee   int
        constraint REFEREE_PK
            primary key,
    id_league    int,
    referee_name varchar2(20),
    constraint id_league foreign key (id_league) references League(id_league)
);
create table Staff
(
    id_staff   int
        constraint STAFF_PK
            primary key,
    staff_size int
);
create table Coach
(
    id_coach   int
        constraint COACH_PK
            primary key,
    coach_name varchar2(20),
    id_staff   int,
    constraint id_staff foreign key (id_staff) references Staff(id_staff)
);
create table Team
(
    id_team     int
        constraint TEAM_PK
            primary key,
    team_name   varchar2(20),
    squad_size  int,
    team_budget int,
    id_coach    int,
    id_owner    int,
    id_league   int,
    id_sponsor  int,
    constraint id_coach foreign key (id_coach) references Coach(id_coach),
    constraint id_owner foreign key (id_owner) references Owner(id_owner),
    constraint id_league2 foreign key (id_league) references League(id_league),
    constraint id_sponsor foreign key (id_sponsor) references Sponsor(id_sponsor)
);
create table Stadium
(
    id_stadium       int
        constraint STADIUM_PK
            primary key,
    id_team          int,
    id_city          int,
    stadium_capacity int,
    constraint id_team foreign key (id_team) references Team(id_team),
    constraint id_city foreign key (id_city) references City(id_city)
);
create table Training
(
    id_training       int
        constraint TRAINING_PK
            primary key,
    training_duration int
);
create table Player
(
    id_player       int
        constraint PLAYER_PK
            primary key,
    player_name varchar2(30),
    player_position varchar2(5),
    player_age      int,
    id_team         int,
    constraint id_team2 foreign key (id_team) references Team(id_team)
);
create table Contract
(
    id_contract     int
        constraint CONTRACT_PK
            primary key,
    contract_length int
);
create table Deal
(
    id_player    int not null,
    id_contract  int not null,
    id_team      int not null,
    constraint DEAL_PK
        primary key (id_player, id_contract, id_team),
    constraint deal_player_fk
        foreign key (id_player)
            references Player(id_player),
    constraint deal_contract_fk
        foreign key (id_contract)
            references Contract(id_contract),
    constraint deal_team_fk
        foreign key (id_team)
            references Team(id_team)
);
create table Trains
(
    id_player    int not null,
    id_training  int not null,
    id_staff      int not null,
    constraint TRAINS_PK
        primary key (id_player, id_training, id_staff),
    constraint trains_player_fk
        foreign key (id_player)
            references Player(id_player),
    constraint trains_trainig_fk
        foreign key (id_training)
            references Training(id_training),
    constraint trains_staff_fk
        foreign key (id_staff)
            references Staff(id_staff)
);