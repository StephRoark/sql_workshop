
# Homework 1 Select and Aggregation

# Question 1 Which destination in the flights database is the furthest distance away, based on information in the flights table?

SELECT origin, dest, distance 
FROM flights 
ORDER BY distance DESC LIMIT 1;

# Check to see if max distance is equal to answer:

SELECT MAX(distance) 
FROM flights;

# Question 2 , Part 1 What are the different numbers of engines in the planes table? 

SELECT engines 
FROM planes 
GROUP BY engines ASC;

# Question 2, Part 2 For each number of engines, which aircraft have the most number of seats? 

SELECT type, engines, MAX(seats) 
FROM planes 
GROUP BY type,engines;

# Question 3 	Show the total number of flights. 

SELECT COUNT(*) 
FROM flights 
WHERE air_time > 0;

# Question 4	Show the total number of flights by airline (carrier). 

SELECT COUNT(*), carrier AS flights 
FROM flights 
WHERE air_time  is not null 
GROUP BY carrier 
ORDER BY COUNT(*) ASC;


# Question 5	Show all of the airlines, ordered by number of flights in descending order. 

SELECT carrier,COUNT(*) AS flights 
FROM flights 
WHERE air_time  is not null 
GROUP BY carrier 
ORDER BY flights DESC;

# Question 6	Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order. 

SELECT carrier, COUNT(*) AS flights 
FROM flights 
WHERE air_time  is not null 
GROUP BY carrier 
ORDER BY flights DESC LIMIT 5;
 
 # Question 7.	Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order. 

SELECT carrier, COUNT(*) AS flights 
FROM flights 
WHERE air_time  is not null AND distance >= 1000 
GROUP BY carrier 
ORDER BY flights DESC LIMIT 5;

# Question 8, Part 1: What is the total number of flight miles per airline? 

SELECT carrier, SUM(distance) AS miles 
FROM flights 
WHERE air_time is not null 
GROUP BY carrier 
ORDER BY miles DESC;

# Question 8, Part 2: What are the average flight miles by carrier in the year 2013?

SELECT carrier, SUM(distance) AS miles 
FROM flights 
WHERE air_time is not null 
GROUP BY carrier 
ORDER BY miles DESC;


