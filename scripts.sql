use geekbrains_db;

select firstname, lastname from users where id in (select user_id from teachers);

select * from teachers where user_id in (select user_id from students )