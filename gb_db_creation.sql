drop database if exists geekbrains_db;
create database geekbrains_db;
use geekbrains_db;


drop table if exists users;
create table users(
    id serial primary key,
    firstname varchar(50),
    lastname varchar(50),
    phone bigint unsigned not null unique,
    email varchar(50) unique,
    gender enum('male', 'female', 'other'),
    country varchar(50),
    city varchar(50),
    birth_date date,
    interests varchar(1000),
    password_hash varchar(200),
    photo varchar(1024)
) comment 'пользователи';


drop table if exists directions;
create table directions(
    id int unsigned unique not null auto_increment,
    name varchar(255)
) comment 'направления обучения';


drop table if exists specializations;
create table specializations(
    id int unsigned unique not null auto_increment,
    name varchar(255)
) comment 'специализации';


# у каждого направления  мб несколько специализаций и наоборот:
drop table if exists specializations_directions;
create table specializations_directions(
    special_id int unsigned  not null,
    direction_id int unsigned not null,
    primary key (special_id, direction_id),
    foreign key (special_id) references specializations(id),
    foreign key (direction_id) references directions(id)
);


drop table if exists programms;
create table programms(
    id int unsigned not null unique auto_increment,
    logo varchar(1024),
    title varchar(100) unique,
    direction_id int unsigned not null,
    level_prog enum('Intern', 'junior', 'middle', 'middle+'),
    special_id int unsigned not null,
    is_employment bit,
    descriptions text,
    salary_at_start int unsigned not null,
    road_map varchar(1024),
    start_date date,
    duration varchar(100),
    price decimal(11,2),
    foreign key (direction_id) references directions(id),
    foreign key (special_id) references specializations(id)
) comment 'программы обучения';


drop table if exists discounts;
create table discounts (
    id serial primary key,
    programm_id int unsigned not null,
    discount float unsigned,
    started_at datetime,
    finished_ad datetime,
    foreign key (programm_id) references programms(id)
) comment 'скидки';


# направление может включать несколько программ и программа соотв нескольким направлениям
drop table if exists directions_programms;
create table directions_programms(
    direction_id int unsigned not null,
    programm_id int unsigned not null,
    primary key (direction_id, programm_id),
    foreign key (direction_id) references directions(id),
    foreign key (programm_id) references programms(id)
);


drop table if exists technologies;
create table technologies(
    id serial,
    name varchar(255)
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
    name varchar(255),
    programm_id int unsigned not null,
    foreign key (programm_id) references programms(id)
) comment 'учебная группа';


