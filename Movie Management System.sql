#'''Database Name is Movie_Management'''
#'''-----------Movie Management Start----------------'''

Create database Movie_Management;

#'''----------------Movie Start------------------------'''

#'''----------------Table name is Movie----------------'''
create table Movie(
movie_id int primary key,
movie_name varchar(100) not null,
movie_language varchar (30) not null,
category varchar(50) not null,
duration varchar(50),
censor_rating varchar(50) not null,
actors varchar(60) not null,
director varchar(60) not null,
producer varchar(50) not null,
release_date date not null,
end_date date not null,
description text ,
poster_url varchar(50),
trailer_url varchar(50),
movie_status varchar(50)
);
#'''----------------Movie End------------------------'''

#'''-----------------Showtime Table Start------------------------------'''

create table Showtime(
show_id int primary key,
movie_id int  references movie(movie_id),
screen_id int references seat(screen_id),
show_date date,
show_time time,
seat_type varchar(20),
price decimal,
avaiable_seat int,
total_seats int references total_seat(total_seats)
);

#'''-----------------Showtime Table End--------------------------------'''

#'''-------------------Total Seat Table Strat--------------------------'''

create table total_seat(
total_seats int primary key
);

#'''-------------------Total Seat Table End--------------------------'''

#'''----------------Screen Table Start-----------------------------------'''

create table screenid(
screen_id int primary key,
screen_name varchar(50),
total_seats int references total_seat(total_seats)
);

#'''----------------Screen Table Start-----------------------------------'''

#'''----------------Seat Table Start-----------------------------------'''

create table seat(
seat_id int,
screen_id int references screenid(screen_id),
seat_number varchar (50),
srow varchar(50),
seat_type varchar(50),
price decimal,
status varchar(50)
);
#'''----------------Seat Table Start-----------------------------------'''

#'''---------------Booking Table Start--------------------------------'''
create table booking(
booking_id int primary key,
show_id int references showtime(show_id),
seat_id int references seat(seat_id),
booking_date datetime,
total_amount decimal,
payment_status varchar(50)
);
#------------------Booking Table End----------------------------------'''

#------------------Payment Table Start------------------------------'''

create table payment(
payment_id int,
booking_id int references booking(booking_id),
payment_method varchar(50),
transaction_id varchar(50),
payment_status varchar(50)
);

#------------------Payment Table End------------------------------'''
#----------------------------------------------INSERTION PART START-------------------------------------
#'''-------------------------Movie Data Insertion Start --------------------'''

INSERT INTO movie 
(movie_id,movie_name,movie_language,category,duration,censor_rating,actors, director,producer,release_date,end_date,description,poster_url,trailer_url,movie_status)
VALUES
(1, 'Pathaan', 'Hindi', 'Action', '2h 26m', 'UA', 'Shah Rukh Khan, Deepika Padukone, John Abraham', 'Siddharth Anand', 'Aditya Chopra', '2023-01-25', '2023-04-30', 'A spy embarks on a dangerous mission to protect the nation.', 'poster_pathaan.jpg', 'https://youtu.be/vqu4z34wENw', 'Expired'),

(2, 'Leo', 'Tamil', 'Action Thriller', '2h 44m', 'UA', 'Vijay, Trisha, Sanjay Dutt', 'Lokesh Kanagaraj', 'Seven Screen Studio', '2023-10-19', '2024-01-15', 'A café owner gets involved in a violent past he tried to forget.', 'poster_leo.jpg', 'https://youtu.be/Po3jStA673E', 'Expired'),

(3, 'Jawan', 'Hindi', 'Action Drama', '2h 49m', 'UA', 'Shah Rukh Khan, Nayanthara, Vijay Sethupathi', 'Atlee', 'Gauri Khan', '2023-09-07', '2023-12-25', 'A man fights corruption and injustice with a team of skilled women.', 'poster_jawan.jpg', 'https://youtu.be/COv52Qyctws', 'Expired'),

(4, 'KGF Chapter 2', 'Kannada', 'Action', '2h 48m', 'UA', 'Yash, Sanjay Dutt, Raveena Tandon', 'Prashanth Neel', 'Vijay Kiragandur', '2022-04-14', '2022-09-30', 'Rocky battles powerful enemies to secure his empire.', 'poster_kgf2.jpg', 'https://youtu.be/Qah9sSIXJqk', 'Expired'),

