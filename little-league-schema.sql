DROP TABLE team CASCADE CONSTRAINTS;
CREATE TABLE team (
  teamName      varchar2(15),
  mascot        varchar2(15) not null,
  primaryColor  varchar2(15),
  division      varchar2(15),
  wins          number(4),
  losses        number(4),
  primary key (teamName),
  unique (mascot)
);

DROP TABLE participant CASCADE CONSTRAINTS;
CREATE TABLE participant (
  ssn                   char(9),
  fname                 varchar2(15) not null, 
  minit                 varchar2(1),
  lname                 varchar2(15) not null,
  fieldPosition         varchar2(20),
  contractExpiration    date,
  height                number(5,2),
  weight                number(5,2),
  coachSsn              char(9),
  tname                 varchar2(15) not null,
  primary key (ssn),
  foreign key (tname) references team(teamName),
  foreign key (coachSsn) references participant(ssn)
);

DROP TABLE player_statistics CASCADE CONSTRAINTS;
CREATE TABLE player_statistics (
  essn      char(9),
  bavg      number(4,3), 
  era       number(4,2),
  fpct      number(4,3),
  whip      number(3,2),
  primary key (essn),
  foreign key (essn) references participant(ssn)
);

DROP TABLE stadium CASCADE CONSTRAINTS;
CREATE TABLE stadium (
  sname         varchar2(15),
  city          varchar2(15) not null,
  seatNumber    number(6),
  owningTeam    varchar2(15) not null,
  primary key (sname),
  foreign key (owningTeam) references team(teamName)
);

DROP TABLE game CASCADE CONSTRAINTS;
CREATE TABLE game (
  gameID         number(9),
  homeScore      number(3),
  awayScore      number(3),
  gameDate       date,
  primary key (gameID)
);

DROP TABLE plays_in CASCADE CONSTRAINTS;
CREATE TABLE plays_in (
  gid      number(9),
  hTeam    varchar2(15),
  aTeam    varchar2(15),
  primary key (gid),
  foreign key (gid) references game(gameID),
  foreign key (hTeam) references team(teamName),
  foreign key (aTeam) references team(teamName)
);

