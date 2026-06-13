create database Football_Ticket_Booking_System;

CREATE TABLE users (
  user_id serial primary key,
  full_name varchar(50) not null,
  email varchar(50) unique not null,
  role varchar(50) not null check (role in ('Ticket Manager', 'Football Fan')),
  phone_number varchar(20)
);

CREATE TABLE matches (
  match_id serial primary key,
  fixture varchar(50) not null,
  tournament_category varchar(50) not null,
  base_ticket_price int not null check (base_ticket_price >= 0),
  match_status varchar(50) not null check (
    match_status in (
      'Available',
      'Selling Fast',
      'Sold Out',
      'Postponed'
    )
  )
);

CREATE TABLE bookings (
  booking_id serial primary key,
  user_id int references users (user_id),
  match_id int references matches (match_id),
  seat_number varchar(10) not null,
  payment_status varchar(50) not null check (
    payment_status in ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
  ),
  total_cost int not null check (total_cost >= 0)
)