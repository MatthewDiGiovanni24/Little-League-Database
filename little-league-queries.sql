SELECT teamname
FROM TEAM T
WHERE T.division = 'East';

SELECT teamname
FROM TEAM T
WHERE T.division = 'West';

SELECT teamname
FROM TEAM T
WHERE T.division = 'North';

SELECT teamname
FROM TEAM T
WHERE T.division = 'North';

SELECT fname, minit, lname, fieldposition
FROM TEAM T, PARTICIPANT P
WHERE P.tname = 'Wildcats' and T.teamname = P.tname;

SELECT fname, minit, lname, fieldposition
FROM TEAM T, PARTICIPANT P
WHERE P.fieldposition = 'Starting Pitcher' and T.teamname = P.tname
ORDER BY lname desc;

SELECT P.lname, PS.bavg, PS.era, PS.fpct, PS.whip
FROM TEAM T, PARTICIPANT P, PLAYER_STATISTICS PS
WHERE P.tname = 'Wildcats' and T.teamname = P.tname and P.ssn = PS.essn;

SELECT P.lname, P.tname, PS.bavg
FROM PARTICIPANT P JOIN PLAYER_STATISTICS PS on P.ssn = PS.essn
WHERE PS.bavg > 0.250
ORDER BY PS.bavg desc;

SELECT P.lname, P.tname, PS.ERA
FROM PARTICIPANT P JOIN PLAYER_STATISTICS PS on P.ssn = PS.essn
WHERE PS.ERA < 3
ORDER BY PS.ERA;

SELECT S.sname, S.city, S.seatnumber
FROM STADIUM S
WHERE S.owningteam IN (
    SELECT T.teamname
    FROM TEAM T
    WHERE T.losses >= 3
    )
ORDER BY S.seatnumber;

SELECT PI.hteam, sum(G.homescore) as RunsAtHome
FROM PLAYS_IN PI, GAME G
WHERE PI.gid = G.gameid
GROUP BY PI.hteam
HAVING sum(G.homescore) > 15
ORDER BY RunsAtHome desc;