# студент это юзер:
drop table if exists students;
create table students(
    user_id bigint unsigned not null primary key,
    group_id bigint unsigned not null,
    aboutme varchar(200),
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


drop table if exists course_names;
create table  course_names(
    id serial primary key,
    title varchar(100),
    count_lessons tinyint(2)
) comment 'наименования курсов';


# конкретный курс
drop table if exists courses;
create table  courses(
    id serial primary key,
    course_name_id bigint unsigned not null,
    teacher_id bigint unsigned not null,
    group_id bigint unsigned not null,
    start_date datetime,
    type enum('required', 'optional'),
    is_active bit,
    foreign key (course_name_id) references course_names(id),
    foreign key (teacher_id) references teachers(user_id),
    foreign key (group_id) references edu_groups(id)
) comment 'курсы программы';


-- у программы много наименований курсов и наоборот:
drop table if exists programms_course_names;
create table programms_course_names(
    programm_id int unsigned not null,
    course_name_id bigint unsigned not null,
    primary key (programm_id, course_name_id),
    foreign key (programm_id) references programms(id),
    foreign key (course_name_id) references course_names(id)
);


-- у препода много наименований курсов и наоборот(то что знает):
drop table if exists course_names_teachers;
create table course_names_teachers(
    course_name_id bigint unsigned not null,
    teacher_id bigint unsigned not null,
    primary key (course_name_id, teacher_id),
    foreign key (course_name_id) references course_names(id),
    foreign key (teacher_id) references teachers(user_id)
);


# у студента много курсов и наоборот:+
drop table if exists courses_students;
create table courses_students(
    student_id bigint unsigned not null,
    course_id bigint unsigned not null,
    is_certificated bit,
    scores int comment 'баллы',
    primary key (student_id, course_id),
    foreign key (student_id) references students(user_id),
    foreign key (course_id) references courses(id)

);


# у наставника много наименований курсов и наоборот:
drop table if exists course_names_mentors;
create table course_names_mentors(
    course_id bigint unsigned not null,
    mentor_id bigint unsigned not null,
    primary key (course_id, mentor_id),
    foreign key (course_id) references course_names(id),
    foreign key (mentor_id) references students(user_id)
);


# у наставника много курсов и у курса мб несколько наставников:
drop table if exists courses_mentors;
create table courses_mentors(
    course_id bigint unsigned not null,
    mentor_id bigint unsigned not null,
    primary key (course_id, mentor_id),
    foreign key (course_id) references courses(id),
    foreign key (mentor_id) references students(user_id)
);


drop table if exists reviews;
create table reviews(
    to_course bigint unsigned not null,
    from_student bigint unsigned not null,
    content text,
    primary key (to_course, from_student),
    foreign key (to_course) references courses(id),
    foreign key (from_student) references students(user_id)
) comment 'отзывы на курс';


drop table if exists lessons;
create table lessons(
    id serial primary key,
    number tinyint(2) unsigned not null,
    course_id bigint unsigned not null,
    title varchar(200),
    start_time datetime,
    comments varchar(255),
    foreign key (course_id) references courses(id)
) comment 'уроки курса';


-- одно практическое задание к уроку 1*1
drop table if exists practicals;
create table practicals(
    lesson_id bigint unsigned not null,
    must_complete_to datetime,
    content text,
    foreign key (lesson_id) references lessons(id)
) comment 'практическое задание';


-- может быть несколько видео к уроку M*1
drop table if exists videos;
create table videos(
    id serial,
    lesson_id bigint unsigned not null,
    content varchar(1024) comment 'ссылка на видео',
    foreign key (lesson_id) references lessons(id)
) comment 'видеоуроки';


-- может быть несколько текстовых файлов к уроку M*1
drop table if exists documents;
create table documents(
    id serial,
    lesson_id bigint unsigned not null,
    content varchar(1024) comment 'ссылка на методички',
    foreign key (lesson_id) references lessons(id)
) comment 'методички';


-- препод проверяет много заданий у многих студентов M*M
drop table if exists teachers_practicals;
create table teachers_practicals(
    teacher_id bigint unsigned not null,
    student_id bigint unsigned not null,
    practical_id bigint unsigned not null,
    rating tinyint(1) comment 'оценка',
    primary key (teacher_id, student_id, practical_id),
    foreign key (teacher_id) references teachers(user_id),
    foreign key (student_id) references students(user_id),
    foreign key (practical_id) references practicals(lesson_id)
);


-- много практич заданий у студента и наоборот M*M
drop table if exists students_practicals;
create table students_practicals(
    student_id bigint unsigned not null,
    practical_id bigint unsigned not null,
    is_completed bit comment 'выполнено ли задание',
    primary key (student_id, practical_id),
    foreign key (student_id) references students(user_id),
    foreign key (practical_id) references practicals(lesson_id)
);


drop table if exists students_videos;
create table students_videos(
    student_id bigint unsigned not null,
    video_id bigint unsigned not null,
    is_watched bit comment 'просмотрено ли видео',
    primary key (student_id, video_id),
    foreign key (student_id) references students(user_id),
    foreign key (video_id) references videos(id)
);


drop table if exists schedule;
create table schedule(
    id serial,
    date datetime,
    teacher_id bigint unsigned not null,
    group_id bigint unsigned not null,
    lesson_id bigint unsigned not null,
    foreign key (teacher_id) references teachers(user_id),
    foreign key (group_id) references edu_groups(id),
    foreign key (lesson_id) references lessons(id)
) comment 'расписание';


drop table if exists messages;
create table messages(
    from_id bigint unsigned not null,
    to_id bigint unsigned not null,
    content text,
    foreign key (from_id) references users(id),
    foreign key (to_id) references users(id)
) comment 'сообщения';

