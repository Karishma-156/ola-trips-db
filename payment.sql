drop table if exists payment;
CREATE TABLE payment( id INT, method varchar(200)); 

 INSERT INTO payment(id ,method)
 VALUES
 ('1','cash'),
('2','upi'),
('3','debit card'),
('4','credit card');

select * from trips;

select * from trips_details;

select * from loc;

select * from duration;

select * from payment;
