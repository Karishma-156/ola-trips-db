-- ===================================
-- ANALYSIS QUERIES FOR OLA TRIPS DATA
-- ===================================

-- 🚗 Total Unique Trips
SELECT COUNT(DISTINCT tripid) AS total_trips FROM trips_details;

-- 👨‍✈️ Total Unique Drivers
SELECT COUNT(DISTINCT driverid) AS total_drivers FROM trips;

-- 💰 Total Earnings
SELECT SUM(fare) AS total_earnings FROM trips;

-- ✅ Total Completed Trips
SELECT SUM(end_ride) AS completed_trips FROM trips_details;

-- 🔍 Total Searches and Funnel Breakdown
SELECT 
    SUM(searches) AS total_searches,
    SUM(searches_got_estimate) AS estimates_provided,
    SUM(searches_for_quotes) AS quote_requested,
    SUM(searches_got_quotes) AS quotes_given,
    SUM(customer_not_cancelled) AS customers_not_cancelled,
    SUM(driver_not_cancelled) AS drivers_not_cancelled,
    SUM(otp_entered) AS otps_entered,
    SUM(end_ride) AS rides_completed
FROM trips_details;

-- 📉 Cancelled Bookings
SELECT 
    SUM(1 - driver_not_cancelled) AS driver_cancellations,
    SUM(1 - customer_not_cancelled) AS customer_cancellations
FROM trips_details;

-- 🔐 OTP and Ride Completion
SELECT 
    SUM(otp_entered) AS total_otp_entered,
    SUM(end_ride) AS total_rides_completed
FROM trips_details;

-- 📏 Average Metrics
SELECT 
    AVG(distance) AS average_distance_per_trip,
    SUM(fare) / COUNT(*) AS average_fare_per_trip,
    SUM(distance) AS total_distance_travelled
FROM trips;

-- 💳 Most Used Payment Method
SELECT faremethod, COUNT(*) AS usage_count
FROM trips
GROUP BY faremethod
ORDER BY usage_count DESC
LIMIT 1;

-- 💵 Highest Payment by Method
SELECT faremethod, MAX(fare) AS highest_payment
FROM trips
GROUP BY faremethod
ORDER BY highest_payment DESC
LIMIT 1;

-- 📍 Top Trip Route
SELECT loc_from, loc_to, COUNT(*) AS trip_count
FROM trips
GROUP BY loc_from, loc_to
ORDER BY trip_count DESC
LIMIT 2;

-- 🏆 Top 5 Earning Drivers
SELECT driverid, SUM(fare) AS total_earnings
FROM trips
GROUP BY driverid
ORDER BY total_earnings DESC
LIMIT 5;

-- ⏱️ Duration with Most Trips
SELECT duration, COUNT(*) AS trip_count
FROM trips
GROUP BY duration
ORDER BY trip_count DESC
LIMIT 1;

-- 👥 Most Active Driver-Customer Pair
SELECT driverid, custid, COUNT(*) AS orders
FROM trips
GROUP BY driverid, custid
ORDER BY orders DESC
LIMIT 1;

-- 📊 Funnel Conversion Rates
SELECT 
    SUM(searches_got_estimate) / SUM(searches) AS search_to_estimate_rate,
    SUM(searches_got_quotes) / SUM(searches_got_estimate) AS estimate_to_quote_rate,
    SUM(customer_not_cancelled) / SUM(searches_got_quotes) AS quote_acceptance_rate,
    SUM(otp_entered) / SUM(searches_got_quotes) AS quote_to_booking_rate,
    (SUM(otp_entered) - SUM(end_ride)) / SUM(otp_entered) AS booking_cancellation_rate,
    SUM(end_ride) / SUM(searches) AS overall_conversion_rate
FROM trips_details;

-- 📊 Area and Time-Based Trends

-- Most Active Area per Duration
SELECT duration, loc_to, COUNT(*) AS trip_count
FROM trips
GROUP BY duration, loc_to
ORDER BY duration, trip_count DESC;

-- Area with Highest Fare and Trip Volume
SELECT loc_to, COUNT(*) AS total_trips, SUM(fare) AS total_fare
FROM trips
GROUP BY loc_to
ORDER BY total_trips DESC;

-- Duration with Highest Earnings
SELECT duration, COUNT(*) AS total_trips, SUM(fare) AS total_fare
FROM trips
GROUP BY duration
ORDER BY total_trips DESC, total_fare DESC;
