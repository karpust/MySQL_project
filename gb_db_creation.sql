drop database if exists geekbrains_db;
create database geekbrains_db;
use geekbrains_db;


drop table if exists directions;
create table directions(
    id int unsigned unique not null auto_increment,
    name varchar(255) unique not null
) comment 'направления обучения';


drop table if exists specializations;
create table specializations(
    id int unsigned unique not null auto_increment,
    name varchar(255) unique not null
) comment 'специализации';


drop table if exists programms;
create table programms(
    id int unsigned not null unique auto_increment primary key,
    logo varchar(1024),
    title varchar(100) unique not null,
    level_prog enum('Intern', 'junior', 'middle', 'middle+'),
    is_employment bit,
    descriptions text not null,
    salary_at_start int unsigned not null,
    road_map varchar(1024),
    start_date date,
    duration varchar(100),
    price decimal(11,2)
) comment 'программы обучения';


# у каждой программы мб несколько специализаций и наоборот:
drop table if exists specializations_programms;
create table specializations_programms(
    special_id int unsigned  not null,
    programm_id int unsigned not null,
    primary key (special_id, programm_id),
    foreign key (special_id) references specializations(id),
    foreign key (programm_id) references programms(id)
);

# направление обучения может включать несколько программ и программа соотв нескольким направл
drop table if exists directions_programms;
create table directions_programms(
    direction_id int unsigned not null,
    programm_id int unsigned not null,
    primary key (direction_id, programm_id),
    foreign key (direction_id) references directions(id),
    foreign key (programm_id) references programms(id)
);


drop table if exists discounts;
create table discounts (
    id serial primary key,
    programm_id int unsigned not null,
    discount float unsigned,
    started_at datetime,
    finished_ad datetime,
    foreign key (programm_id) references programms(id)
) comment 'скидки';


drop table if exists technologies;
create table technologies(
    id serial,
    name varchar(255) unique
) comment 'языки и технологии';


# в программе изучают много технологий и наоборот:
drop table if exists technologies_programms;
create table technologies_programms(
    tech_id bigint unsigned not null,
    programm_id int unsigned not null,
    primary key (tech_id, programm_id),
    foreign key (tech_id) references technologies(id),
    foreign key (programm_id) references programms(id)
);


# по одной программе могут обучаться много групп:
drop table if exists edu_groups;
create table edu_groups(
    id serial,
    name varchar(255) unique,
    special_id int unsigned not null,
    programm_id int unsigned not null,
    foreign key (special_id) references specializations(id),
    foreign key (programm_id) references programms(id)
) comment 'учебная группа';


drop table if exists users;
create table users(
    id bigint unsigned not null auto_increment primary key,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    phone bigint unsigned not null unique,
    email varchar(50) unique not null,
    gender enum('male', 'female', 'other'),
    country varchar(50) not null,
    city varchar(50) not null,
    birth_date date,
    interests varchar(1000),
    password_hash varchar(200) not null,
    photo varchar(1024)
) comment 'пользователи';


# студент это юзер:
drop table if exists students;
create table students(
    user_id bigint unsigned not null primary key,
    group_id bigint unsigned not null,
    aboutme varchar(800),
    foreign key (user_id) references users(id),
    foreign key (group_id) references edu_groups(id)
) comment 'студенты';


# преподаватель это юзер:
drop table if exists teachers;
create table teachers(
    user_id bigint unsigned not null primary key,
    professional_way varchar(200),
    education varchar(200),
    work_explorer varchar(200),
    use_technologies varchar(200),
    position varchar(200),
    words_for_students varchar(200),
    teaching_subject varchar(200),
    foreign key (user_id) references users(id)
) comment 'профиль преподавателя';


drop table if exists courses;
create table  courses(
    id serial primary key,
    title varchar(100) not null
) comment 'курсы';


-- у каждой специализации свои курсы, кот добавляются к программе:
drop table if exists specializations_courses;
create table specializations_courses(
    spec_id int unsigned not null,
    course_id bigint unsigned not null,
    primary key (spec_id, course_id),
    foreign key (spec_id) references specializations(id),
    foreign key (course_id) references courses(id)
);


-- у программы много курсов и наоборот:
drop table if exists programms_courses;
create table programms_courses(
    programm_id int unsigned not null,
    course_id bigint unsigned not null,
    primary key (programm_id, course_id),
    foreign key (programm_id) references programms(id),
    foreign key (course_id) references courses(id)
);


-- у препода много курсов и наоборот(то что знает):
drop table if exists courses_teachers;
create table courses_teachers(
    course_id bigint unsigned not null,
    teacher_id bigint unsigned not null,
    primary key (course_id, teacher_id),
    foreign key (course_id) references courses(id),
    foreign key (teacher_id) references teachers(user_id)
);


