
    create table academic_records (
        academic_record_id  serial not null,
        gpa float8 not null,
        gre_score int4,
        toefl_score int4,
        transcript varchar(255),
        academic_record_student_id int4,
        primary key (academic_record_id)
    );

    create table additional_fields (
        additional_field_id  serial not null,
        name varchar(255),
        required boolean not null,
        type varchar(255),
        primary key (additional_field_id)
    );

    create table additional_fields_departments (
        additional_fields_additional_field_id int4 not null,
        dept_dept_id int4 not null
    );

    create table additional_fields_values (
        additional_fields_values_id  serial not null,
        value varchar(255),
        additional_field_id int4,
        application_id int4,
        primary key (additional_fields_values_id)
    );

    create table application_status (
        application_id  serial not null,
        application_status varchar(255),
        primary key (application_id)
    );

    create table applications (
        application_id  serial not null,
        comments_if_any varchar(255),
        time_changed timestamp,
        application_program_id int4,
        application_status int4,
        application_student_id int4,
        application_term_id int4,
        primary key (application_id)
    );

    create table departments (
        dept_id  serial not null,
        dept_name varchar(255),
        primary key (dept_id)
    );

    create table education_college (
        education_college_id  serial not null,
        education_college_degree_end_date timestamp,
        education_college_name int4,
        education_college_degree_start_date timestamp,
        education_degree_earned varchar(255),
        education_field_of_the_degree varchar(255),
        education_student_id int4,
        primary key (education_college_id)
    );

    create table programs (
        program_id  serial not null,
        program_name varchar(255),
        program_dept_id int4,
        primary key (program_id)
    );

    create table students (
        student_id  serial not null,
        cin varchar(255),
        citizenship varchar(255),
        dob timestamp,
        email varchar(255),
        phone varchar(255),
        user_user_id int4,
        primary key (student_id)
    );

    create table terms (
        term_id  serial not null,
        term_name varchar(255),
        primary key (term_id)
    );

    create table user_role (
        role_id  serial not null,
        role_name varchar(255),
        primary key (role_id)
    );

    create table users (
        user_id  serial not null,
        email_id varchar(255),
        first_name varchar(255),
        last_name varchar(255),
        password varchar(255),
        role_id int4,
        primary key (user_id)
    );

    alter table academic_records 
        add constraint FK_krq2ieq44abe067rdf3i86dx5 
        foreign key (academic_record_student_id) 
        references students;

    alter table additional_fields_departments 
        add constraint FK_jbli083418t3aagtcvmle7dl4 
        foreign key (dept_dept_id) 
        references departments;

    alter table additional_fields_departments 
        add constraint FK_by3aiqgbm76rkwcqlxq28lxap 
        foreign key (additional_fields_additional_field_id) 
        references additional_fields;

    alter table additional_fields_values 
        add constraint FK_hw49gv7he9apu8y8vnpbjrq78 
        foreign key (additional_field_id) 
        references additional_fields;

    alter table additional_fields_values 
        add constraint FK_f2flpfrhw6uyxau7dm7o3xf63 
        foreign key (application_id) 
        references applications;

    alter table applications 
        add constraint FK_f2og0y9imxld4jety25rw8p4x 
        foreign key (application_program_id) 
        references programs;

    alter table applications 
        add constraint FK_5dgfhpy7fkde1wwk7lujtfq8y 
        foreign key (application_status) 
        references application_status;

    alter table applications 
        add constraint FK_l07y9xvje4ndlvyeva3ls8gnc 
        foreign key (application_student_id) 
        references students;

    alter table applications 
        add constraint FK_h536jkr4c1fnaus2sewld3giq 
        foreign key (application_term_id) 
        references terms;

    alter table education_college 
        add constraint FK_dfyicjiyljjyt1hjxrm4yc6fj 
        foreign key (education_student_id) 
        references students;

    alter table programs 
        add constraint FK_5q2e2pm9pbu4j63clwaaa6ex7 
        foreign key (program_dept_id) 
        references departments;

    alter table students 
        add constraint FK_mxpwo4l2kfhpduw0qdfj6s0e5 
        foreign key (user_user_id) 
        references users;

    alter table users 
        add constraint FK_krvotbtiqhudlkamvlpaqus0t 
        foreign key (role_id) 
        references user_role;
insert into user_role(role_name) values('admin');
insert into user_role(role_name) values('staff');
insert into user_role(role_name) values('student');


insert into users(email_id,first_name,last_name,password,role_id) values('admin@localhost.localdomain','admin','admin','abcd',1);
insert into users(email_id,first_name,last_name,password,role_id) values('staff1@localhost.localdomain','staff1','staff1','abcd',2);
insert into users(email_id,first_name,last_name,password,role_id) values('staff2@localhost.localdomain','staff2','staff2','abcd',2);
insert into users(email_id,first_name,last_name,password,role_id) values('student1@localhost.localdomain','student1','student1','abcd',3);
insert into users(email_id,first_name,last_name,password,role_id) values('student2@localhost.localdomain','student2','student2','abcd',3);

insert into departments(dept_name) values('Accounting Department');
insert into departments(dept_name) values('Computer Science');

insert into programs(program_name,program_dept_id) values('MS in Accounting',1);
insert into programs(program_name,program_dept_id) values('MS in Computer Science',2);

insert into additional_fields(name,required,type) values('GMAT',true,'string');

insert into additional_fields_departments values(1,1);

insert into terms(term_name) values('Fall 2016');


insert into students(cin,citizenship,dob,email,phone,user_user_id) values('305053962','Indian','1993-05-24','kbhanus2@calstatela.edu','6264648201',4);


insert into applications(application_program_id,application_student_id,application_term_id) values(1,1,1);