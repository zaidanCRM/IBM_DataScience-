use space_x;
select * from spacex;

select distinct(Launch_Site) from spacex;

-- Display 5 records where launch sites begin with the string 'CCA'

select Launch_Site from spacex
where Launch_Site like('CCA%')
limit 5;

 -- Display the total payload mass carried by boosters launched by NASA (CRS)
SELECT SUM(PAYLOAD_MASS__KG_) 
FROM SPACEX
WHERE Customer LIKE('%NAS%');

-- '107010' -- 
-- Display average payload mass carried by booster version F9 v1.1
SELECT * FROM SPACEX;
select AVG(PAYLOAD_MASS__KG_) FROM SPACEX
WHERE Booster_Version = 'F9 v1.1';
-- 2928.40 --- 

-- List the date when the first successful landing outcome in ground pad was acheived.
SELECT min(date) FROM SPACEX
where  Loutcome = 'Success (ground pad)';
-- '1/5/2017'
select distinct(Loutcome) from spacex;


-- List the names of the boosters which have success in drone ship and have payload mass greater than 4000 but less than 6000¶

select Booster_Version from spacex
where PAYLOAD_MASS__KG_ > 4000  
	  AND PAYLOAD_MASS__KG_ <6000
      and Loutcome = 'Success (drone ship)';

-- List the total number of successful and failure mission outcomes 
select count(MOutcome) from spacex
where MOutcome like('Failu%');
-- 1 failed 
select count(MOutcome) from spacex
where MOutcome like('Su%');
-- 100 sucess 


-- List the names of the booster_versions which have carried the maximum payload mass. Use a subquery

select Booster_Version from spacex
where PAYLOAD_MASS__KG_ = (select max(PAYLOAD_MASS__KG_) from spacex);


-- List the failed landing_outcomes in drone ship, their booster versions, and launch site names for in year 2015

select Loutcome , Booster_Version , Launch_Site , year(STR_TO_DATE(Date, '%m/%d/%Y')) as year_launch from spacex
where Loutcome = 'Failure (drone ship)'
AND year(STR_TO_DATE(Date, '%d/%m/%Y')) = 2015
OR year(STR_TO_DATE(Date, '%d-%m-%Y')) = 2015;


select Date,Loutcome from spacex
where Loutcome like('%Fai%');


-- Rank the count of landing outcomes (such as Failure (drone ship) or Success (ground pad)) 
-- between the date 2010-06-04 and 2017-03-20, in descending order.. 

select * from spacex;
select  COUNT(customer)  over ( partition by Loutcome order by count(Loutcome) desc ) from spacex;


-- min payload mass 

select min(PAYLOAD_MASS__KG_) from spacex;

-- total payload_mass_kg

select sum(PAYLOAD_MASS__KG_) as total_payload_mass_kg from spacex;


-- launch in friday 

SELECT * FROM spacex where DAY(DATE)='Friday' LIMIT 5;

-- unique launch sites 

select distinct(Launch_Site) from spacex;


