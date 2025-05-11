# Ola Trips MySQL Analytics 🚖

This project contains a comprehensive MySQL-based analysis of a ride-hailing dataset (like Ola or Uber). It includes trip-level data, booking funnel metrics, and detailed SQL queries to extract business insights.

---

## 📁 Project Structure

```
ola-trips-db/
│
├── trips.sql # Trip table schema and data
├── trips_details1.sql # Trip details - part 1
├── trips_details2.sql # Trip details - part 2
├── trips_details3.sql # Trip details - part 3
├── trips_details4.sql # Trip details - part 4
├── analysis_queries.sql # All KPI and business queries
├── duration.sql # Optional filter/dimension table (duration-wise queries)
├── loc.sql # Location-based analysis
├── payment.sql # Payment method insights
├── README.md # Project overview and instructions
```

---

## 🧾 Data Overview

- **trips**: Core trip-level table
  - Fields: `tripid`, `faremethod`, `fare`, `loc_from`, `loc_to`, `driverid`, `custid`, `distance`, `duration`

- **trips_details**: Booking funnel stages
  - Fields: `tripid`, `searches`, `searches_got_estimate`, `searches_for_quotes`, `searches_got_quotes`, `customer_not_cancelled`, `driver_not_cancelled`, `otp_entered`, `end_ride`

---

## 📊 Key Business Metrics Calculated

- Total trips, earnings, and drivers
- Cancellation breakdown (customer vs driver)
- Average fare, distance, and total distance travelled
- Funnel conversion rates:
  - Search → Estimate → Quote → Booking → Ride
- Top 5 drivers by earnings
- Most popular routes and payment methods
- Time and location-based insights

---

## 🛠️ How to Use

1. Create a MySQL database:
    ```sql
    CREATE DATABASE ola_trips;
    USE ola_trips;
    ```

2. Load data:
    - Run `trips.sql` to create and populate the main trips table.
    - Run `trips_details1.sql` through `trips_details4.sql` to populate booking funnel data.
    - Optionally run `duration.sql`, `loc.sql`, `payment.sql` for additional views.

    ✅ You can also create a `load_all.sql` file to load everything at once (see below).

3. Run `analysis_queries.sql` to extract insights.

---

## OUTPUT:

### trips.sql:

![MySQL Output](https://github.com/Karishma-156/ola-trips-db/blob/main/tripspic.png)

### trips_details4.sql:

![MySQL Output](https://github.com/Karishma-156/ola-trips-db/blob/main/trips_details4pic.png)

### payment -> trips:

![MySQL Output](https://github.com/Karishma-156/ola-trips-db/blob/main/payment1pic.png)

### payment -> loc:

![MySQL Output](https://github.com/Karishma-156/ola-trips-db/blob/main/payment2pic.png)

### payment -> duration, payment:

![MySQL Output](https://github.com/Karishma-156/ola-trips-db/blob/main/payment3pic.png)

### DATA ANALYSIS:

![MySQL Output](https://github.com/Karishma-156/ola-trips-db/blob/main/1stpicanalysis.png)

![MySQL Output](https://github.com/Karishma-156/ola-trips-db/blob/main/2ndpicanalysis.png)

![MySQL Output](https://github.com/Karishma-156/ola-trips-db/blob/main/thirdanalysis.png)

![MySQL Output](https://github.com/Karishma-156/ola-trips-db/blob/main/2ndLastpicanalysis.png)

![MySQL Output](https://github.com/Karishma-156/ola-trips-db/blob/main/lastanalysis.png)