(5, 'RRR', 'Telugu', 'Action Drama', '3h 07m', 'UA', 'Ram Charan, Jr. NTR, Alia Bhatt', 'S. S. Rajamouli', 'DVV Danayya', '2022-03-25', '2022-08-15', 'Two revolutionaries fight against the British Raj.', 'poster_rrr.jpg', 'https://youtu.be/oiCDd5bD0lI', 'Expired'),

(6, 'Avatar: The Way of Water', 'English', 'Sci-Fi', '3h 12m', 'UA', 'Sam Worthington, Zoe Saldana', 'James Cameron', 'Jon Landau', '2022-12-16', '2023-03-30', 'Jake Sully protects his family from a new threat.', 'poster_avatar2.jpg', 'https://youtu.be/d9MyW72ELq0', 'Expired'),

(7, 'Sita Ramam', 'Telugu', 'Romantic Drama', '2h 38m', 'U', 'Dulquer Salmaan, Mrunal Thakur', 'Hanu Raghavapudi', 'Swapna Cinema', '2022-08-05', '2022-11-20', 'A soldier’s love letter changes two lives forever.', 'poster_sitaramam.jpg', 'https://youtu.be/5N0j2T3qU_U', 'Expired'),

(8, 'Animal', 'Hindi', 'Action Drama', '3h 21m', 'A', 'Ranbir Kapoor, Rashmika Mandanna', 'Sandeep Reddy Vanga', 'Bhushan Kumar', '2023-12-01', '2024-03-15', 'A man’s obsession with his father leads to violence.', 'poster_animal.jpg', 'https://youtu.be/6JnGBs88sL0', 'Running'),

(9, 'Dunki', 'Hindi', 'Comedy Drama', '2h 41m', 'U', 'Shah Rukh Khan, Taapsee Pannu', 'Rajkumar Hirani', 'Gauri Khan', '2023-12-21', '2024-04-10', 'Friends take an illegal route to reach abroad.', 'poster_dunki.jpg', 'https://youtu.be/Abh9Dlb-sxE', 'Running'),

(10, 'Kantara', 'Kannada', 'Action Thriller', '2h 30m', 'UA', 'Rishab Shetty, Sapthami Gowda', 'Rishab Shetty', 'Hombale Films', '2022-09-30', '2023-02-15', 'A man faces divine justice in a remote village.', 'poster_kantara.jpg', 'https://youtu.be/ppYoIoW73PI', 'Expired');


#--------------------------Movie Data Insertion End------------------------'''


#'''-------------------------Showtime Table Data Insertion Start --------------------'''
INSERT INTO showtime 
(show_id, movie_id, screen_id, show_date, show_time, seat_type, price, avaiable_seat, total_seats)
VALUES
(1, 1, 1, '2024-12-20', '10:00', 'Normal', 180, 45, 100),
(2, 1, 1, '2024-12-20', '13:30', 'Gold', 250, 30, 80),
(3, 2, 2, '2024-12-21', '11:00', 'Normal', 200, 70, 120),
(4, 2, 2, '2024-12-21', '17:00', 'VIP', 350, 20, 50),
(5, 3, 3, '2024-12-22', '09:45', 'Normal', 170, 55, 100),
(6, 3, 3, '2024-12-22', '14:15', 'Gold', 200, 40, 80),
(7, 8, 1, '2024-12-23', '18:30', 'VIP', 400, 12, 40),
(8, 8, 1, '2024-12-23', '09:25', 'Recliner', 550, 5, 25),
(9, 9, 4, '2024-12-24', '13:00', 'Normal', 150, 80, 120),
(10, 9, 4, '2024-12-24', '16:30', 'Gold', 230, 50, 80);

#--------------------------Showtime Table Data Insertion End------------------------'''

