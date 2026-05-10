/*
========================================================
Question Title:
Find Nth Occurrence of Weekday from Given Date
========================================================

Problem Statement:
Given:
1. A start date
2. A target weekday
3. An occurrence number (n)

Write a SQL query to find the date of the nth
future occurrence of the target weekday
from the given start date.

Weekday Mapping:
Sunday    = 1
Monday    = 2
Tuesday   = 3
Wednesday = 4
Thursday  = 5
Friday    = 6
Saturday  = 7

========================================================
Example
========================================================

Input:
start_date      = '2026-05-10'
target_weekday  = 7 (Saturday)
n               = 6

Output:
2026-06-20

Explanation:
1st Saturday from 2026-05-10 -> 2026-05-16
6th Saturday -> 2026-06-20

========================================================
Approach
========================================================

1. Extract current weekday from given date
2. Calculate how many days until first occurrence
   of target weekday using circular weekday logic
3. Since weekdays repeat every 7 days:
      additional_days = (n - 1) * 7
4. Add total days to start date using DATEADD()

========================================================
Solution
========================================================
*/
declare @start_date date,
		@target_weekday int,
		@n int,
		@extract_weekday_from_given_date int,
		@first_occurence_of_given_day int;

set @start_date = '2026-05-10';
set @target_weekday = 7;
set @n = 6;
set @extract_weekday_from_given_date = datepart(weekday,@start_date);

--basically first we calculate how many days from given date is the first occurence of given target date
set @first_occurence_of_given_day = (@target_weekday - @extract_weekday_from_given_date + 7)%7 -- because weekday is circular after 7 again 1 comes

--then basically add how many occurences given after which target weekday comes (n-1)*7
select dateadd(day, @first_occurence_of_given_day + (@n-1)*7,@start_date)
