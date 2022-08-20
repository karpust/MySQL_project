select '15:00:00' <= TIME('2009-05-18 15:45:57.005678') <= '20:00:00';
select TIME('2009-05-18 15:45:57.005678') >= '20:00:00';
select '16'>=hour('2009-05-18 15:45:57.005678')>='14';
select hour('2009-05-18 15:45:57.005678')>='14' and '16'>=hour('2009-05-18 15:45:57.005678');
select hour(TIME('2009-05-18 15:45:57.005678'));
select dayname(TIME('2009-05-18 15:45:57.005678'));

select hour(timediff('2009-05-18 15:45:57.005678', '2009-05-16 15:45:57.005678')) = 48;
select DATEDIFF('2009-05-18 14:45:57.005678', '2009-05-16 15:45:57.005678') = 2;
select minute(TIMEDIFF('2009-05-18 14:45:57.005678', '2009-05-16 15:45:57.005678'))= 2;
select TIMEDIFF('2009-05-18 14:45:57.005678', '2009-05-16 15:45:57.005678');
select DATEDIFF('2009-05-18 14:45:57.005678', '2009-05-16 15:45:57.005678');
select minute(TIMEDIFF('2009-05-18 14:45:57.005678', '2009-05-16 15:45:57.005678'));
select hour(TIMEDIFF('2009-05-18 14:45:57.005678', '2009-05-16 15:45:57.005678'));
select mod(TIME('2009-05-18 15:00:00'), 1) = 0;
select current_timestamp;
select max(lesson_number) from schedule where course_id = 1;
select timestampdiff(day, '2009-05-16 15:40:00', '2009-05-18 15:30:00') < 2;

-- --------------------------------------------------------------------------------------------------------
-- хп вставки в edu_groups и проверки согласованности данных с specializations_programms:
DELIMITER //
DROP PROCEDURE IF EXISTS edu_groups_fill_sp//
CREATE PROCEDURE edu_groups_fill_sp(p_name varchar(255), p_special_id  int, p_programm_id int)
    BEGIN
        DECLARE `msg` VARCHAR(100);
        IF exists (select 1 from specializations_programms where programm_id = p_programm_id
        and special_id = p_special_id)
            THEN INSERT INTO edu_groups(name, special_id, programm_id)
                 values(p_name, p_special_id, p_programm_id);
            SET `msg` := 'Согласованность данных не нарушена';
        ELSE
            SET `msg` := 'Ошибка добавления данных. Нарушение согласованности';
        END IF;
        SELECT `msg`;
    END//
DELIMITER ;


-- хп вставки в students, users + обработка ошибки в транзакции:
DELIMITER //
DROP PROCEDURE IF EXISTS `students_fill_sp`//
CREATE PROCEDURE `students_fill_sp`(p_firstname VARCHAR(50), p_lastname VARCHAR(50), p_phone BIGINT,
p_email VARCHAR(50), p_gender ENUM('male', 'female', 'other'), p_country VARCHAR(50), p_city VARCHAR(50),
p_birth_date DATE, p_interests VARCHAR(1000), p_password_hash VARCHAR(200), p_photo VARCHAR(1024),
p_group_id BIGINT, p_aboutme VARCHAR(200), OUT trans_result VARCHAR(200))
BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE code varchar(100);
    DECLARE error_string varchar(100);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SET `_rollback` = 1;
            GET STACKED DIAGNOSTICS CONDITION 1
            code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
            set trans_result := concat('Error occured. Code: ', code, '. Text: ', error_string);
        END;

    START TRANSACTION;
    INSERT INTO users (firstname, lastname, phone, email, gender, country, city, birth_date, interests,
                       password_hash, photo)
        VALUES (p_firstname, p_lastname, p_phone, p_email, p_gender, p_country, p_city, p_birth_date,
                p_interests, p_password_hash, p_photo);
    INSERT INTO students (user_id, group_id, aboutme)
        VALUES (last_insert_id(), p_group_id, p_aboutme);

    IF `_rollback` THEN
	       ROLLBACK;
	    ELSE
		SET trans_result := 'ok';
	       COMMIT;
	    END IF;
    SELECT @trans_result;
end //
DELIMITER ;