#'''-------------------------Seat Table Data Insertion Start --------------------'''
INSERT INTO seat 
(seat_id, screen_id, seat_number, srow, seat_type, price, status)
VALUES
(1, 1, 'A1', 'A', 'Normal', 180, 'Available'),
(2, 1, 'A2', 'A', 'Normal', 180, 'Booked'),
(3, 1, 'B1', 'B', 'Gold', 250, 'Available'),
(4, 1, 'B2', 'B', 'Gold', 250, 'Booked'),
(5, 2, 'C1', 'C', 'VIP', 350, 'Available'),
(6, 2, 'C2', 'C', 'VIP', 350, 'Booked'),
(7, 3, 'D1', 'D', 'Normal', 170, 'Available'),
(8, 3, 'D2', 'D', 'Normal', 170, 'Booked'),
(9, 4, 'E1', 'E', 'Recliner', 550, 'Available'),
(10, 4, 'E2', 'E', 'Recliner', 550, 'Booked');

#--------------------------Seat Table Data Insertion End------------------------'''

#'''-------------------------Booking Table Data Insertion Start --------------------'''

INSERT INTO booking
(booking_id, show_id, seat_id, booking_date, total_amount, payment_status)
VALUES
(1, 1, 1, '2024-12-15 10:05', 180, 'Paid'),
(2, 1, 2, '2024-12-15 10:06', 180, 'Paid'),
(3, 2, 3, '2024-12-16 13:10', 250, 'Pending'),
(4, 2, 4, '2024-12-16 13:22', 250, 'Paid'),
(5, 3, 5, '2024-12-17 11:45', 350, 'Cancelled'),
(6, 3, 6, '2024-12-17 11:47', 350, 'Paid'),
(7, 7, 7, '2024-12-18 18:02', 170, 'Paid'),
(8, 7, 8, '2024-12-18 18:05', 170, 'Pending'),
(9, 9, 9, '2024-12-19 13:59', 550, 'Paid'),
(10, 10, 10, '2024-12-19 16:20', 550, 'Cancelled');

#--------------------------Booking Table Data Insertion End------------------------'''

#'''-------------------------Payment Table Data Insertion Start --------------------'''
INSERT INTO payment
(payment_id, booking_id, payment_method, transaction_id, payment_status)
VALUES
(1, 1, 'UPI',  'TXNUPI781234', 'Success'),
(2, 2, 'Card', 'TXNCRD903421', 'Success'),
(3, 3, 'UPI',  'TXNUPI552190', 'Pending'),
(4, 4, 'Cash', 'N/A',          'Success'),
(5, 5, 'UPI',  'TXNUPI672145', 'Failed'),
(6, 6, 'Card', 'TXNCRD112340', 'Success'),
(7, 7, 'Cash', 'N/A',          'Success'),
(8, 8, 'UPI',  'TXNUPI991267', 'Pending'),
(9, 9, 'Card', 'TXNCRD781234', 'Success'),
(10, 10, 'UPI', 'TXNUPI442210', 'Failed');

#--------------------------Payment Table Data Insertion End------------------------'''

#'''-------------------------Screen Table Start-----------------------------------'''

insert into screenid 
(screen_id,screen_name,Total_seats)
values
(1,"Screen 1",120),
(2,"Screen 2",150),
(3,"Screen 3",100),
(4,"Screen 4",180),
(5,"VIP Screen",30);

#'''-------------------------Screen Table End--------------------------------------'''

#----------------------------------------------INSERTION PART END-------------------------------------

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

#--------------------Full Booking View--------------
CREATE VIEW full_booking_view AS
SELECT b.booking_id, m.movie_name, s.show_date, s.show_time,
se.seat_number, b.total_amount, p.payment_status
FROM booking b
JOIN showtime s ON b.show_id = s.show_id
JOIN movie m ON s.movie_id = m.movie_id
JOIN seat se ON b.seat_id = se.seat_id
LEFT JOIN payment p ON b.booking_id = p.booking_id;

#-------------------------Full Booking Output-------------
select * from full_booking_view;

#-----------------------Available Seats ------------
CREATE VIEW available_seats AS
SELECT * FROM seat WHERE status = 'Available';

#---------------------Available Seats Output----------
Select * from available_seats;

#---------------------Revenue Report----------------
CREATE VIEW revenue_per_movie AS
SELECT m.movie_name, SUM(b.total_amount) AS total_revenue
FROM booking b
JOIN showtime s ON b.show_id = s.show_id
JOIN movie m ON s.movie_id = m.movie_id
GROUP BY m.movie_name;

#------------------------Revenue Report Output-------------
select * from revenue_per_movie;



#'''---------------------Movie Management System---------------------------------'''