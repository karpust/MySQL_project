DROP DATABASE IF EXISTS geekbrains_db;
CREATE DATABASE geekbrains_db;
USE geekbrains_db;


DROP TABLE IF EXISTS directions;
CREATE TABLE directions
(
    id   INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL
) COMMENT 'направления обучения';


DROP TABLE IF EXISTS specializations;
CREATE TABLE specializations
(
    id   INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL
) COMMENT 'специализации';


DROP TABLE IF EXISTS programms;
CREATE TABLE programms
(
    id              INT UNSIGNED        NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    logo            VARCHAR(1024),
    title           VARCHAR(100) UNIQUE NOT NULL,
    level_prog      ENUM ('Intern', 'junior', 'middle', 'middle+'),
    is_employment   BIT,
    descriptions    TEXT                NOT NULL,
    salary_at_start INT UNSIGNED        NOT NULL,
    road_map        VARCHAR(1024),
    start_date      DATE,
    duration        VARCHAR(100),
    price           DECIMAL(11, 2)
) COMMENT 'программы обучения';


# у каждой программы мб несколько специализаций и наоборот:
DROP TABLE IF EXISTS specializations_programms;
CREATE TABLE specializations_programms
(
    special_id  INT UNSIGNED NOT NULL,
    programm_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (special_id, programm_id),
    FOREIGN KEY (special_id) REFERENCES specializations (id),
    FOREIGN KEY (programm_id) REFERENCES programms (id)
);

# направление обучения может включать несколько программ и программа соотв нескольким направл
DROP TABLE IF EXISTS directions_programms;
CREATE TABLE directions_programms
(
    direction_id INT UNSIGNED NOT NULL,
    programm_id  INT UNSIGNED NOT NULL,
    PRIMARY KEY (direction_id, programm_id),
    FOREIGN KEY (direction_id) REFERENCES directions (id),
    FOREIGN KEY (programm_id) REFERENCES programms (id)
);


DROP TABLE IF EXISTS technologies;
CREATE TABLE technologies
(
    id   SERIAL,
    name VARCHAR(255) UNIQUE
) COMMENT 'языки и технологии';


# в программе изучают много технологий и наоборот:
DROP TABLE IF EXISTS technologies_programms;
CREATE TABLE technologies_programms
(
    tech_id     BIGINT UNSIGNED NOT NULL,
    programm_id INT UNSIGNED    NOT NULL,
    PRIMARY KEY (tech_id, programm_id),
    FOREIGN KEY (tech_id) REFERENCES technologies (id),
    FOREIGN KEY (programm_id) REFERENCES programms (id)
);


# по одной программе могут обучаться много групп:
DROP TABLE IF EXISTS edu_groups;
CREATE TABLE edu_groups
(
    id          SERIAL,
    name        VARCHAR(255) UNIQUE,
    special_id  INT UNSIGNED NOT NULL,
    programm_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (special_id) REFERENCES specializations (id),
    FOREIGN KEY (programm_id) REFERENCES programms (id)
) COMMENT 'учебная группа';


DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    id            BIGINT UNSIGNED    NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstname     VARCHAR(50)        NOT NULL,
    lastname      VARCHAR(50)        NOT NULL,
    phone         BIGINT UNSIGNED    NOT NULL UNIQUE,
    email         VARCHAR(50) UNIQUE NOT NULL,
    gender        ENUM ('male', 'female', 'other'),
    country       VARCHAR(50)        NOT NULL,
    city          VARCHAR(50)        NOT NULL,
    birth_date    DATE,
    interests     VARCHAR(1000),
    password_hash VARCHAR(200)       NOT NULL,
    photo         VARCHAR(1024)
) COMMENT 'пользователи';


# студент это юзер:
DROP TABLE IF EXISTS students;
CREATE TABLE students
(
    user_id  BIGINT UNSIGNED NOT NULL PRIMARY KEY,
    group_id BIGINT UNSIGNED NOT NULL,
    aboutme  VARCHAR(800),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (group_id) REFERENCES edu_groups (id)
) COMMENT 'студенты';


# преподаватель это юзер:
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers
(
    user_id            BIGINT UNSIGNED NOT NULL PRIMARY KEY,
    professional_way   VARCHAR(200),
    education          VARCHAR(200),
    work_explorer      VARCHAR(200),
    use_technologies   VARCHAR(200),
    position           VARCHAR(200),
    words_for_students VARCHAR(200),
    teaching_subject   VARCHAR(200),
    FOREIGN KEY (user_id) REFERENCES users (id)
) COMMENT 'профиль преподавателя';


DROP TABLE IF EXISTS courses;
CREATE TABLE courses
(
    id    SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL
) COMMENT 'курсы';


-- у каждой специализации свои курсы, кот добавляются к программе:
DROP TABLE IF EXISTS specializations_courses;
CREATE TABLE specializations_courses
(
    spec_id   INT UNSIGNED    NOT NULL,
    course_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (spec_id, course_id),
    FOREIGN KEY (spec_id) REFERENCES specializations (id),
    FOREIGN KEY (course_id) REFERENCES courses (id)
);


-- у программы много курсов и наоборот:
DROP TABLE IF EXISTS programms_courses;
CREATE TABLE programms_courses
(
    programm_id INT UNSIGNED    NOT NULL,
    course_id   BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (programm_id, course_id),
    FOREIGN KEY (programm_id) REFERENCES programms (id),
    FOREIGN KEY (course_id) REFERENCES courses (id)
);


-- у препода много курсов и наоборот(то что знает):
DROP TABLE IF EXISTS courses_teachers;
CREATE TABLE courses_teachers
(
    course_id  BIGINT UNSIGNED NOT NULL,
    teacher_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (course_id, teacher_id),
    FOREIGN KEY (course_id) REFERENCES courses (id),
    FOREIGN KEY (teacher_id) REFERENCES teachers (user_id)
);