-- хп вставки в teachers, users + обработка ошибки в транзакции:
DELIMITER //
DROP PROCEDURE IF EXISTS `teachers_fill_sp`//
CREATE PROCEDURE `teachers_fill_sp`(p_firstname VARCHAR(50), p_lastname VARCHAR(50), p_phone BIGINT,
p_email VARCHAR(50), p_gender ENUM('male', 'female', 'other'), p_country VARCHAR(50), p_city VARCHAR(50),
p_birth_date DATE, p_interests VARCHAR(1000), p_password_hash VARCHAR(200), p_photo VARCHAR(1024),
p_professional_way VARCHAR(200), p_education VARCHAR(200), p_work_explorer VARCHAR(200),
p_use_technologies VARCHAR(200), p_position VARCHAR(200), p_words_for_students VARCHAR(200),
p_teaching_subject VARCHAR(200), OUT trans_result VARCHAR(200))
BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE code varchar(100);
    DECLARE error_string varchar(100);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SET `_rollback` = 1;
            GET STACKED DIAGNOSTICS CONDITION 1
            code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
            set trans_result := concat('Error occured. Code: ', code, '. Text: ', error_string);
        END;

    START TRANSACTION;
    INSERT INTO users (firstname, lastname, phone, email, gender, country, city, birth_date, interests,
                       password_hash, photo)
        VALUES (p_firstname, p_lastname, p_phone, p_email, p_gender, p_country, p_city, p_birth_date,
                p_interests, p_password_hash, p_photo);
    INSERT INTO teachers (user_id, professional_way, education, work_explorer, use_technologies, position,
                          words_for_students, teaching_subject)
        VALUES (last_insert_id(), p_professional_way, p_education, p_work_explorer, p_use_technologies,
                p_position, p_words_for_students, p_teaching_subject);

    IF `_rollback` THEN
	       ROLLBACK;
	    ELSE
		set trans_result := 'ok';
	       COMMIT;
	    END IF;
    SELECT @trans_result;
end //
DELIMITER ;


/* хп заполняет schedule в соотв с основными условиями:

   ведет ли препод такой курс +
   есть ли у группы такой курс
   есть ли в курсе урок с таким номером +
   время уроков с 10 до 20 +
   уроки по порядку для каждой группы(номер урока курса для группы)
   чтобы у одной группы или препода не было одновременно уроков(разница в 5 часов)
   */
DELIMITER //
DROP PROCEDURE IF EXISTS schedule_fill_sp//
CREATE PROCEDURE schedule_fill_sp(p_date DATETIME, p_teacher_id  bigint, p_group_id bigint,
p_lesson_number tinyint, p_course_id bigint)
    BEGIN
        DECLARE `msg` VARCHAR(100);

        IF
            -- каждый урок курса для группы уникален:
            not exists(select 1 from schedule where group_id = p_group_id and course_id = p_course_id
                                                and lesson_number = p_lesson_number)

                and
            -- у преподавателя в одно время идет только один урок и
            -- следующий может начаться не раньше чем через 5 часов:
            not exists(select 1 from schedule where hour(TIMEDIFF(p_date, date)) < 5 and
                                                    teacher_id = p_teacher_id)
                and

            -- у группы в одно время идет только один урок и
            -- следующий может начаться не раньше чем через 48 часов:
            not exists(select 1 from schedule where DATEDIFF(p_date, date) < 2 and
                                                    group_id = p_group_id)
                and

            -- преподаватель знает курс, который ведет:
            exists(select 1 from courses_teachers where course_id = p_course_id
                                                    and teacher_id = p_teacher_id)
                and

            -- у группы есть такой курс в программе или в специализации:
           (exists (select 1 from edu_groups eg
               join programms p on eg.programm_id = p.id
               join programms_courses pc on p.id = pc.programm_id
               join courses c on pc.course_id = c.id where eg.id = p_group_id and course_id = p_course_id) or
           exists(select 1 from  edu_groups eg2
               join specializations s on eg2.special_id = s.id
               join specializations_courses sc on s.id = sc.spec_id
               join courses c2 on sc.course_id = c2.id where eg2.id = p_group_id and c2.id = p_course_id))
                and

           -- у курса есть такой урок:
           exists(select 1 from lessons where number = p_lesson_number and course_id = p_course_id)
                and

           -- если в расписании были уроки курса у группы, то добавить можно следующий по номеру,
           -- или если это начало курса, то номер урока должен быть 1:
           (exists(select 1 from schedule where (select max(lesson_number)
                                                from schedule where course_id = p_course_id
                                                and group_id = p_group_id) = p_lesson_number - 1) or
           (not exists(select 1 from schedule where course_id = p_course_id and group_id = p_group_id) and
                                                   p_lesson_number = 1))
                and

           -- дата урока 1 не позже даты урока 2 и
           hour(p_date)<= 20 and hour(p_date) >= 10
           -- время начала уроков не ранее 10:00 и не позднее 20:00:
