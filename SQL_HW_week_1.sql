# 1
SELECT dest FROM flights ORDER BY distance DESC LIMIT 1;

# 2
SELECT DISTINCT engines FROM planes;

SELECT * FROM (SELECT engines AS n_engines, MAX(seats) AS max_seats FROM planes GROUP BY n_engines) AS p1
LEFT JOIN planes AS p2
ON p1.max_seats=p2.seats AND p1.n_engines=p2.engines
ORDER BY n_engines ASC;

#3
SELECT COUNT(*) FROM flights;

#4
SELECT carrier, COUNT(*) AS n_flights FROM flights GROUP BY carrier ORDER BY carrier;

#5
SELECT name, COUNT(*) AS n_flights FROM 
airlines LEFT JOIN flights ON airlines.carrier=flights.carrier 
GROUP BY flights.carrier 
ORDER BY n_flights DESC;

#6
SELECT name, COUNT(*) AS n_flights FROM 
flights LEFT JOIN airlines ON flights.carrier=airlines.carrier 
GROUP BY flights.carrier 
ORDER BY n_flights DESC LIMIT 5;

#7
SELECT name, COUNT(*) AS n_flights FROM 
flights LEFT JOIN airlines ON flights.carrier=airlines.carrier WHERE distance>=1000
GROUP BY flights.carrier 
ORDER BY n_flights DESC LIMIT 5;

#8
### What is the total number of flights and average arrival delay by airline, ordered from highest to lowest delay?
SELECT name, AVG(arr_delay) AS avg_delay, COUNT(*) AS n_flights FROM 
flights LEFT JOIN airlines ON flights.carrier=airlines.carrier
GROUP BY flights.carrier
ORDER BY avg_delay DESC;