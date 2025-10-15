1) write a query to return the email , first name , last name & Genre of all Rock music listeners
   Return your list ordered alphabetically by email starting with A ?

select distinct email , first_name , last_name
from customer
join invoice on customer.customer_id = invoice.invoice_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id IN (
	select track_id from track
	JOIN genre on track.genre_id = genre.genre_id
	where genre.name like 'Rock'
)
order by email;

2) Lets invite the artists who have written the most rock music in our data set. write a query that returns
   the artist name and total track count of the Top 10 rock bands ?

select artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY  artist.artist_id
ORDER BY number_of_songs DESC
Limit 10;


3) Return all the track names that have a song length longer than the average song length. Return the name
   and milli seconds for each track. order by the song length with the longest song listed first ?


select name , milliseconds
from track
where milliseconds > (
	select avg(milliseconds) as avg_track_length
	FROM track)
Order by milliseconds DESC;

# to find  average
select avg(milliseconds) as avg_track_length
	FROM track

# method 2

select name , milliseconds
from track
where milliseconds > 393599
ORDER BY milliseconds DESC;