#            (exists(select 1 from schedule where group_id = p_group_id and course_id = p_course_id and
#             date < p_date) and
#             (not exists(select 1 from schedule where group_id = p_group_id and course_id = p_course_id)
#                ))

        THEN INSERT INTO schedule(date, teacher_id, group_id, lesson_number, course_id)
                 values(p_date, p_teacher_id, p_group_id, p_lesson_number, p_course_id);
            SET `msg` := 'Согласованность данных не нарушена';
        ELSE
            SET `msg` := CONCAT('Ошибка добавления данных. ',
                'Строка: ', p_date, ' ', p_teacher_id, ' ', p_group_id, ' ', p_lesson_number, ' ', p_course_id);
        END IF;
        SELECT `msg`;
    END//
DELIMITER ;


-- для составления расписания создам две вью:
-- вью все курсы препода:
CREATE OR REPLACE VIEW `courses_by_teacher` AS
    SELECT
        t.user_id AS teacher_id,
        concat((select group_concat(c.id) from courses c
            join courses_teachers ct on c.id = ct.course_id
            where ct.teacher_id = t.user_id)) as courses_id
    FROM teachers t;

SELECT * FROM courses_by_teacher;

-- вью все курсы группы:
CREATE OR REPLACE VIEW courses_by_group AS
    SELECT
        group_id,
        course_id
    FROM
    ((select eg.id as group_id, c.id as course_id from edu_groups eg
    join programms p on eg.programm_id = p.id
    join programms_courses pc on p.id = pc.programm_id
    join courses c on pc.course_id = c.id)
    UNION
    (select eg2.id as group_id2, c2.id as course_id2 from edu_groups eg2
    join specializations s on eg2.special_id = s.id
    join specializations_courses sc on s.id = sc.spec_id
    join courses c2 on sc.course_id = c2.id)) as tab ORDER BY group_id;

SELECT * FROM courses_by_group;

# CREATE OR REPLACE VIEW courses_by_group AS
#     SELECT
#         eg.id AS group_id,
#         (SELECT GROUP_CONCAT(c.id) FROM
#         (SELECT DISTINCT c.id
#     FROM courses c
#     JOIN programms_courses pc on c.id = pc.course_id
#     JOIN programms p ON pc.programm_id = p.id
#     JOIN edu_groups eg1 on p.id = eg.programm_id
#         where eg1.id = eg.id
#     UNION
#     (SELECT DISTINCT c2.id
#     FROM courses c2
#     JOIN specializations_courses sc on c2.id = sc.course_id
#     JOIN specializations spec ON sc.spec_id = spec.id
#     JOIN edu_groups eg2 on spec.id = eg.special_id
#             where eg2.id = eg.id))AS c) AS courses
#     FROM edu_groups eg;



-- хп заполняет students_practicals в соответствии сo schedule :
DELIMITER //
DROP PROCEDURE IF EXISTS students_practicals_fill_sp//
CREATE PROCEDURE students_practicals_fill_sp(p_student_id bigint, p_practical_id bigint,
p_date datetime, p_content varchar(1024))
    BEGIN
        DECLARE `msg` VARCHAR(100);
        IF
            -- у студента есть урок, которому соответствует пз:
            exists (select 1 from students s
            join edu_groups eg on s.group_id = eg.id
            join courses_by_group cbg on s.group_id = cbg.group_id
            join courses c on cbg.course_id = c.id
            join lessons l on c.id = l.course_id
            join practicals p on l.id = p.lesson_id
            where lesson_id = p_practical_id and s.user_id = p_student_id)
            AND

           -- задание можно сдать не позднее чем через 2 недели после начала урока
           -- и не раньше конца урока:
           exists(select 1 from lessons l
               join schedule s on l.number = s.lesson_number and l.course_id = s.course_id
               where l.id = p_practical_id and timestampdiff(day, s.date, p_date) <= 14
                 and timestampdiff(hour, s.date, p_date) >= 2)

            THEN INSERT INTO students_practicals(student_id, practical_id, date, content)
                 values(p_student_id, p_practical_id, p_date, p_content);
            SET `msg` := 'Данные согласованы';
        ELSE
            SET `msg` := CONCAT('Ошибка добавления данных. ', 'Строка: ', p_student_id, ' ',
                p_practical_id, ' ', p_date, ' ', p_content);
        END IF;
        SELECT `msg`;
    END//
