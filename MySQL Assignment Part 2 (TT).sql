#Task_1
#Using count, get the number of cities in the USA
USE world;
SELECT COUNT(DISTINCT Name) as 'No of cities in the USA'
FROM city
;

#Task_2 - Find out what the population and average life expectency for people in Argentina (ARG) is. 
#Finding population 
USE world;
SELECT population 
FROM Country
WHERE Code = 'ARG';


#Finding average life expectency
SELECT LifeExpectancy
FROM Country
WHERE Code = 'ARG';


#Task_3 
#Using ORDER BY, LIMIT, what country has the highest life expectency?
SELECT *
FROM Country
ORDER BY LifeExpectancy DESC
LIMIT 1;


#Task_4 
#Select 25 cities around the world that start with the letter 'F' in a single SQL query 
SELECT Name
FROM City
WHERE Name LIKE 'F%'
LIMIT 25;


#Task_5a
#Create an SQL statment to display columns ID, Name, Population from the city table and limit results to first 10 rows only
SELECT ID, Name, Population
FROM City
Limit 10;


#Task_5b
# Create an SQL statement to display columns Id, Name, Population from the city table and limit results to rows 31-40.
SELECT ID, Name, Population
FROM City
Limit 30, 10;


#Task_6
#Create an SQl Statement to find only those cities from city table whose population is larger than 2000000
SELECT *
From City 
WHERE Population > 2000000;


#Task_7
#Create an SQL statement to find all city names from city table whose name begins with "Be" prefix 
SELECT Name
FROM City
WHERE Name LIKE 'Be%';


#Task_8
#Create an SQL statement to find only those cities from city table whose population is between 50000 - 1000000.
SELECT *
From City 
WHERE Population BETWEEN 50000 AND 1000000;


#Task_9 Create an SQL statement to display all cities from the city table sorted by Name in ascending order.
SELECT *
FROM City 
ORDER BY Name ASC;


#Task_10 
#Create an SQL statemnet to find a city with the lowest population in city table. 
SELECT *
From City 
ORDER BY Population ASC
LIMIT 1;


#Task_11
#Create an SQL statement to find a country with the largest population in the country table.
SElECT *
FROM Country 
ORDER BY Population DESC
LIMIT 1;


# ****** Bonus tasks ******
# Task 1 -  Create SQL statement to find the capital of Spain (ESP)
SELECT City.Name AS Capital
FROM City
JOIN Country ON City.ID = Country.Capital
WHERE Country.Code = 'ESP';


#Task 2 - Create an SQL statement to list all the languages spoken in the Carribbean region 
SELECT DISTINCT Language
FROM Country 
JOIN CountryLanguage ON Country.code = CountryCode
WHERE country.Region = 'Caribbean';


#Task 3 - Create an SQL statement to find all the cities from the Europe continent 
SELECT City.Name
FROM City
JOIN Country ON City.CountryCode = Country.Code
WHERE Country.Continent = 'Europe';


#Task 4 - Create an SQL statement to find the most populated city in the city table.
SELECT Name AS Most_Populated_City
FROM City
WHERE Population = (
    SELECT MAX(Population)
    FROM City
);
