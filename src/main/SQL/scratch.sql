create table roles
(
    Id int auto_increment
        primary key,
    Name char(30) not null
);
create table halls
(
    Id int auto_increment
        primary key,
    Name char(100) not null,
    Address char(100) not null,
    Info char(200) null,
    PhotoPath char(200) null,
    TimeOpen time null,
    TimeClose time null
);
create table services
(
    Id int auto_increment
        primary key,
    Title char(50) not null,
    Info char(200) null,
    Price decimal not null,
    PhotoPath char(100) null
);
create table users
(
    id               int auto_increment
        primary key,
    RoleId           int default 3 null,
    FName            char(30)      not null,
    LName            char(30)      not null,
    Phone            char(15)      not null,
    Email            char(30)      null,
    Info             char(30)      null,
    DateRegistration date          null,
    DateOfBirth      date          null,
    PhotoPath        char(100)     null,
    PasswordHash     char(100)     not null,
    constraint users_roles_id_fk
        foreign key (RoleId) references roles (Id)
);
create table lessons
(
    Id int auto_increment
        primary key,
    HallId int not null,
    TrainerId int not null,
    Quantity int not null,
    DateTimeOfLesson datetime not null,
    Duration time null,
    Info char(200) null,
    Price decimal not null,
    constraint lessons_halls_id_fk
        foreign key (HallId) references laba.halls (Id),
    constraint lessons_users_id_fk
        foreign key (TrainerId) references laba.users (id)
);

create table orders
(
    Id int auto_increment
        primary key,
    UserId int not null,
    ServiceId int not null,
    DateTimeOfOrder datetime null,
    Paid decimal not null,
    constraint orders_services_id_fk
        foreign key (ServiceId) references laba.services (Id),
    constraint orders_users_id_fk
        foreign key (UserId) references laba.users (id)
);

create table records
(
    Id int auto_increment
        primary key,
    LessonId int not null,
    UserId int not null,
    Paid decimal not null,
    DateTimeOfBooked datetime null,
    Comment char(200) null,
    constraint records_lessons_id_fk
        foreign key (LessonId) references laba.lessons (Id),
    constraint records_users_id_fk
        foreign key (UserId) references laba.users (id)
);

