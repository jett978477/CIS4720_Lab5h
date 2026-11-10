create database college_db;
use college_db;

create table if not exists student(
    s_id int auto_increment primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    score float(5,2)
);

insert into student value(null, "Leyla", "Garciz", 42);
insert into student value(null, "David", "Freitas", 99);
insert into student value(null, "Eli", "Jarvis", 75);



select * from student;


-- alter table student add grade char(1);
-- insert into student value(null, "Martin", "Fernandez", 81, null);

create procedure if not exists update_student_grade(in p_id int)
begin 
    update student
    set grade = case
        when score >= 90 then 'A'
        when score >= 80 then 'B'
        when score >= 70 then 'C'
        when score >= 60 then 'D'
        else 'F'
    end
    where s_id = p_id;
end;

call update_student_grade(2);
select * from student;
