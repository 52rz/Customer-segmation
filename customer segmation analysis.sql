select *  from [dbo].[WA_Fn-UseC_-Marketing-Customer-Value-Analysis - Copy convt] ;
select * from [dbo].[MCVA];



Q1###
HOWMANY people are working ?

SELECT COUNT(*) AS TotalEmployeesWorking
FROM [dbo].[MCVA]
WHERE EmploymentStatus = 'UnEmployed';

5698
2317
Q2##
State wise working ?

SELECT state, COUNT(*) AS total_people
FROM [dbo].[MCVA]
GROUP BY state;


Arizona	1703
Oregon	2601
California	3150
Washington	798
Nevada	882

Q3####
state wise customer life_time_value?

SELECT State, SUM(Customer_Lifetime_Value) AS TotalLifetimeValue
FROM [dbo].[MCVA]
GROUP BY State;

Arizona	13387864.556465
Oregon	21010620.997208
California	25211490.438839
Washington	6401134.87364
Nevada	7106015.43238

customer and  state wise cusr=tomer lifetime value?
SELECT 
    State,
    Customer,
    SUM(Customer_Lifetime_Value) AS LifetimeValue
FROM 
    [dbo].[MCVA]
GROUP BY 
    State, Customer;

	Q5##
	state wise coverage takeeen?

	SELECT state, COUNT(*) AS coverage
FROM [dbo].[MCVA]
GROUP BY state;

Arizona	1703
Oregon	2601
California	3150
Washington	798
Nevada	882

Q6###
what different coverage in are?
SELECT DISTINCT coverage
FROM[dbo].[MCVA];
Extended
Basic
Premium

Q7##
whos more educated man or women?

SELECT 
    CASE
        WHEN SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) THEN 'M'
        ELSE 'F'
    END AS more_educated
FROM [dbo].[MCVA];


state wise educated count?
SELECT State, 
       SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS Male_Count,
       SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS Female_Count
FROM  [dbo].[MCVA]
GROUP BY State;

SELECT State, Education, COUNT(*) AS NumberOfPeople
FROM [dbo].[MCVA]
GROUP BY State, Education;

Q10#

most education statewis?
SELECT state,
       
      MAX(Education) 
FROM [dbo].[MCVA]
GROUP BY state, Education
order by Education desc ;

Q11####################################
2nd hishest income in state wise?
SELECT State,Gender, MAX(income) AS SecondHighestIncome
FROM (
    SELECT State,Gender,income, DENSE_RANK() OVER (ORDER BY Income DESC) AS incomeRank
    FROM [dbo].[MCVA]
) AS Rankedincome
WHERE incomeRank = 2
group by Gender,State;

Oregon	F	99961


SELECT Customer, Gender,Income
FROM [dbo].[MCVA]
WHERE Income <(SELECT AVG(BU79786) FROM [dbo].[MCVA]);





