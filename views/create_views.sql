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
DROP TRIGGER IF EXISTS schedule_check_before_insert//
CREATE TRIGGER schedule_check_before_insert BEFORE INSERT ON schedule
    FOR EACH ROW
BEGIN
    IF exists(select 1 from schedule where group_id = new.group_id
                                       and course_id = new.course_id
                                       and lesson_number = new.lesson_number) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! The schedule already has this lesson of this course for the specified group';

    ELSEIF exists(select 1 from schedule where ABS(TIMESTAMPDIFF(hour, new.date, date)) < 5 and
            teacher_id = new.teacher_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! The next lesson of the teacher can begin no earlier than 5 hours from the beginning of the previous one';

    ELSEIF exists(select 1 from schedule where ABS(TIMESTAMPDIFF(day, new.date, date)) < 2 and
            group_id = new.group_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! The next group lesson can start no earlier than 48 hours later';

    ELSEIF not exists(select 1 from courses_teachers where course_id = new.course_id
                                                       and teacher_id = new.teacher_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! This instructor does not teach the specified course';

    ELSEIF not exists (select 1 from courses_by_group where course_id = new.course_id
                                                        and group_id = new.group_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! The group does not have such a course in the program and specialization';

    ELSEIF not exists(select 1 from lessons where number = new.lesson_number
                                              and course_id = new.course_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! There is no lesson with this number in the course';

    ELSEIF exists(select 1 from schedule where course_id = new.course_id and group_id = new.group_id)
               and not exists(select 1 from schedule where (select max(lesson_number)
                                                from schedule where course_id = new.course_id
                                                and group_id = new.group_id) = new.lesson_number - 1 ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! The next lesson of the course must have next number. ';

    ELSEIF not exists(select 1 from schedule where course_id = new.course_id and
                                                   group_id = new.group_id) and new.lesson_number > 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! If the course has just begun, then lesson should be No. 1 ';

    ELSEIF hour(new.date) > 20 or hour(new.date) < 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! Lessons should start no earlier than 10 am and no later than 8 pm';

    ELSEIF exists(select 1 from schedule where group_id = new.group_id and course_id = new.course_id and
                                               date > new.date) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! The next lesson of the course for the group cannot be earlier than the previous one';

    ELSEIF not exists(select 1 from courses_mentors where mentor_id = new.mentor_id and course_id = new.course_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! The mentor does not teach this course';

    END IF;
END //
DELIMITER ;


SHOW TRIGGERS;


-- для составления расписания создам вью:
-- вью все курсы препода:
# CREATE OR REPLACE VIEW `courses_by_teacher` AS
#     SELECT
#         t.user_id AS teacher_id,
#         concat((select group_concat(c.id) from courses c
#             join courses_teachers ct on c.id = ct.course_id
#             where ct.teacher_id = t.user_id)) as courses_id
#     FROM teachers t;
#
# SELECT * FROM courses_by_teacher;

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



-- триггер заполнения students_practicals в соответствии сo schedule :
DELIMITER //
DROP TRIGGER IF EXISTS students_practicals_check_before_insert//
CREATE TRIGGER students_practicals_check_before_insert BEFORE INSERT ON students_practicals
    FOR EACH ROW
BEGIN
    -- у студента нет урока, которому соответствует пз:
    IF NOT EXISTS (select 1 from students s
            join edu_groups eg on s.group_id = eg.id
            join courses_by_group cbg on s.group_id = cbg.group_id
            join lessons l on cbg.course_id = l.course_id
            join practicals p on l.id = p.lesson_id
            where lesson_id = new.practical_id and s.user_id = new.student_id) THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! Student does not have a lesson that corresponds to this practical task';

    -- задание можно сдать не позднее чем через 2 недели после начала урока
    -- и не раньше конца урока:
    ELSEIF not exists(select 1 from lessons l
               join schedule s on l.number = s.lesson_number and l.course_id = s.course_id
               where l.id = new.practical_id and timestampdiff(day, s.date, new.date) <= 14
                 and timestampdiff(hour, s.date, new.date) >= 2) THEN
                     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! Practical task must be complete no later than 2 weeks after start and not before the end of lesson';
        END IF;
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

# select * from students_lessons_date;


-- триггер для заполнения teachers_practicals.
-- проверяет что пз соотв курсу на кот учится студент и кот ведет препод
-- а также в teachers_practicals должны соотв students_practicals
DELIMITER //
DROP TRIGGER IF EXISTS teachers_practicals_check_before_insert//
CREATE TRIGGER teachers_practicals_check_before_insert BEFORE INSERT ON teachers_practicals
FOR EACH ROW
    BEGIN
        -- задание не выполнено:
        IF NOT exists(select 1 from students_practicals sp
                where student_id = new.student_id and practical_id = new.practical_id) THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! Practical task not complete.';

        -- студент не учится у этого препода:
        ELSEIF NOT exists (select 1 from students s
            join edu_groups eg on s.group_id = eg.id
            join courses_by_group cbg on eg.id = cbg.group_id
            join lessons l on cbg.course_id = l.course_id
            join schedule sc on l.course_id = sc.course_id and eg.id = sc.group_id
                where sc.teacher_id = new.teacher_id and s.user_id = new.student_id
                  and l.id = new.practical_id) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error!  Student is not studying with this teacher.';

        END IF;
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

# select * from teacher_student_practical;


-- триггер на сообщения, нельзя отправлять себе
DELIMITER //
DROP TRIGGER IF EXISTS messages_check_before_insert//
CREATE TRIGGER messages_check_before_insert BEFORE INSERT ON messages
    FOR EACH ROW
BEGIN
    IF new.from_id = new.to_id THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! User can not send messages for yourself';
    END IF;
END //
DELIMITER ;


-- --------------------------------------------------------------------------------------------------



-- reviews в соотв с курсом кот прошел студент
-- хп заполняет teacher_ratings проверяя что студент отучился на курсе кот вел препод
-- хп заполняет mentor_ratings проверяя что студент отучился на курсе на кот был этот ментор
-- хп заполняет табл скидки, проверяет что дата до старта программы и проверяет начало не в одно время

/* только после этого данные в базе будут согласованными и можно будет делать вьюшки */


/* показывает студента, его группу, программу обучения, специализацию,
   всех его преподов и кол-во студентов в группе:
 */
CREATE OR REPLACE VIEW student_info
    AS
    SELECT CONCAT(u.firstname,' ', u.lastname) AS name,
           CONCAT(g.name, '_', g.id) AS group_name,
           CONCAT(p.id, '. ', p.title) AS programm,
           CONCAT(spec.id, '. ', spec.name) AS specialization,
           CONCAT((SELECT GROUP_CONCAT(cbg.course_id SEPARATOR '; ')
               from students s
               join edu_groups eg on s.group_id = eg.id
               join courses_by_group cbg on eg.id = cbg.group_id
               where s.user_id = u.id)) AS courses,
           CONCAT((SELECT GROUP_CONCAT(CONCAT(u2.lastname, ', ', u2.firstname) SEPARATOR '; ')
                   FROM users u2
                   JOIN teachers t on u2.id = t.user_id
                   join courses_teachers ct on t.user_id = ct.teacher_id
                   join courses_by_group cbg on ct.course_id = cbg.course_id
                   JOIN edu_groups eg on cbg.group_id = eg.id
                   JOIN students s on eg.id = s.group_id
                   WHERE s.user_id = u.id)) AS teachers,
           (select COUNT(s1.user_id) FROM students s1
                                       WHERE s1.group_id = g.id) AS number
    FROM users u
    JOIN students s ON u.id = s.user_id
    JOIN edu_groups g ON s.group_id = g.id
    JOIN specializations spec on g.special_id = spec.id
    JOIN programms p on g.programm_id = p.id;

SELECT * FROM student_info;





/* отображает все не законченные курсы студента
   студент - курс - урок - нет практик - препод
   */
CREATE OR REPLACE VIEW students_debt_info
AS
SELECT
    u.id AS ID,
    CONCAT(u.lastname, ' ', u.firstname) AS student,
    cbg.course_id AS courses,
    concat((SELECT GROUP_CONCAT(l2.id)
            FROM lessons l2
            where l2.id = l.number)) AS lesson_numbers,
    t.user_id AS teacher
FROM users u
         join students s on u.id = s.user_id
         join edu_groups eg on s.group_id = eg.id
         join courses_by_group cbg on s.group_id = cbg.group_id
         join courses_teachers ct on cbg.course_id = ct.course_id
         join teachers t on ct.teacher_id = t.user_id
         join lessons l on cbg.course_id = l.course_id
         join practicals p on l.id = p.lesson_id
where not exists (select 1 from students_practicals where student_id = u.id and practical_id = l.id)
;

SELECT * FROM students_debt_info;


-- вью показывает всех преподов программы и их рейтинг

# вью показывает оценки курсу, преподавателю, ментору от студентов:
# (курс - отзыв - препод - оценка - ментор - оценка - студент)
# CREATE OR REPLACE VIEW rating_from_students
#     AS
#     SELECT
#         s.user_id AS student_from,
#         eg.id AS by_group,
#         c.id AS to_course,
#         cr.content AS course_review,
#         t.user_id AS to_teacher,
#         tr.rating AS teacher_rating
# #         s.user_id AS to_mentor,
# #         mr.rating AS mentor_rating
#
# FROM users u
# JOIN students s on u.id = s.user_id
# JOIN edu_groups eg on s.group_id = eg.id
# JOIN courses c on eg.id = c.group_id
# JOIN course_names cn on cn.id = c.course_name_id
# JOIN reviews cr on s.user_id = cr.from_student and c.id = cr.to_course
# JOIN teacher_ratings tr on s.user_id = tr.from_student
# JOIN teachers t on tr.to_teacher = t.user_id
# JOIN mentor_ratings mr on s.user_id = mr.from_student
# JOIN students s2 on mr.to_mentor = s2.user_id
# ;
#
# SELECT * FROM rating_from_students;



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


-- ----------------------------------------------------------------------------------------------------------------

-- триггер отправка сообщения от ментора при старте курса
-- if scedule.date = current_timestamp чтобы отправить сообщение надо кудато сделать запись ...
-- если время в расписании = сейчас, и номер урока 1, функция сравнивает даты в расписании с сегодняшней
-- кто запускает ф-ю?
# DROP EVENT IF EXISTS message_from_mentor_on_start;
# DELIMITER //
# CREATE EVENT message_from_mentor_on_start BEFORE INSERT ON messages
#     FOR EACH ROW
#     BEGIN
#
#     END //


# DROP TRIGGER IF EXISTS check_users;
# DELIMITER //
# CREATE TRIGGER check_users AFTER INSERT ON users
#     FOR EACH ROW
#     BEGIN
#         DECLARE table_name VARCHAR(50) DEFAULT 'users';
#         SELECT id, name INTO @item_id, @name FROM users ORDER BY id DESC LIMIT 1;
#         INSERT INTO logs (`table_name`, `item_id`, `name`)
#         VALUES (table_name, @item_id, @name);
#     END//