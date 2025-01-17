who is the seniour most employee based on job title?

select * from employee
order by levels desc
limit 1

q2:- which country have the most invoices?

select count(*) as c, billing_country
from invoice
group by billing_country
order by c desc

q3:- what are top 3 values of total invoice?

select total from invoice
order by total desc
limit 3

q4:- music festival in which city getter sell?

select sum(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc

q5:- best customer who spend more money?

select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1

q 6:-

select distinct email, first_name, last_name
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in(
      select track_id from track
      join genre on track.genre_id = genre.genre_id
      where genre.name like 'Rock'

)
order by email;


q7: artist name who more sing a song

select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10;


q 8: longest song more than average
select name, milliseconds
from track
where milliseconds > (
    select avg(milliseconds) as avg_track_length
	from track
	
)
order by milliseconds desc;



