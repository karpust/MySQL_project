use geekbrains_db;

select firstname, lastname from users where id in (select user_id from teachers);

select * from teachers where user_id in (select user_id from students )

select '15:00:00' <= TIME('2009-05-18 15:45:57.005678') <= '20:00:00';
select TIME('2009-05-18 15:45:57.005678') >= '20:00:00';
select '16'>=hour('2009-05-18 15:45:57.005678')>='14';
select hour('2009-05-18 15:45:57.005678')>='14' and '16'>=hour('2009-05-18 15:45:57.005678');
select hour(TIME('2009-05-18 15:45:57.005678'));
select dayname(TIME('2009-05-18 15:45:57.005678'));

select hour(timediff('2009-05-18 15:45:57.005678', '2009-05-16 18:45:57.005678'));
select  timestampdiff(DAY, '2009-05-18 15:45:57.005678', '2009-05-16 15:45:57.005678') ;
select hour(timediff('2009-05-16 18:45:57.005678', '2009-05-18 15:45:57.005678'));
select timestampdiff(hour, '2009-05-16 18:45:57.005678', '2009-05-18 15:45:57.005678');

select DATEDIFF('2009-05-18 14:45:57.005678', '2009-05-16 15:45:57.005678') = 2;
select  minute(TIMEDIFF('2009-05-18 14:45:57.005678', '2009-05-16 14:45:57.005678'))= 2;
select TIMEDIFF('2009-05-18 14:45:57.005678', '2009-05-16 15:45:57.005678');
select DATEDIFF('2009-05-18 14:45:57.005678', '2009-05-16 15:45:57.005678');
select minute(TIMEDIFF('2009-05-18 14:45:57.005678', '2009-05-16 15:45:57.005678'));
select hour(TIMEDIFF('2009-05-18 14:45:57.005678', '2009-05-16 15:45:57.005678'));
select mod(TIME('2009-05-18 15:00:00'), 1) = 0;
select current_timestamp;
select max(lesson_number) from schedule where course_id = 1;
select timestampdiff(day, '2009-05-16 15:40:00', '2009-05-18 15:30:00') < 2;


select group_concat(user_id) from students group by group_id;

select group_concat(distinct u.id, u.lastname order by u.id separator ', ') as user_info
from users u;

-- студент - группа - курс - препод таблица преподов студента с id=3:
SELECT u.id, u.firstname, u.lastname, eg.name as group_name, c.group_id, teacher_id, c.id as course_id
from users u
         inner join students s on u.id = s.user_id
         inner join edu_groups eg on eg.id = s.group_id
         inner join courses c on c.group_id = eg.id
         inner join teachers t on t.user_id = c.teacher_id
where s.user_id = 1;

-- таблица всех преподов студента с id=3(препод - курс - наимен курсов - группа - студент):
SELECT u.id, concat(u.firstname, ' ', u.lastname) as teacher_name,
       eg.name as group_name, c.group_id, s.user_id as student_id,
       cn.title as course_name
from users u
         inner join teachers t on u.id = t.user_id
         inner join courses c on t.user_id = c.teacher_id
         inner join course_names cn on c.course_name_id = cn.id
         inner join edu_groups eg on c.group_id = eg.id
         inner join students s on eg.id = s.group_id
where s.user_id = 3;

/* показывает все практические задания которые не сделал студент */

select group_concat(distinct u.id, u.lastname order by u.id separator ', ') as user_info
from users u;

select group_concat(distinct concat(u.id, ' ', u.lastname) order by u.id separator ', ') as user_info
from users u;

select COUNT(s.user_id) AS number
FROM students s
         INNER JOIN edu_groups eg on s.group_id = eg.id
WHERE s.group_id = 2;

# курс по группе по программе по специализации:
SELECT GROUP_CONCAT(DISTINCT tab2.DDDD) AS TB1 FROM
(SELECT DISTINCT cn.id AS DDDD FROM course_names cn
# (SELECT GROUP_CONCAT(DISTINCT cn.id) AS DDDD FROM course_names cn
     JOIN programms_course_names pcn on cn.id = pcn.course_name_id
     JOIN programms p ON pcn.programm_id = p.id
     JOIN edu_groups eg on p.id = eg.programm_id
     JOIN students s on eg.id = s.group_id
              WHERE s.user_id = 1
UNION
(SELECT DISTINCT cn.id FROM course_names cn
# (SELECT GROUP_CONCAT(DISTINCT cn.id) FROM course_names cn
     JOIN specializations_course_names scn on cn.id = scn.course_name_id
     JOIN specializations spec ON scn.spec_id = spec.id
     JOIN edu_groups eg on spec.id = eg.programm_id
     JOIN students s on eg.id = s.group_id
              WHERE s.user_id = 1)) AS tab2;


select programm_id, special_id from edu_groups
    where exists (select 1 from specializations_programms where programm_id = edu_groups.programm_id
        and special_id = edu_groups.special_id);