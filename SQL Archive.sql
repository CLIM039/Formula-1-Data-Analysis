-- Task 1: Get the Top 3 drivers who made the fastest lap in Spa

SELECT drivers.forename || drivers.surname AS Racing_Driver,
		races.circuitId,
		races.name,
		lap_times.time_in_s
FROM lap_times
INNER JOIN races ON lap_times.raceId = races.raceId
INNER JOIN drivers ON lap_times.driverId = drivers.driverId
WHERE races.circuitId = 13
ORDER BY lap_times.time_in_s ASC
LIMIT 3


-- Task 2: Get the min (fastest) and mean lap time for every year for Spa

SELECT races.year,
		MIN(lap_times.time_in_s),
		AVG(lap_times.time_in_s),
		races.circuitId,
		races.name
FROM lap_times
INNER JOIN races ON lap_times.raceId = races.raceId
WHERE races.circuitId = 13
GROUP BY races.year


-- Task 3: Get the top 5 drivers that won the most number of champions from Spa

SELECT drivers.forename || drivers.surname AS Racing_Driver,
		COUNT(results.raceId) AS Number_of_Champion_Won,
		races.circuitId,
		races.name,
		results.position
FROM results
INNER JOIN races ON results.raceId = races.raceId
INNER JOIN drivers ON results.driverId = drivers.driverId
WHERE results.position = 1 AND circuitId = 13
GROUP BY drivers.driverId
ORDER BY Number_of_Champion_Won DESC
LIMIT 5

-- Task 4: Get the top 5 constructors that won the most number of champions from SPA
SELECT constructors.name,
		COUNT(results.raceId) AS Number_of_Champion_Won,
		races.circuitId,
		races.name,
		results.position
FROM results
INNER JOIN races ON results.raceId = races.raceId
INNER JOIN constructors ON results.constructorId = constructors.constructorId
WHERE results.position = 1 AND races.circuitId = 13
GROUP BY constructors.constructorId
ORDER BY Number_of_Champion_Won DESC
LIMIT 5