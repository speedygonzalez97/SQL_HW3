

--Question #1: The  customers who live in Texas are: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, and Ian Still.



select first_name, last_name
from customer
left join address
on customer.address_id = address.address_id 
where district = 'Texas';



--Question #2: All the customers, whom have paid above $6.99, are: Mary Smith, Peter Menard, Harold Martino, 
--Douglas Graf, Alvin Deloach, and Alfredo Mcadams.



select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
	order by amount asc
);



--Question #3: All the customers, whom have made payments above $178, are: Mary Smith and Douglas Graf



select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 175
	order by amount asc
);



--Question #4: The only customer who lives in Nepal is Kevin Schuler



select first_name, last_name
from customer
full Join address
on customer.address_id = address.address_id 
full Join city
on address.city_id = city.city_id 
full Join country
on city.country_id = country.country_id
where country = 'Nepal';



--Question #5: Mike Hillyer has the most transactions with 8,040 total.



select count(staff.staff_id), first_name, last_name
from staff
full join rental
on staff.staff_id = rental.staff_id 
group by staff.staff_id 



--Question #6: There are 224 movies that are rated PG-13, 209 movies that are rated NC-17, 196 movies that are rated R,
--there are 194 movies that are rated PG, and 178 movies that are rated G.



select count(rating), rating
from film
group by rating
order by count(rating) desc;



--Question #7: All the customers who have made only a single payment above $6.99 are: Harold Martino, Douglas Graf,
--Alvin Deloach, and Alfredo Mcadams.



select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
	group by customer_id
	having count(customer_id) = 1
);



--Question %8: There were no free rentals given away.



select count(rental_id)
from rental
where rental_id in (
	select count(rental_id)
	from payment
	where amount = 0
);




