-- Returns guests who havn't booked a room

SELECT first_name, last_name, address, email, phone_number, b.guest_id as rooms_booked
FROM guests g
LEFT JOIN bookings b
ON b.guest_id = g.id
WHERE b.guest_id IS null;

-- Returns guests who have booked two rooms on the same date

SELECT first_name, last_name, guest_id, check_in, cnt as number_of_rooms_checked
FROM (SELECT guest_bookings.first_name, guest_bookings.last_name, guest_bookings.guest_id, guest_bookings.check_in, COUNT(1) as CNT
FROM (SELECT *
FROM guests
FULL JOIN bookings 
ON bookings.guest_id = guests.id) AS guest_bookings
GROUP BY guest_bookings.first_name, guest_bookings.last_name, guest_bookings.guest_id, guest_bookings.check_in) as same_date
WHERE same_date.cnt>1;

-- Returns guests who have booked one room several times on different dates

SELECT room_number, bcgr.first_name, bcgr.last_name, bcgr.booking_id, bcgr.check_in, bcgr.guest_id, bcgr.room_id
FROM rooms r
JOIN(SELECT first_name, last_name, bcg.booking_id, bcg.check_in, bcg.guest_id, bcg.room_id
FROM guests g
JOIN(SELECT booking_id, check_in, bg.guest_id, bg.room_id
FROM bookings b
JOIN (SELECT first_name, last_name, gb.room_id, gb.guest_id 
FROM guests g
JOIN(SELECT DISTINCT check_in, room_id, guest_id
FROM bookings b 
WHERE room_id IN (SELECT room_id FROM bookings GROUP BY room_id HAVING COUNT(*)>1)) as gb ON gb.guest_id = g.id
GROUP BY first_name, last_name, gb.room_id, gb.guest_id HAVING COUNT(gb.guest_id)>1) as bg ON bg.guest_id = b.guest_id) as bcg 
ON bcg.guest_id = g.id) as bcgr
ON bcgr.room_id = r.id;

-- Returns room with the most bookings by unique guests

SELECT *
FROM (SELECT room_number, count(room_number) as number_of_unique_times_booked
FROM(SELECT gbr.first_name, gbr.booking_id, gbr.room_id, gbr.room_number
FROM(SELECT DISTINCT ON(first_name) first_name, last_name, b.booking_id, b.room_id, r.room_number, r.id
FROM guests g
RIGHT JOIN bookings b
ON b.guest_id = g.id  
JOIN rooms r
ON b.room_id = r.id
ORDER BY first_name, first_name, last_name, b.booking_id, b.room_id, r.room_number, r.id) as gbr
GROUP BY gbr.first_name, gbr.booking_id, gbr.last_name, gbr.room_id, gbr.room_number) as count 
GROUP BY room_number) as final
WHERE final.number_of_unique_times_booked > 1;
