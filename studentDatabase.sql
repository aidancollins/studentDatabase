--drop tables if they exist--
drop table if exists students cascade;
drop table if exists course_offerings cascade;
drop table if exists courses cascade;
drop table if exists enrollment cascade;
drop table if exists prerequisites cascade;
drop table if exists courses_offerings cascade;

--create students table--
create table students (
	student_id varchar(10) primary key, 
	student_name varchar(255),
	check(length(student_name) > 0)
	--check(length(student_id) = 9)
	);

--create table course offerings--
create table course_offerings (
	course_code varchar(10),
	course_name varchar(128),
	term_code integer,
	max_capacity integer,
	instructor varchar(255),
	prerequisites varchar (10),
	primary key(course_code, term_code),
	check(length(course_name) >= 1),
	check(max_capacity >=0)
	);

create table courses (
	course_code varchar(10) primary key,
	course_name varchar(128),
	term_code integer
	--primary key (course_code, term_code)
	);

create table enrollment (
	course_code varchar(10),
	term_code integer,
	course_name varchar(128),
	student_id varchar(9),
	grade integer,
	primary key (course_code, term_code),
	foreign key (course_code, term_code) references course_offerings(course_code, term_code),
	foreign key (student_id) references students(student_id)
	);

create table prerequisites(
	course_code varchar(10),
	prereq varchar(10),
	primary key (course_code, prereq),
	foreign key (course_code) references courses(course_code)
	);
