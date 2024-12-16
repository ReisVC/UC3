-- You vaguely remember that the crime was a ​murder​ that occurred sometime on ​Jan.15, 2018​ and that it took place in ​SQL City​.

--Security footage shows that there were 2 witnesses. 
--The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

SELECT * FROM crime_scene_report WHERE type = 'murder' AND city = 'SQL City'

SELECT * FROM person WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
-- 14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949

SELECT * FROM person WHERE address_street_name = 'Franklin Ave'
-- 16371	Annabel Miller	490173	103	Franklin Ave	318771143