# у наставника много курсов и наоборот
# студент, став ментором, добавляется сюда:
drop table if exists courses_mentors;
create table courses_mentors(
    course_id bigint unsigned not null,
    mentor_id bigint unsigned not null,
    primary key (course_id, mentor_id),
    foreign key (course_id) references courses(id),
    foreign key (mentor_id) references students(user_id)
);


drop table if exists lessons;
create table lessons(
    id serial primary key,
    number tinyint(2) unsigned not null,
    course_id bigint unsigned not null,  -- ?
    title varchar(200),
    foreign key (course_id) references courses(id)
) comment 'уроки курса';


-- таблица расписания уроков курсов у групп и преподов:
drop table if exists schedule;
create table schedule(
    id serial,
    date datetime,
    teacher_id bigint unsigned not null,
    group_id bigint unsigned not null,
    lesson_number tinyint(2) unsigned not null,
    course_id bigint unsigned not null,
    mentor_id bigint unsigned not null,
    foreign key (teacher_id) references teachers(user_id),
    foreign key (group_id) references edu_groups(id),
    foreign key (course_id) references courses(id),
    foreign key (mentor_id) references students(user_id)
) comment 'расписание';


-- практические задания к каждому уроку:
drop table if exists practicals;
create table practicals(
    lesson_id bigint unsigned not null, --  1*1
    content varchar(1024) comment 'ссылка на задание',
    foreign key (lesson_id) references lessons(id)
) comment 'практическое задание';


-- выполненные практические задания студента:
-- когда появляются в этой таблице срабатывает триггер и
-- преподу отправляется сообщение от портала

drop table if exists students_practicals;
create table students_practicals(
    student_id bigint unsigned not null,
    practical_id bigint unsigned not null,
    date datetime default current_timestamp,
    content varchar(1024) comment 'ссылка на выполнение',
    primary key (student_id, practical_id),
    foreign key (student_id) references students(user_id),
    foreign key (practical_id) references practicals(lesson_id)
);


-- проверенные преподавателем практические задания студентов:
drop table if exists teachers_practicals;
create table teachers_practicals(
    teacher_id bigint unsigned not null,
    student_id bigint unsigned not null,
    practical_id bigint unsigned not null,
    rating tinyint(1) comment 'оценка',
    primary key (student_id, practical_id),
    foreign key (teacher_id) references teachers(user_id),
    foreign key (student_id) references students(user_id),
    foreign key (practical_id) references practicals(lesson_id)
);


# -- может быть несколько видео к уроку M*1
# drop table if exists videos;
# create table videos(
#     id serial,
#     lesson_id bigint unsigned not null,
#     content varchar(1024) comment 'ссылка на видео',
#     foreign key (lesson_id) references lessons(id)
# ) comment 'видеоуроки';
#
#
# -- может быть несколько текстовых файлов к уроку M*1
# drop table if exists documents;
# create table documents(
#     id serial,
#     lesson_id bigint unsigned not null,
#     content varchar(1024) comment 'ссылка на методички',
#     foreign key (lesson_id) references lessons(id)
# ) comment 'методички';
#
#
# -- просмотренные студентом видео курсов:
# drop table if exists students_videos;
# create table students_videos(
#     student_id bigint unsigned not null,
#     video_id bigint unsigned not null,
#     is_watched bit comment 'просмотрено ли видео', -- убрать вообще
#     primary key (student_id, video_id),
#     foreign key (student_id) references students(user_id),
#     foreign key (video_id) references videos(id)
# );

drop table if exists messages;
create table messages(
    from_id bigint unsigned not null,
    to_id bigint unsigned not null,
    content text,
    date datetime default now(),
    foreign key (from_id) references users(id),
    foreign key (to_id) references users(id)
) comment 'сообщения';


drop table if exists reviews;
create table reviews(
    to_course bigint unsigned not null,
    from_student bigint unsigned not null,
    content text,
    primary key (to_course, from_student),
    foreign key (to_course) references courses(id),
    foreign key (from_student) references students(user_id)
) comment 'отзывы на курс';


# студент оценивает разных преподов и у препода оценки разных студентов:
drop table if exists teacher_ratings;
create table teacher_ratings(
    to_teacher bigint unsigned not null,
    from_student bigint unsigned not null,
    rating tinyint(1) unsigned not null,
    primary key (to_teacher, from_student),
    foreign key (to_teacher) references teachers(user_id),
    foreign key (from_student) references students(user_id)
) comment 'оценка преподавателю';


# студент оценивает разных наставников и у наставников оценки разных студентов:
drop table if exists mentor_ratings;
create table mentor_ratings(
    to_mentor bigint unsigned not null,
    from_student bigint unsigned not null,
    rating tinyint(1) unsigned not null,
    primary key (to_mentor, from_student),
    foreign key (to_mentor) references students(user_id),
    foreign key (from_student) references students(user_id)
) comment 'оценка наставнику';


