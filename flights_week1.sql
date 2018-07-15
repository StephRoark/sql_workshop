
# Homework 1 Select and Aggregation

# Question 1 

SELECT origin, dest, distance 
FROM flights 
ORDER BY distance DESC LIMIT 1;

# Check to see if max distance is equal to answer:

SELECT MAX(distance) 
FROM flights;

# Question 2 , Part 1

SELECT engines 
FROM planes 
GROUP BY engines ASC;

# Question 2, Part 2

SELECT type, engines, MAX(seats) 
FROM planes 
GROUP BY type,engines;

# Question 3

SELECT COUNT(*) 
FROM flights 
WHERE air_time > 0;

# Question 4

SELECT COUNT(*), carrier AS flights 
FROM flights 
WHERE air_time  is not null 
GROUP BY carrier 
ORDER BY COUNT(*) ASC;


# Question 5

SELECT carrier,COUNT(*) AS flights 
FROM flights 
WHERE air_time  is not null 
GROUP BY carrier 
ORDER BY flights DESC;

# Question 6

SELECT carrier, COUNT(*) AS flights 
FROM flights 
WHERE air_time  is not null 
GROUP BY carrier 
ORDER BY flights DESC LIMIT 5;
 
 # Question 7

SELECT carrier, COUNT(*) AS flights 
FROM flights 
WHERE air_time  is not null AND distance >= 1000 
GROUP BY carrier 
ORDER BY flights DESC LIMIT 5;

# Question 8, Part 1

SELECT carrier, SUM(distance) AS miles 
FROM flights 
WHERE air_time is not null 
GROUP BY carrier 
ORDER BY miles DESC;

# Question 8, Part 2

SELECT carrier, SUM(distance) AS miles 
FROM flights 
WHERE air_time is not null 
GROUP BY carrier 
ORDER BY miles DESC;