DELIMITER ;


-- вью дата старта уроков у студентов: student_id, lesson_id, date
CREATE OR REPLACE VIEW students_lessons_date AS
    select
        s.user_id as student_id,
        l.id as lesson_id,
        sc.date as date
from students s
join edu_groups eg on s.group_id = eg.id
join courses_by_group cbg on s.group_id = cbg.group_id
join lessons l on cbg.course_id = l.course_id
join schedule sc on l.course_id = sc.course_id and l.number = sc.lesson_number and eg.id = sc.group_id;

select * from students_lessons_date;


-- хп заполняет teachers_practicals и проверяет что пз соотв курсу на кот учится студент и кот ведет препод
-- а также в teachers_practicals должны соотв students_practicals
DELIMITER //
DROP PROCEDURE IF EXISTS teachers_practicals_fill_sp//
CREATE PROCEDURE teachers_practicals_fill_sp(p_teacher_id bigint, p_student_id bigint,
p_practical_id bigint, p_rating tinyint(1))
    BEGIN
        DECLARE `msg` VARCHAR(100);
        IF
            -- задание выполнено:
            exists(select 1 from students_practicals sp
                where student_id = p_student_id and practical_id = p_practical_id)
                and

            -- студент учится у препода:
            exists (select 1 from students s
            join edu_groups eg on s.group_id = eg.id
            join courses_by_group cbg on eg.id = cbg.group_id
            join lessons l on cbg.course_id = l.course_id
            join schedule sc on l.course_id = sc.course_id and eg.id = sc.group_id
                where sc.teacher_id = p_teacher_id and s.user_id = p_student_id
                  and l.id = p_practical_id)

            THEN INSERT INTO teachers_practicals(teacher_id, student_id, practical_id, rating)
                 values(p_teacher_id, p_student_id, p_practical_id, p_rating);
            SET `msg` := 'Данные согласованы';
        ELSE
            SET `msg` := CONCAT('Ошибка добавления данных. ', 'Строка: ', p_teacher_id, ' ',
                p_student_id, ' ', p_practical_id, ' ', p_rating);
        END IF;
        SELECT `msg`;
    END//
DELIMITER ;


-- вью препод студент пз: teacher_id, student_id, practical_id
-- студент-группа-курс-расписание-урок-препод
CREATE OR REPLACE VIEW teacher_student_practical AS
    select
        t.user_id as teacher_id,
        s.user_id as student_id,
        l.id as practical_id
from students s
    join students_practicals sp on s.user_id = sp.student_id
    join edu_groups eg on s.group_id = eg.id
    join lessons l on sp.practical_id = l.id
    join schedule sc on l.course_id = sc.course_id and l.number = sc.lesson_number and eg.id = sc.group_id
    join teachers t on sc.teacher_id = t.user_id;

select * from teacher_student_practical;


-- добавь менторов в расписание!!!

-- reviews в соотв с курсом кот прошел студент
-- хп заполняет teacher_ratings проверяя что студент отучился на курсе кот вел препод
-- хп заполняет mentor_ratings проверяя что студент отучился на курсе на кот был этот ментор


-- хп заполняет табл скидки, проверяет что дата до старта программы и проверяет начало не в одно время

/* только после этого данные в базе будут согласованными и можно будет делать вьюшки */

-- триггер если время сдачи пз вышло - написать




/* отображает все не законченные курсы студента
   студент - практика -
   студент - курс - урок - нет практик - не смотрены видео - препод
   */
