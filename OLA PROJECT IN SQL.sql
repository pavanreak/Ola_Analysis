-------   OLA BOOKINGS DATASET ------------

select * from Bookings

---QUESTIONS:
-- 1. Retrieve all successful bookings:
CREATE VIEW SUCCESFULL_BOOKINGS AS
SELECT * FROM BOOKINGS WHERE BOOKING_STATUS = 'SUCCESS'

SELECT * FROM SUCCESFULL_BOOKINGS
/* THERE ARE TOTAL 63,967 BOOKINGS GOT SUCCESSFULLY */

-- 2. Find the average ride distance for each vehicle type:
SELECT AVG(Ride_Distance) AS AVERAGE_DIST,Vehicle_Type FROM BOOKINGS
GROUP BY Vehicle_Type
/* THERE ARE TOTAL 7 VEHICLE TYPES AND THE AVERAGE RIDE DISTANCE IS 15 */


-- 3. Get the total number of cancelled rides by customers:
SELECT COUNT(*) FROM BOOKINGS WHERE Booking_Status = 'CANCELED BY DRIVER'
/* THERE ARE TOTAL 18,434 BOOKINGS CANCELLED BY CUSTOMERS */

-- 4. List the top 5 customers who booked the highest number of rides:
SELECT TOP 5 Customer_ID,COUNT(*) AS TOTAL_RIDES
FROM BOOKINGS
GROUP BY Customer_ID
ORDER BY TOTAL_RIDES DESC;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) FROM BOOKINGS
WHERE Booking_Status = 'CANCELED BY DRIVER'
AND Canceled_Rides_by_Driver = 'Personal & Car related issue'

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MIN(Driver_Ratings) AS MIN_RATING_PRIME_SEDAN FROM BOOKINGS WHERE Vehicle_Type = 'PRIME SEDAN'
SELECT MAX(Driver_Ratings) AS MAX_RATING_PRIME_SEDAN FROM BOOKINGS WHERE Vehicle_Type = 'PRIME SEDAN'

-- 7. Retrieve all rides where payment was made using UPI:
SELECT COUNT(*) FROM BOOKINGS WHERE Payment_Method = 'UPI'
--THERE ARE TOTAL PAYMENTS MADE BY UPI IS 25881

-- 8. Find the average customer rating per vehicle type:
SELECT AVG(Customer_Rating) AS AVG_CUST_RATING, Vehicle_Type
INTO AVG_CUST_RATING_PER_VEHICLE_TYPE
FROM BOOKINGS
GROUP BY Vehicle_Type
ORDER BY AVG_CUST_RATING

SELECT * FROM AVG_CUST_RATING_PER_VEHICLE_TYPE
---STORING THE DATA IN A SINGLE CODE BY CREATING A NEW TABLE LIKE ABOVE

--- 9. Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value) AS TOTAL_BOOKING_VALUE FROM BOOKINGS WHERE Booking_Status = 'SUCCESS'
--THE TOTAL BOOKING VALUE OF RIDES COMPLETED SUCCESSFULLY IS 35080467

-- 10. List all incomplete rides along with the reason: 
SELECT DISTINCT(Incomplete_Rides_Reason),
COUNT(INCOMPLETE_RIDES)AS INCOMP_RIDES FROM BOOKINGS
GROUP BY Incomplete_Rides_Reason
ORDER BY INCOMP_RIDES


