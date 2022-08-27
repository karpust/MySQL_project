-- триггер проверки согласованности данных с specializations_programms при вставке в edu_groups:
DELIMITER //
DROP PROCEDURE IF EXISTS edu_groups_check_before_insert//
CREATE TRIGGER edu_groups_check_before_insert
    BEFORE INSERT
    ON edu_groups
    FOR EACH ROW
BEGIN
    IF NOT EXISTS(SELECT 1
                  FROM specializations_programms
                  WHERE programm_id = new.programm_id
                    AND special_id = new.special_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! Specialization does not match the program';
    END IF;
END//
DELIMITER ;


-- хп вставки в students, users + обработка ошибки в транзакции:
DELIMITER //
DROP PROCEDURE IF EXISTS `students_fill_sp`//
CREATE PROCEDURE `students_fill_sp`(p_firstname VARCHAR(50), p_lastname VARCHAR(50), p_phone BIGINT,
                                    p_email VARCHAR(50), p_gender ENUM ('male', 'female', 'other'),
                                    p_country VARCHAR(50), p_city VARCHAR(50),
                                    p_birth_date DATE, p_interests VARCHAR(1000), p_password_hash VARCHAR(200),
                                    p_photo VARCHAR(1024),
                                    p_group_id BIGINT, p_aboutme VARCHAR(200), OUT trans_result VARCHAR(200))
BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE code VARCHAR(100);
    DECLARE error_string VARCHAR(100);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SET `_rollback` = 1;
            GET STACKED DIAGNOSTICS CONDITION 1
                code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
            SET trans_result := CONCAT('Error occured. Code: ', code, '. Text: ', error_string);
        END;

    START TRANSACTION;
    INSERT INTO users (firstname, lastname, phone, email, gender, country, city, birth_date, interests,
                       password_hash, photo)
    VALUES (p_firstname, p_lastname, p_phone, p_email, p_gender, p_country, p_city, p_birth_date,
            p_interests, p_password_hash, p_photo);
    INSERT INTO students (user_id, group_id, aboutme)
    VALUES (LAST_INSERT_ID(), p_group_id, p_aboutme);

    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        SET trans_result := 'ok';
        COMMIT;
    END IF;
    SELECT @trans_result;
END //
DELIMITER ;


-- хп вставки в teachers, users + обработка ошибки в транзакции:
DELIMITER //
DROP PROCEDURE IF EXISTS `teachers_fill_sp`//
CREATE PROCEDURE `teachers_fill_sp`(p_firstname VARCHAR(50), p_lastname VARCHAR(50), p_phone BIGINT,
                                    p_email VARCHAR(50), p_gender ENUM ('male', 'female', 'other'),
                                    p_country VARCHAR(50), p_city VARCHAR(50),
                                    p_birth_date DATE, p_interests VARCHAR(1000), p_password_hash VARCHAR(200),
                                    p_photo VARCHAR(1024),
                                    p_professional_way VARCHAR(200), p_education VARCHAR(200),
                                    p_work_explorer VARCHAR(200),
                                    p_use_technologies VARCHAR(200), p_position VARCHAR(200),
                                    p_words_for_students VARCHAR(200),
                                    p_teaching_subject VARCHAR(200), OUT trans_result VARCHAR(200))
BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE code VARCHAR(100);
    DECLARE error_string VARCHAR(100);

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SET `_rollback` = 1;
            GET STACKED DIAGNOSTICS CONDITION 1
                code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
            SET trans_result := CONCAT('Error occured. Code: ', code, '. Text: ', error_string);
        END;

    START TRANSACTION;
    INSERT INTO users (firstname, lastname, phone, email, gender, country, city, birth_date, interests,
                       password_hash, photo)
    VALUES (p_firstname, p_lastname, p_phone, p_email, p_gender, p_country, p_city, p_birth_date,
            p_interests, p_password_hash, p_photo);
    INSERT INTO teachers (user_id, professional_way, education, work_explorer, use_technologies, position,
                          words_for_students, teaching_subject)
    VALUES (LAST_INSERT_ID(), p_professional_way, p_education, p_work_explorer, p_use_technologies,
            p_position, p_words_for_students, p_teaching_subject);

    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        SET trans_result := 'ok';
        COMMIT;
    END IF;
    SELECT @trans_result;
END //
DELIMITER ;


/* хп заполняет schedule в соотв с основными условиями:
   ведет ли препод такой курс 
   есть ли у группы такой курс
   есть ли в курсе урок с таким номером 
   время уроков с 10 до 20 
   уроки по порядку для каждой группы(номер урока курса для группы)
   чтобы у одной группы или препода не было одновременно уроков(разница в 5 часов)
   */
DELIMITER //
DROP TRIGGER IF EXISTS schedule_check_before_insert//
CREATE TRIGGER schedule_check_before_insert
    BEFORE INSERT
    ON schedule
    FOR EACH ROW
BEGIN
    IF EXISTS(SELECT 1
              FROM schedule
              WHERE group_id = new.group_id
                AND course_id = new.course_id
                AND lesson_number = new.lesson_number) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'Error! The schedule already has this lesson of this course for the specified group';

    ELSEIF EXISTS(SELECT 1
                  FROM schedule
                  WHERE ABS(TIMESTAMPDIFF(HOUR, new.date, date)) < 5
                    AND teacher_id = new.teacher_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'Error! The next lesson of the teacher can begin no earlier than 5 hours from the beginning of the previous one';

    ELSEIF EXISTS(SELECT 1
                  FROM schedule
                  WHERE ABS(TIMESTAMPDIFF(DAY, new.date, date)) < 2
                    AND group_id = new.group_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'Error! The next group lesson can start no earlier than 48 hours later';

    ELSEIF NOT EXISTS(SELECT 1
                      FROM courses_teachers
                      WHERE course_id = new.course_id
                        AND teacher_id = new.teacher_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! This instructor does not teach the specified course';

    ELSEIF NOT EXISTS(SELECT 1
                      FROM courses_by_group
                      WHERE course_id = new.course_id
                        AND group_id = new.group_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'Error! The group does not have such a course in the program and specialization';

    ELSEIF NOT EXISTS(SELECT 1
                      FROM lessons
                      WHERE number = new.lesson_number
                        AND course_id = new.course_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! There is no lesson with this number in the course';

    ELSEIF EXISTS(SELECT 1 FROM schedule WHERE course_id = new.course_id AND group_id = new.group_id)
        AND NOT EXISTS(SELECT 1
                       FROM schedule
                       WHERE (SELECT MAX(lesson_number)
                              FROM schedule
                              WHERE course_id = new.course_id
                                AND group_id = new.group_id) = new.lesson_number - 1) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! The next lesson of the course must have next number. ';

    ELSEIF NOT EXISTS(SELECT 1
                      FROM schedule
                      WHERE course_id = new.course_id
                        AND group_id = new.group_id) AND new.lesson_number > 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! If the course has just begun, then lesson should be No. 1 ';

    ELSEIF HOUR(new.date) > 20 OR HOUR(new.date) < 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'Error! Lessons should start no earlier than 10 am and no later than 8 pm';

    ELSEIF EXISTS(SELECT 1
                  FROM schedule
                  WHERE group_id = new.group_id
                    AND course_id = new.course_id
                    AND date > new.date) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'Error! The next lesson of the course for the group cannot be earlier than the previous one';

    ELSEIF NOT EXISTS(SELECT 1 FROM courses_mentors WHERE mentor_id = new.mentor_id AND course_id = new.course_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! The mentor does not teach this course';

    END IF;
END //
DELIMITER ;


-- вью для составления расписания:
-- все курсы группы:
CREATE OR REPLACE VIEW courses_by_group AS
SELECT group_id,
       course_id
FROM ((SELECT eg.id AS group_id, c.id AS course_id
       FROM edu_groups eg
                JOIN programms p ON eg.programm_id = p.id
                JOIN programms_courses pc ON p.id = pc.programm_id
                JOIN courses c ON pc.course_id = c.id)
      UNION
      (SELECT eg2.id AS group_id2, c2.id AS course_id2
       FROM edu_groups eg2
                JOIN specializations s ON eg2.special_id = s.id
                JOIN specializations_courses sc ON s.id = sc.spec_id
                JOIN courses c2 ON sc.course_id = c2.id)) AS tab
ORDER BY group_id;

-- SELECT * FROM courses_by_group;


-- триггер заполнения students_practicals в соответствии сo schedule :
DELIMITER //
DROP TRIGGER IF EXISTS students_practicals_check_before_insert//
CREATE TRIGGER students_practicals_check_before_insert
    BEFORE INSERT
    ON students_practicals
    FOR EACH ROW
BEGIN
    -- у студента нет урока, которому соответствует пз:
    IF NOT EXISTS(SELECT 1
                  FROM students s
                           JOIN edu_groups eg ON s.group_id = eg.id
                           JOIN courses_by_group cbg ON s.group_id = cbg.group_id
                           JOIN lessons l ON cbg.course_id = l.course_id
                           JOIN practicals p ON l.id = p.lesson_id
                  WHERE lesson_id = new.practical_id
                    AND s.user_id = new.student_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'Error! Student does not have a lesson that corresponds to this practical task';

        -- задание можно сдать не позднее чем через 2 недели после начала урока
        -- и не раньше конца урока:
    ELSEIF NOT EXISTS(SELECT 1
                      FROM lessons l
                               JOIN schedule s ON l.number = s.lesson_number AND l.course_id = s.course_id
                      WHERE l.id = new.practical_id
                        AND TIMESTAMPDIFF(DAY, s.date, new.date) <= 14
                        AND TIMESTAMPDIFF(HOUR, s.date, new.date) >= 2) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'Error! Practical task must be complete no later than 2 weeks after start and not before the end of lesson';
    END IF;
END//
DELIMITER ;


-- вью дата старта уроков у студентов: student_id, lesson_id, date
-- CREATE OR REPLACE VIEW students_lessons_date AS
--     select
--         s.user_id as student_id,
--         l.id as lesson_id,
--         sc.date as date
-- from students s
-- join edu_groups eg on s.group_id = eg.id
-- join courses_by_group cbg on s.group_id = cbg.group_id
-- join lessons l on cbg.course_id = l.course_id
-- join schedule sc on l.course_id = sc.course_id and l.number = sc.lesson_number and eg.id = sc.group_id;

-- select * from students_lessons_date;


-- триггер для заполнения teachers_practicals:
DELIMITER //
DROP TRIGGER IF EXISTS teachers_practicals_check_before_insert//
CREATE TRIGGER teachers_practicals_check_before_insert
    BEFORE INSERT
    ON teachers_practicals
    FOR EACH ROW
BEGIN
    -- задание не выполнено:
    IF NOT EXISTS(SELECT 1
                  FROM students_practicals sp
                  WHERE student_id = new.student_id
                    AND practical_id = new.practical_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! Practical task not complete.';

        -- студент не учится у этого препода:
    ELSEIF NOT EXISTS(SELECT 1
                      FROM students s
                               JOIN edu_groups eg ON s.group_id = eg.id
                               JOIN courses_by_group cbg ON eg.id = cbg.group_id
                               JOIN lessons l ON cbg.course_id = l.course_id
                               JOIN schedule sc ON l.course_id = sc.course_id AND eg.id = sc.group_id
                      WHERE sc.teacher_id = new.teacher_id
                        AND s.user_id = new.student_id
                        AND l.id = new.practical_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error!  Student is not studying with this teacher.';

    END IF;
END//
DELIMITER ;


-- вью препод студент пз: teacher_id, student_id, practical_id
-- студент-группа-курс-расписание-урок-препод
CREATE OR REPLACE VIEW teacher_student_practical AS
SELECT t.user_id AS teacher_id,
       s.user_id AS student_id,
       l.id      AS practical_id
FROM students s
         JOIN students_practicals sp ON s.user_id = sp.student_id
         JOIN edu_groups eg ON s.group_id = eg.id
         JOIN lessons l ON sp.practical_id = l.id
         JOIN schedule sc ON l.course_id = sc.course_id AND l.number = sc.lesson_number AND eg.id = sc.group_id
         JOIN teachers t ON sc.teacher_id = t.user_id;

-- select * from teacher_student_practical;


-- триггер на сообщения, нельзя отправлять себе
DELIMITER //
DROP TRIGGER IF EXISTS messages_check_before_insert//
CREATE TRIGGER messages_check_before_insert
    BEFORE INSERT
    ON messages
    FOR EACH ROW
BEGIN
    IF new.from_id = new.to_id THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! User can not send messages for yourself';
    END IF;

    IF EXISTS(SELECT 1
              FROM messages
              WHERE from_id = new.from_id
                AND to_id = new.to_id
                AND date = new.date) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! Duplicate message';
    END IF;
END //
DELIMITER ;


-- триггер: преподаватель посылает студенту сообщение о том, что проверил практическое задание:
DELIMITER //
DROP TRIGGER IF EXISTS job_checked_after_insert//
CREATE TRIGGER job_checked_after_insert
    AFTER INSERT
    ON teachers_practicals
    FOR EACH ROW
BEGIN
    SELECT teacher_id, student_id, practical_id
    INTO @teacher_id, @student_id, @practical_id
    FROM teachers_practicals
    ORDER BY date DESC
    LIMIT 1;

    SET @student_name = (SELECT CONCAT(u.firstname, ' ', u.lastname)
                         FROM teachers_practicals tp
                                  JOIN users u ON tp.student_id = u.id
                         WHERE u.id = @student_id
                           AND tp.practical_id = @practical_id);

    SET @course_name = (SELECT c.title
                        FROM courses c
                                 JOIN courses_by_group cbg ON c.id = cbg.course_id
                                 JOIN students s ON cbg.group_id = s.group_id
                                 JOIN lessons l ON c.id = l.course_id
                        WHERE l.id = @practical_id
                          AND s.user_id = @student_id);

    SET @lesson_number = (SELECT l.number
                          FROM lessons l
                                   JOIN students_practicals sp ON sp.practical_id = l.id
                          WHERE l.id = @practical_id
                            AND sp.student_id = @student_id);

    SET @message_content =
            CONCAT('Здравствуйте, ', @student_name, '! Ваше практическое задание на курсе "', @course_name,
                   '" к уроку ', @lesson_number, ' проверено.');

    INSERT INTO messages (`from_id`, `to_id`, `content`) VALUES (@teacher_id, @student_id, @message_content);
END //
DELIMITER ;

SHOW TRIGGERS;


/* показывает студента, его группу, программу обучения, специализацию,
   всех его преподов и кол-во студентов в группе:
 */
CREATE OR REPLACE VIEW student_info
AS
SELECT CONCAT(u.firstname, ' ', u.lastname)       AS name,
       CONCAT(g.name, '_', g.id)                  AS group_name,
       CONCAT(p.id, '. ', p.title)                AS programm,
       CONCAT(spec.id, '. ', spec.name)           AS specialization,
       GROUP_CONCAT(cbg.course_id SEPARATOR '; ') AS courses,
       (SELECT GROUP_CONCAT(DISTINCT CONCAT(u2.lastname, ', ', u2.firstname) SEPARATOR '; ')
        FROM users u2
                 JOIN teachers t ON u2.id = t.user_id
                 JOIN schedule sc ON t.user_id = sc.teacher_id
        WHERE sc.group_id = g.id)                 AS teachers,

       (SELECT COUNT(s1.user_id)
        FROM students s1
        WHERE s1.group_id = g.id)                 AS number
FROM users u
         JOIN students s ON u.id = s.user_id
         JOIN edu_groups g ON s.group_id = g.id
         JOIN schedule sc ON g.id = sc.group_id
         JOIN courses_by_group cbg ON sc.group_id = cbg.group_id
         JOIN specializations spec ON g.special_id = spec.id
         JOIN programms p ON g.programm_id = p.id
GROUP BY s.user_id;

-- SELECT * FROM student_info;


/* отображает все не законченные курсы студента
   студент - курс - урок - нет практик - препод
   */
CREATE OR REPLACE VIEW students_debt_info
AS
SELECT u.id                                 AS id,
       CONCAT(u.lastname, ' ', u.firstname) AS student,
       cbg.course_id                        AS courses,
       GROUP_CONCAT(l.number)               AS number,
       (SELECT sc.date
        FROM schedule sc
        WHERE course_id = cbg.course_id
          AND lesson_number = 1
          AND group_id = eg.id)             AS start_course,
       t.user_id                            AS teacher
FROM users u
         JOIN students s ON u.id = s.user_id
         JOIN edu_groups eg ON s.group_id = eg.id
         JOIN courses_by_group cbg ON s.group_id = cbg.group_id
         JOIN courses_teachers ct ON cbg.course_id = ct.course_id
         JOIN teachers t ON ct.teacher_id = t.user_id
         JOIN lessons l ON cbg.course_id = l.course_id
         JOIN practicals p ON l.id = p.lesson_id
WHERE NOT EXISTS(SELECT 1 FROM students_practicals WHERE student_id = u.id AND practical_id = l.id)
GROUP BY l.course_id, s.user_id
ORDER BY s.user_id
;

-- SELECT * FROM students_debt_info;

# SHOW TRIGGERS;