CREATE OR REPLACE VIEW students_debt_info
AS
SELECT
u.id AS ID,
CONCAT(u.lastname, ' ', u.firstname) AS student,
CONCAT(
    (SELECT GROUP_CONCAT(ps.ID) FROM
    (SELECT DISTINCT c.id AS ID
    FROM courses c
    JOIN programms_courses pcn on c.id = pcn.course_id
    JOIN programms p ON pcn.programm_id = p.id
    JOIN edu_groups eg on p.id = eg.programm_id
    JOIN students s on eg.id = s.group_id
    WHERE s.user_id = u.id
    UNION
    (SELECT DISTINCT cn.id FROM courses cn
    JOIN specializations_courses scn on cn.id = scn.course_id
    JOIN specializations spec ON scn.spec_id = spec.id
    JOIN edu_groups eg on spec.id = eg.programm_id
    JOIN students s on eg.id = s.group_id
    WHERE s.user_id = u.id)) AS ps)) AS courses
#         sp.is_completed AS complete,
#         sv.is_watched AS watched,
#         CONCAT(u.lastname, ' ', u.firstname) AS teacher
FROM users u;


-- видео и практика связаны с уроком,
-- у программы 4 курса
SELECT * FROM students_debt_info;


/* показывает студента, его группу, программу обучения, специализацию,
   всех его преподов и кол-во студентов в группе:
 */
CREATE OR REPLACE VIEW student_info
    AS
    SELECT CONCAT(u.firstname,' ', u.lastname) AS name,
           CONCAT(g.name, '_', g.id) AS group_name,
           CONCAT(p.id, '.', p.title) AS programm,
           CONCAT(spec.id, '.', spec.name) AS specialization,

           CONCAT((SELECT GROUP_CONCAT(cn.id SEPARATOR '; ')
                   FROM course_names cn
               JOIN courses c ON cn.id = c.course_name_id
               JOIN edu_groups g ON c.group_id = g.id
               JOIN students s ON g.id = s.group_id
                                  WHERE s.user_id = u.id)) AS courses,

           CONCAT((SELECT GROUP_CONCAT(CONCAT(u2.lastname, ', ', u2.firstname) SEPARATOR '; ')
                   FROM users u2
                   JOIN teachers t on u2.id = t.user_id
                   JOIN courses c2 on t.user_id = c2.teacher_id
                   JOIN edu_groups g2 on c2.group_id = g2.id
                   JOIN students s2 on g2.id = s2.group_id
                   WHERE s2.user_id = u.id)) AS teachers,

           (select COUNT(s3.user_id) FROM students s3
                                       WHERE s3.group_id = s.group_id) AS number
    FROM users u
    JOIN students s ON u.id = s.user_id
    JOIN edu_groups g ON s.group_id = g.id
    JOIN specializations spec on g.special_id = spec.id
    JOIN programms p on g.programm_id = p.id;

SELECT * FROM student_info;


# триггеры:
# проверка добавления данных в таблицы courses и edu_groups:
# курсы должен соответствовать программе и специализации
# программа должна соответствовать специализации

-- вью показывает всех преподов программы и их рейтинг
-- всех

# вью показывает оценки курсу, преподавателю, ментору от студентов:
# (курс - отзыв - препод - оценка - ментор - оценка - студент)
CREATE OR REPLACE VIEW rating_from_students
    AS
    SELECT
        s.user_id AS student_from,
        eg.id AS by_group,
        c.id AS to_course,
        cr.content AS course_review,
        t.user_id AS to_teacher,
        tr.rating AS teacher_rating
#         s.user_id AS to_mentor,
#         mr.rating AS mentor_rating

FROM users u
JOIN students s on u.id = s.user_id
JOIN edu_groups eg on s.group_id = eg.id
JOIN courses c on eg.id = c.group_id
JOIN course_names cn on cn.id = c.course_name_id
JOIN reviews cr on s.user_id = cr.from_student and c.id = cr.to_course
JOIN teacher_ratings tr on s.user_id = tr.from_student
JOIN teachers t on tr.to_teacher = t.user_id
JOIN mentor_ratings mr on s.user_id = mr.from_student
JOIN students s2 on mr.to_mentor = s2.user_id
;

SELECT * FROM rating_from_students;



create or replace view gr_st_course as
    select distinct
        eg.id as group_id,
        s.user_id as student_id,
        (select group_concat(distinct c.id)
            from students s
    join edu_groups g on s.group_id = g.id
    join courses c on g.id = c.group_id
            where g.id = eg.id )
    as cours_id
    from
    users u
join students s on u.id = s.user_id
join edu_groups eg on s.group_id = eg.id
join courses c on c.group_id = eg.id;


/*-------------------------------------------------------------------------------------------------------*/


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


