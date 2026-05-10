/*
========================================================
Question Title:
Employee Floor Visits Analysis
========================================================

Problem Statement:
Given an entries table containing employee visits to
different floors and the resources they used,
write a SQL query to find:

1. Total number of visits by each employee
2. Most visited floor for each employee
3. Unique resources used by each employee
   as a comma-separated string

========================================================
Input Table: entries
========================================================

+------+-----------+----------------+-------+-----------+
| name | address   | email          | floor | resources |
+------+-----------+----------------+-------+-----------+
| A    | Bangalore | A@gmail.com    | 1     | CPU       |
| A    | Bangalore | A1@gmail.com   | 1     | CPU       |
| A    | Bangalore | A2@gmail.com   | 2     | DESKTOP   |
| B    | Bangalore | B@gmail.com    | 2     | DESKTOP   |
| B    | Bangalore | B1@gmail.com   | 2     | DESKTOP   |
| B    | Bangalore | B2@gmail.com   | 1     | MONITOR   |
+------+-----------+----------------+-------+-----------+

========================================================
Expected Output
========================================================

+------+----------------+----------------------+-------------------+
| name | total_visits   | most_visited_floor   | resources_used   |
+------+----------------+----------------------+-------------------+
| A    | 3              | 1                    | CPU,DESKTOP      |
| B    | 3              | 2                    | DESKTOP,MONITOR  |
+------+----------------+----------------------+-------------------+

========================================================
Approach
========================================================

1. Calculate total visits for each employee
2. Calculate floor visit frequency per employee
3. Use ROW_NUMBER() to identify most visited floor
4. Remove duplicate resources using DISTINCT
5. Aggregate resources using STRING_AGG()
6. Join all intermediate datasets together

========================================================
Solution
========================================================
*/


with visits as(
	select  name,count(*) as no_of_visits
	from entries e
	group by name),
	
freq_floor as(
	select name,floor,count(*) no_of_vists_per_floor
	from entries
	group by name,floor),
	
max_floor_visit as(
	select name,floor as most_visited_floor 
	from (
			select *,
			row_number() over (partition by name order by  no_of_vists_per_floor desc) rn
			from freq_floor a
		  )a
	where rn=1),
	
allresources as
	(
	select name,STRING_AGG(resources, ',') as resources
	from (
		select distinct name, resources
		from entries
	) a
	group by name)
	
select v.name, no_of_visits,most_visited_floor,r.resources
from visits v 
join max_floor_visit m on v.name = m.name
join allresources r on r.name = v.name
