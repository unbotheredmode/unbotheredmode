/*
========================================================
Question Title:
Team Match Statistics
========================================================

Problem Statement:
Given a table containing cricket match results,
write a SQL query to find:

1. Total matches played by each team
2. Total matches won by each team
3. Total matches lost by each team

========================================================
Input Table: MatchResults
========================================================

+---------+---------+--------+
| team_1  | team_2  | winner |
+---------+---------+--------+
| India   | SL      | India  |
| SL      | Aus     | Aus    |
| SA      | Eng     | Eng    |
| Eng     | NZ      | NZ     |
| Aus     | India   | India  |
+---------+---------+--------+

========================================================
Expected Output
========================================================

+-----------+----------------+------------+--------------+
| team_name | matches_played | no_of_wins| no_of_losses |
+-----------+----------------+------------+--------------+
| India     | 2              | 2          | 0            |
| SL        | 2              | 0          | 2            |
| SA        | 1              | 0          | 1            |
| Eng       | 2              | 1          | 1            |
| Aus       | 2              | 1          | 1            |
| NZ        | 1              | 1          | 0            |
+-----------+----------------+------------+--------------+

========================================================
Approach
========================================================

1. Teams are present in two different columns:
   - team_1
   - team_2

2. To make aggregation easier,
   both columns are converted into a single column
   using UNION ALL.

3. After normalization:
   - COUNT(*) gives matches played
   - CASE WHEN helps calculate wins/losses

========================================================
Solution
========================================================
*/

WITH all_teams AS (

    SELECT
        team_1 AS team_name,
        winner
    FROM MatchResults

    UNION ALL

    SELECT
        team_2 AS team_name,
        winner
    FROM MatchResults
)

SELECT
    team_name,
    COUNT(*) AS matches_played,

    SUM(
        CASE
            WHEN team_name = winner THEN 1
            ELSE 0
        END
    ) AS no_of_wins,

    SUM(
        CASE
            WHEN team_name <> winner THEN 1
            ELSE 0
        END
    ) AS no_of_losses

FROM all_teams
GROUP BY team_name
ORDER BY team_name;
