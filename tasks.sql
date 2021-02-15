**********1**********
SELECT name FROM Passenger;

**********2**********
SELECT name FROM Company;

**********3**********
SELECT * FROM Trip
WHERE town_from = 'Moscow';

**********4**********
SELECT name FROM Passenger
WHERE name LIKE '%man';

**********5**********
SELECT COUNT(*) as count FROM Trip
WHERE plane = 'TU-134';

**********6**********
SELECT Company.name AS name FROM Trip, Company
WHERE Trip.plane = 'Boeing' AND Trip.company = Company.id
GROUP BY Trip.company;

**********7**********
SELECT plane FROM Trip
WHERE town_to = 'Moscow'
GROUP BY plane;

**********9**********
SELECT Company.name as name FROM Company, Trip
WHERE Trip.town_from = 'Vladivostok' AND Trip.company = Company.id
GROUP BY Company.name;

**********11**********
SELECT name FROM Passenger
WHERE LENGTH (name) = (SELECT MAX (LENGTH (name)) FROM Passenger);

**********12**********
SELECT trip, COUNT(passenger) AS count FROM Pass_in_trip
GROUP BY trip;

**********13**********
SELECT name FROM Passenger
GROUP BY name HAVING COUNT(name) > 1;

**********14**********
SELECT town_to FROM Trip, Pass_in_trip, Passenger
WHERE Trip.id = Pass_in_trip.trip AND Pass_in_trip.passenger = Passenger.id AND Passenger.name = 'Bruce Willis';
