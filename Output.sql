use movie_management;

#--------------------------------------OUTPUT-------------------------
#--------------MOVIE TABLE----------------------
SELECT * FROM movie;

#--------------SHOWTABLE TABLE----------------------
SELECT * FROM showtime;

#--------------SEAT TABLE----------------------
SELECT * FROM seat;

#--------------BOOKING TABLE----------------------
SELECT * FROM booking;

#--------------PAYMENT TABLE----------------------
SELECT * FROM payment;

#----------------Screen Table----------------------
SELECT * FROM screenid;

#-------------------------Full Booking Output-------------
select * from full_booking_view;

#-----------------------Available Seats ------------
CREATE VIEW available_seats AS
SELECT * FROM seat WHERE status = 'Available';

drop view available_seats;
#---------------------Available Seats Output----------
Select * from available_seats;


#------------------------Revenue Report Output-------------
select * from revenue_per_movie;

#----------------Show all Hindi movies:------------------
SELECT * FROM movie
WHERE movie_language = 'Hindi';

#-------------------Movies sorted by release date (new → old)-------------

SELECT movie_name, release_date
FROM movie
ORDER BY release_date DESC;

#---------------------------Top 5 trending movies--------------------

SELECT movie_name, movie_status
FROM movie
WHERE movie_status = 'Running'
LIMIT 5;

#-------------------------Movies starting with “A”----------------

SELECT * FROM movie
WHERE movie_name LIKE 'A%';

#-------------Movies NOT released yet----------------

SELECT * FROM movie
WHERE movie_status NOT IN ('Running');

#----------------Show showtime with movie & screen------------

SELECT m.movie_name, sc.screen_name, s.show_time
FROM showtime s
JOIN movie m ON s.movie_id = m.movie_id
JOIN screenid sc ON s.screen_id = sc.screen_id;

#--------------LEFT JOIN-------------------

#----------------Show all movies even if shows are not added---------------

SELECT m.movie_name, s.show_time
FROM movie m
LEFT JOIN showtime s ON m.movie_id = s.movie_id;

#----------------GROUP BY----------------------------

#------------------Total shows per movie-------------------

SELECT movie_id, COUNT(*) AS total_shows
FROM showtime
GROUP BY movie_id;


#-----------------------------CASE---------------------

#-------------------------Seat price by seat type--------------------------

SELECT seat_number,
CASE 
    WHEN seat_type = 'Normal' THEN 150
    WHEN seat_type = 'Gold' THEN 250
    WHEN seat_type = 'VIP' THEN 350
END AS price
FROM seat;

#-----------------SUBQUERY----------------------

#------------------------------Movies more expensive than average ticket--------------------

SELECT * FROM showtime
WHERE price > (SELECT AVG(price) FROM showtime);

#--------------------Views------------------------

#--------------------Full Booking View--------------
CREATE VIEW full_booking_view AS
SELECT b.booking_id, m.movie_name, s.show_date, s.show_time,
se.seat_number, b.total_amount, p.payment_status
FROM booking b
JOIN showtime s ON b.show_id = s.show_id
JOIN movie m ON s.movie_id = m.movie_id
JOIN seat se ON b.seat_id = se.seat_id
LEFT JOIN payment p ON b.booking_id = p.booking_id;

select * from full_booking_view;
#---------------------Revenue Report----------------
CREATE VIEW revenue_per_movie AS
SELECT m.movie_name, SUM(b.total_amount) AS total_revenue
FROM booking b
JOIN showtime s ON b.show_id = s.show_id
JOIN movie m ON s.movie_id = m.movie_id
GROUP BY m.movie_name;

select * from revenue_per_movie;
#---------------Show Occupancy Report------------------

CREATE VIEW vw_show_occupancy AS
SELECT 
    m.movie_name,
    sc.screen_name,
    s.show_time,
    s.total_seats,
    (s.total_seats - s.avaiable_seat) AS booked_seats,
    ROUND(((s.total_seats - s.avaiable_seat) / s.total_seats) * 100, 2) AS occupancy_percent
FROM showtime s
JOIN movie m ON s.movie_id = m.movie_id
JOIN screenid sc ON s.screen_id = sc.screen_id;

select * from vw_show_occupancy;
#----------------- Daily Revenue-------------------

CREATE VIEW vw_daily_revenue AS
SELECT 
    DATE(b.booking_date) AS booking_day,
    m.movie_name,
    SUM(b.total_amount) AS revenue,
    COUNT(b.booking_id) AS total_bookings
FROM booking b
JOIN showtime s ON b.show_id = s.show_id
JOIN movie m ON s.movie_id = m.movie_id
GROUP BY booking_day, m.movie_name;

select * from vw_daily_revenue;
#--------------------------Payment Summary---------------------

CREATE VIEW vw_payment_summary AS
SELECT 
    p.payment_method,
    COUNT(*) AS total_payments,
    SUM(b.total_amount) AS total_amount
FROM payment p
JOIN booking b ON p.booking_id = b.booking_id
GROUP BY p.payment_method
ORDER BY total_amount DESC;

select * from vw_payment_summary;

#-----------------Seat Availability Per Screen-----------------

CREATE VIEW vw_seat_availability AS
SELECT 
    sc.screen_name,
    st.seat_number,
    st.seat_type,
    st.status
FROM seat st
JOIN screenid sc ON st.screen_id = sc.screen_id;

select * from vw_seat_availability;