# у наставника много курсов и наоборот
# студент, став ментором, добавляется сюда:
DROP TABLE IF EXISTS courses_mentors;
CREATE TABLE courses_mentors
(
    course_id BIGINT UNSIGNED NOT NULL,
    mentor_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (course_id, mentor_id),
    FOREIGN KEY (course_id) REFERENCES courses (id),
    FOREIGN KEY (mentor_id) REFERENCES students (user_id)
);


DROP TABLE IF EXISTS lessons;
CREATE TABLE lessons
(
    id        SERIAL PRIMARY KEY,
    number    TINYINT(2) UNSIGNED NOT NULL,
    course_id BIGINT UNSIGNED     NOT NULL, -- ?
    title     VARCHAR(200),
    FOREIGN KEY (course_id) REFERENCES courses (id)
) COMMENT 'уроки курса';


-- таблица расписания уроков курсов у групп и преподов:
DROP TABLE IF EXISTS schedule;
CREATE TABLE schedule
(
    date          DATETIME DEFAULT CURRENT_TIMESTAMP,
    teacher_id    BIGINT UNSIGNED     NOT NULL,
    group_id      BIGINT UNSIGNED     NOT NULL,
    lesson_number TINYINT(2) UNSIGNED NOT NULL, -- это для наглядности, вместо lesson_id
    course_id     BIGINT UNSIGNED     NOT NULL, -- и это
    mentor_id     BIGINT UNSIGNED     NOT NULL,
    PRIMARY KEY (date, group_id),               -- в одно время у группы может быть один урок в расписании
    FOREIGN KEY (teacher_id) REFERENCES teachers (user_id),
    FOREIGN KEY (group_id) REFERENCES edu_groups (id),
    FOREIGN KEY (course_id) REFERENCES courses (id),
    FOREIGN KEY (mentor_id) REFERENCES students (user_id)
) COMMENT 'расписание';


-- практические задания к каждому уроку:
DROP TABLE IF EXISTS practicals;
CREATE TABLE practicals
(
    lesson_id BIGINT UNSIGNED NOT NULL PRIMARY KEY, -- 1*1
    content   VARCHAR(1024) COMMENT 'ссылка на задание',
    FOREIGN KEY (lesson_id) REFERENCES lessons (id)
) COMMENT 'практическое задание';


-- выполненные практические задания студента:
DROP TABLE IF EXISTS students_practicals;
CREATE TABLE students_practicals
(
    student_id   BIGINT UNSIGNED NOT NULL,
    practical_id BIGINT UNSIGNED NOT NULL,
    date         DATETIME DEFAULT CURRENT_TIMESTAMP,
    content      VARCHAR(1024) COMMENT 'ссылка на выполнение',
    PRIMARY KEY (student_id, practical_id),
    FOREIGN KEY (student_id) REFERENCES students (user_id),
    FOREIGN KEY (practical_id) REFERENCES practicals (lesson_id)
);


DROP TABLE IF EXISTS messages;
CREATE TABLE messages
(
    from_id BIGINT UNSIGNED NOT NULL,
    to_id   BIGINT UNSIGNED NOT NULL,
    content TEXT,
    date    DATETIME DEFAULT NOW(),
    FOREIGN KEY (from_id) REFERENCES users (id),
    FOREIGN KEY (to_id) REFERENCES users (id)
) COMMENT 'сообщения';


-- проверенные преподавателем практические задания студентов:
DROP TABLE IF EXISTS teachers_practicals;
CREATE TABLE teachers_practicals
(
    teacher_id   BIGINT UNSIGNED NOT NULL,
    student_id   BIGINT UNSIGNED NOT NULL,
    practical_id BIGINT UNSIGNED NOT NULL,
    rating       TINYINT(1) COMMENT 'оценка',
    date         DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (student_id, practical_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers (user_id),
    FOREIGN KEY (student_id) REFERENCES students (user_id),
    FOREIGN KEY (practical_id) REFERENCES practicals (lesson_id)
);


# drop table if exists discounts;
# create table discounts (
#     id serial primary key,
#     programm_id int unsigned not null,
#     discount float unsigned,
#     started_at datetime,
#     finished_ad datetime,
#     foreign key (programm_id) references programms(id)
# ) comment 'скидки';
#
#
# drop table if exists reviews;
# create table reviews(
#     to_course bigint unsigned not null,
#     from_student bigint unsigned not null,
#     content text,
#     primary key (to_course, from_student),
#     foreign key (to_course) references courses(id),
#     foreign key (from_student) references students(user_id)
# ) comment 'отзывы на курс';
#
#
# # студент оценивает разных преподов и у препода оценки разных студентов:
# drop table if exists teacher_ratings;
# create table teacher_ratings(
#     to_teacher bigint unsigned not null,
#     from_student bigint unsigned not null,
#     rating tinyint(1) unsigned not null,
#     primary key (to_teacher, from_student),
#     foreign key (to_teacher) references teachers(user_id),
#     foreign key (from_student) references students(user_id)
# ) comment 'оценка преподавателю';
#
#
# # студент оценивает разных наставников и у наставников оценки разных студентов:
# drop table if exists mentor_ratings;
# create table mentor_ratings(
#     to_mentor bigint unsigned not null,
#     from_student bigint unsigned not null,
#     rating tinyint(1) unsigned not null,
#     primary key (to_mentor, from_student),
#     foreign key (to_mentor) references students(user_id),
#     foreign key (from_student) references students(user_id)
# ) comment 'оценка наставнику';


