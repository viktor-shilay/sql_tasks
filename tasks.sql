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
SELECT DISTINCT Company.name as name FROM Trip
JOIN Company ON Trip.company = Company.id
WHERE Trip.plane = 'Boeing';

**********7**********
SELECT DISTINCT plane FROM Trip
WHERE town_to = 'Moscow';

**********8**********
SELECT DISTINCT town_to, TIMEDIFF(time_in, time_out) as flight_time FROM Trip
WHERE town_from = 'Paris';

**********9**********
SELECT DISTINCT Company.name as name FROM Trip
JOIN Company ON Trip.company = Company.id
WHERE town_from = 'Vladivostok';

**********10**********
SELECT * FROM Trip
WHERE time_out BETWEEN '1900-01-01T10:00:00.000Z' AND '1900-01-01T14:00:00.000Z'

**********11**********
SELECT name FROM Passenger
WHERE LENGTH (name) = (SELECT MAX(LENGTH (name)) FROM Passenger);

**********12**********
SELECT trip, COUNT(passenger) AS count FROM Pass_in_trip
GROUP BY trip;

**********13**********
SELECT name FROM Passenger
GROUP BY name HAVING COUNT(name) > 1;

**********14**********
SELECT town_to FROM Trip
JOIN Pass_in_trip ON Trip.id = Pass_in_trip.trip
JOIN Passenger ON Pass_in_trip.passenger = Passenger.id
WHERE Passenger.name = 'Bruce Willis';

**********15**********
SELECT time_in FROM Trip
JOIN Pass_in_trip ON Trip.id = Pass_in_trip.trip
JOIN Passenger ON Pass_in_trip.passenger = Passenger.id
WHERE town_to = 'London' AND Passenger.name = 'Steve Martin';

**********16**********
SELECT name, COUNT(Pass_in_trip.trip) as count FROM Pass_in_trip
JOIN Passenger ON Pass_in_trip.passenger = Passenger.id
GROUP BY name
ORDER BY count DESC, name ASC;

**********17**********
SELECT member_name, status, SUM(amount*unit_price) as costs FROM FamilyMembers
JOIN Payments ON FamilyMembers.member_id = Payments.family_member
WHERE YEAR(Payments.date) = 2005
GROUP BY member_name, status;

**********18**********
SELECT member_name FROM FamilyMembers
WHERE birthday = (SELECT MIN(birthday) FROM FamilyMembers);

**********19**********
SELECT DISTINCT status FROM FamilyMembers
JOIN Payments ON FamilyMembers.member_id = Payments.family_member
JOIN Goods ON Payments.good = Goods.good_id
WHERE good_name = 'potato';

**********20**********
SELECT status, member_name, SUM(amount*unit_price) as costs FROM FamilyMembers
JOIN Payments ON FamilyMembers.member_id = Payments.family_member
JOIN Goods ON Payments.good = Goods.good_id
JOIN GoodTypes ON Goods.type = GoodTypes.good_type_id
WHERE GoodTypes.good_type_name = 'entertainment'
GROUP BY status, member_name;

**********21**********
SELECT good_name FROM Goods
JOIN Payments ON Goods.good_id = Payments.good
GROUP BY good_name
HAVING COUNT(amount) > 1;

**********22**********
SELECT member_name FROM FamilyMembers
WHERE status = 'mother';

**********23**********
SELECT good_name, unit_price FROM GoodTypes
JOIN Goods ON GoodTypes.good_type_id = Goods.type
JOIN Payments ON Goods.good_id = Payments.good
WHERE GoodTypes.good_type_name = 'delicacies'
ORDER BY unit_price DESC
LIMIT 1

**********24**********
SELECT member_name, SUM(amount*unit_price) as costs FROM FamilyMembers
JOIN Payments ON FamilyMembers.member_id = Payments.family_member
WHERE date BETWEEN '2005-06-01T00:00:00.000Z' AND '2005-07-01T00:00:00.000Z'
GROUP BY member_name;

**********25**********
SELECT good_name FROM Goods
LEFT JOIN Payments ON Goods.good_id = Payments.good
AND YEAR(Payments.date) = 2005
WHERE Payments.good IS NULL
GROUP BY good_name;

