
insert into roles (
   type
) values (
	'admin'
),
(
	'student'
),
(
	'teacher'
);

insert into categories (
   type
) values (
	'HTML'
),
(
	'CSS'
),
(
	'JS'
),
(
	'React'
),
(
	'node'
);

----insert users----
insert into users (
	id,
	name,
	email,
	password,
	age,
	id_roles
) values (
	'876e6a35-1656-4683-87d6-40b98a3b42a9',
	'anmmmy',
	'anh7@gmail.com',
	'123',
	 15,
	 2
),(
	'dbf05e91-72fb-4819-b450-c76a0eb1f0ec',
	'benja',
	'adff7@gmail.com',
	'1243',
	 18,
	 3
),(
	'b32b5705-5e4b-431d-aa3c-124c8c18c71a',
	'jesus',
	'af7@gmail.com',
	'124d3',
	 19,
	 2
),(
(
	'03c1ee6b-3095-4296-96b7-71c61236e612',
	'sahid',
	'sahid@gmail.com',
	'124d3',
	 22,
	 3
),
(
	'3689434c-4119-4668-9cb5-e61e004946a3',
	'jesusf',
	'jesusd@gmail.com',
	'124rr3',
	 32,
	 3
),
(
	'54ca1b94-bfb2-4508-b03a-4bfaf653c012',
	'abraham',
	'abraham@gmail.com',
	'124443',
	 31,
	 1
);

---- insert courses----
insert into courses (
	title,
	description,
	level,
	id_categories,
	id_user
)values(
	'fundamentos',
	'js basico',
	1,
	2,
	'b32b5705-5e4b-431d-aa3c-124c8c18c71a'
),(
   'react js',
   'react basico',
	2,
	2,
	'dbf05e91-72fb-4819-b450-c76a0eb1f0ec'
),(
	'node js',
	'node bd',
	2,
	2,
	'03c1ee6b-3095-4296-96b7-71c61236e612'
)

--- insert course_video-----
insert into courses_video  (
	title,
	url,
	upload_date,
	id_user,
	id_course 
)values(
     'fundamentos',
	 'www.academlo.com',
     '2022/09/25',
     'b32b5705-5e4b-431d-aa3c-124c8c18c71a',
	 '1'

),(
	 'initial react',
	 'www.udemy.com',
     '2022/08/25',
     'dbf05e91-72fb-4819-b450-c76a0eb1f0ec',
	 '2'
),(
	 'node',
	 'www.acammnode.com',
     '2022/07/25',
     '03c1ee6b-3095-4296-96b7-71c61236e612',
	 '3'
);

----insert users_courses-----
insert into users_courses (
	id_user,
	id_course,
	percent_complete,
	complete
)values(
	'876e6a35-1656-4683-87d6-40b98a3b42a9',
	 2,
	 60,
	 false
),(
	'b32b5705-5e4b-431d-aa3c-124c8c18c71a',
	 3,
	 20,
	 false
);

---- select---
select courses.title, courses.id_user as teacher, courses_video.url, categories.type as categories, users_courses.percent_complete, users_courses.complete 
from courses 
	inner join courses_video
on courses_video.id_course = courses.id
	inner join categories 
on categories.id = courses.id_categories 
	inner join users_courses 
on courses.id = users_courses.id_course;
	