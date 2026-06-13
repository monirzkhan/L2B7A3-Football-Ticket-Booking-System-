-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.
select
  match_id,
  fixture,
  base_ticket_price
from
  matches
where
  tournament_category = 'Champions League'
  and match_status = 'Available'


  -- Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).
select
  user_id,
  full_name,
  email
from
  users
where
  full_name like 'Tanvir%'
  or full_name ilike '%Haque'

  -- Query 3: Retrieve all booking records where the payment status is missing (NULL), replacing the empty result with 'Action Required'.
select
  booking_id,
  user_id,
  match_id,
  coalesce(payment_status, 'Action Required') as systematic_status
from
  bookings


  -- Query 4: Retrieve match booking details along with the User's full name and the scheduled Match fixture teams.
  -- formula: 01
select
  booking_id,
  full_name,
  fixture,
  total_cost
from
  bookings as b
  join users as u on u.user_id = b.user_id
  join matches as m on m.match_id = b.match_id
  -- formula:02
select
  booking_id,
  full_name,
  fixture,
  total_cost
from
  bookings as b
  join users using (user_id)
  join matches using (match_id)


  -- Query 5: Display a comprehensive list of all users and their booking IDs, ensuring that fans who have never bought a ticket are still listed.
select
  user_id,
  full_name,
  booking_id
from
  users
  left join bookings using (user_id)

  
  -- Query 6: Find all ticket bookings where the total cost is strictly higher than the average cost of all ticket bookings.
select
  booking_id,
  match_id,
  total_cost
from
  bookings
where
  total_cost > (
    select
      avg(total_cost)
    from
      bookings
  )
  -- Query 7: Retrieve the top 2 most expensive matches sorted by base ticket price, skipping the absolute highest premium match.
select
  match_id,
  fixture,
  base_ticket_price
from
  matches
order by
  base_ticket_price desc
limit
  2
offset
  1