**********27**********
SELECT good_type_name, SUM(amount * unit_price) as costs FROM GoodTypes
JOIN Goods ON GoodTypes.good_type_id = Goods.type
JOIN Payments ON Goods.good_id = Payments.good
WHERE YEAR(Payments.date) = '2005'
GROUP BY good_type_name;

**********28**********
SELECT COUNT(*) as count FROM Trip
WHERE town_from = 'Rostov' AND town_to = 'Moscow';

**********29**********
SELECT DISTINCT name FROM Passenger
JOIN Pass_in_trip ON Passenger.id = Pass_in_trip.passenger
JOIN Trip ON Pass_in_trip.trip = Trip.id
WHERE Trip.town_to = 'Moscow' AND Trip.plane = 'TU-134';

**********30**********
SELECT trip, COUNT(passenger) as count FROM Trip
JOIN Pass_in_trip ON Trip.id = Pass_in_trip.trip
GROUP BY trip
ORDER BY count DESC;

**********31**********
SELECT * FROM FamilyMembers
WHERE member_name LIKE('%Quincey');

**********32**********
SELECT FLOOR(AVG(TIMESTAMPDIFF(year, birthday, CURRENT_TIMESTAMP()))) as age
FROM FamilyMembers;

**********33**********
SELECT AVG(unit_price) as cost FROM Payments
JOIN Goods ON Payments.good = Goods.good_id
WHERE good_name = 'red caviar' OR good_name = 'black caviar';

**********34**********
SELECT COUNT(*) as count FROM Class
WHERE name LIKE ('10%')

**********35**********
SELECT COUNT(name) as count FROM Subject
JOIN Schedule ON Subject.id = Schedule.subject
WHERE Schedule.date = '2019-09-02T00:00:00.000Z'

**********36**********
SELECT * FROM Student
WHERE address LIKE('ul. Pushkina%');

**********37**********
SELECT MIN(TIMESTAMPDIFF(year, birthday, CURRENT_TIMESTAMP())) as year
FROM Student;

**********38**********
SELECT COUNT(first_name) as count
FROM Student
WHERE first_name = 'Anna';

**********39**********
SELECT COUNT(student) as count FROM Class
JOIN Student_in_class ON Class.id = Student_in_class.class
WHERE name = '10 B';

**********40**********
SELECT Subject.name as subjects FROM Subject
JOIN Schedule ON Subject.id = Schedule.subject
JOIN Teacher ON Schedule.teacher = Teacher.id
WHERE Teacher.last_name = 'Romashkin';

**********41**********
SELECT start_pair FROM Timepair
WHERE id = 4;

**********42**********
SELECT TIMEDIFF(MAX(end_pair), MIN(start_pair)) as time FROM Timepair
WHERE id BETWEEN 2 AND 4;

**********43**********
SELECT last_name FROM Teacher
JOIN Schedule ON TEacher.id = Schedule.teacher
JOIN Subject ON Schedule.subject = Subject.id
WHERE Subject.name = 'Physical Culture'
ORDER BY last_name;

**********44**********
SELECT MAX(TIMESTAMPDIFF(year, birthday, CURRENT_TIMESTAMP())) as max_year
FROM Student
JOIN Student_in_class ON Student.id = Student_in_class.student
JOIN Class ON Student_in_class.class= Class.id
WHERE Class.name LIKE('10%');

**********46**********
SELECT name FROM Class
JOIN Schedule ON Class.id = Schedule.class
JOIN Teacher ON Schedule.teacher = Teacher.id
WHERE Teacher.last_name = 'Krauze'
GROUP BY name;

**********47**********
SELECT COUNT(*) as count FROM Schedule
JOIN Teacher ON Schedule.teacher = Teacher.id
WHERE Schedule.date = '2019-08-30T00:00:00.000Z'
AND Teacher.last_name = 'Krauze';

**********48**********
SELECT name, COUNT(student) as count FROM Class
JOIN Student_in_class ON Class.id = Student_in_class.class
GROUP BY name
ORDER BY count DESC;

**********49**********
SELECT (COUNT(student) / (SELECT COUNT(*) FROM Student_in_class) * 100) as percent
FROM Class
JOIN Student_in_class ON Class.id = Student_in_class.class
WHERE Class.name = '10 A';

**********50**********
SELECT FLOOR((COUNT(birthday) / (SELECT COUNT(*) FROM Student) * 100)) as percent
FROM Student
WHERE YEAR(birthday) = 2000;
