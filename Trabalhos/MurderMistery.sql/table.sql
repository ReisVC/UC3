-- You vaguely remember that the crime was a ​murder​ that occurred sometime on ​Jan.15, 2018​ and that it took place in ​SQL City​.

--Security footage shows that there were 2 witnesses. 
--The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

SELECT * FROM crime_scene_report WHERE type = 'murder' AND city = 'SQL City'

SELECT * FROM person WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
-- 14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949

SELECT * FROM person WHERE address_street_name = 'Franklin Ave'
-- 16371	Annabel Miller	490173	103	Franklin Ave	318771143

SELECT person_id, name, transcript FROM interview
JOIN person
ON person.id = interview.person_id
WHERE person_id = 14887

-- Morty Schapiro - I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag.
-- The membership number on the bag started with "48Z". Only gold members have those bags. 
-- The man got into a car with a plate that included "H42W".

SELECT person_id, name, transcript FROM interview
JOIN person
ON person.id = interview.person_id
WHERE person_id = 16371

-- Annabel Miller - 
-- I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

SELECT * FROM get_fit_now_check_in JOIN get_fit_now_member AS GFNM 
ON GFNM.id = get_fit_now_check_in.membership_id
WHERE membership_id LIKE '48Z%' AND membership_status = 'gold'

-- membership_id | check_in_date | check_in_time | check_out_time | id    | person_id  | name       | membership_start_date | status
-- 48Z7A 	     20180109	       1600	           1730	           48Z7A	28819	    Joe Germuska	20160305	          gold
-- 48Z55 	     20180109	       1530            1700	           48Z55	67318	    Jeremy Bowers	20160101	          gold

SELECT * FROM person WHERE id = 28819

-- 28819	Joe Germuska	license_id 173289	111	Fisk Rd	 SSN 138909730

-- 67318	Jeremy Bowers	license_id 423327	530	Washington Pl, Apt 3A	871539279
SELECT * FROM drivers_license WHERE id = 423327
-- id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
-- 423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS

-- Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, 
-- try querying the interview transcript of the murderer to find the real villain behind this crime. 
-- If you feel especially confident in your SQL skills, 
-- try to complete this final step with no more than 2 queries.
-- Use this same INSERT statement with your new suspect to check your answer.

SELECT * FROM interview WHERE person_id = 67318

-- I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
-- She has red hair and she drives a Tesla Model S. 
-- I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT name, height, hair_color, car_make, car_model, event_name, date
FROM person
INNER JOIN drivers_license
ON drivers_license.id = person.license_id
JOIN facebook_event_checkin AS face
ON person.id = face.person_id
WHERE height < 68 AND height > 64
AND car_make = 'Tesla' AND car_model = 'Model S'
AND hair_color = 'red'  

-- Miranda Priestly	66	red	Tesla	Model S	SQL Symphony Concert	20171206
-- Miranda Priestly	66	red	Tesla	Model S	SQL Symphony Concert	20171212
-- Miranda Priestly	66	red	Tesla	Model S	SQL Symphony Concert	20171229

--Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. 
--Time to break out the champagne!