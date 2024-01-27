Write SQL query to find the highest number of rapes & Kidnappings that happened in which 
state, District, and year

select `Kidnapping and Abduction` from 42_District_wise_crimes_committed_against_women_2001_2012;
select `STATE/UT`, `DISTRICT`, `Year` from 42_District_wise_crimes_committed_against_women_2001_2012
where Rape + `Kidnapping and Abduction` = (select max(Rape + `Kidnapping and Abduction`) from 42_District_wise_crimes_committed_against_women_2001_2012);

select `STATE/UT`, `DISTRICT`, `Year` from 42_District_wise_crimes_committed_against_women_2001_2012
where Rape + `Kidnapping and Abduction` = (select min(Rape + `Kidnapping and Abduction`) from 42_District_wise_crimes_committed_against_women_2001_2012);

select * from 02_District_wise_crimes_committed_against_ST_2001_2012;

select  `DISTRICT` from 02_District_wise_crimes_committed_against_ST_2001_2012
where Dacoity + `Robbery` = (select max(Dacoity + `Robbery`) from 02_District_wise_crimes_committed_against_ST_2001_2012);

select  `DISTRICT` from 02_District_wise_crimes_committed_against_ST_2001_2012
where Murder = (select min(Murder) from 02_District_wise_crimes_committed_against_ST_2001_2012);

/*Write SQL query to find the number of murders in ascending order in district and yearwise.*/

select `DISTRICT`, `Year`, Murder from 02_District_wise_crimes_committed_against_ST_2001_2012
group by `Year`,`DISTRICT`, Murder
order by Murder ASC;

/*3.8.1	Insert records of STATE/UT, DISTRICT, YEAR, MURDER, ATTEMPT TO MURDER, and RAPE
 columns only from 01_District_wise_crimes_committed_IPC_2001_2012.csv into a new table*/

select * from 01_District_wise_crimes_committed_IPC_2001_2012;

/*3.8.2	Write SQL query to find which District in each state/ut has the highest number of 
murders yearwise. Your output should show STATE/UT, YEAR, DISTRICT, and MURDERS.*/

select `STATE/UT`, `YEAR`, DISTRICT, Max(MURDER) from 01_District_wise_crimes_committed_IPC_2001_2012
group by DISTRICT
order by `YEAR` ASC;

SELECT `STATE/UT`, `YEAR`, DISTRICT, MURDER
FROM (SELECT `STATE/UT`, `YEAR`, DISTRICT, MURDER, RANK() OVER (PARTITION BY `STATE/UT`, `YEAR` ORDER BY MURDER DESC) AS dis
    FROM 01_District_wise_crimes_committed_IPC_2001_2012
) AS district_data
WHERE dis = 1;







