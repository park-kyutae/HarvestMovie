create table MOVIE_INFO
(
    MV_NUM         NUMBER        not null
        constraint MOVIE_INFO_PK
            primary key,
    MV_TITLE       VARCHAR2(270) not null,
    MV_MAIN_PIC    VARCHAR2(100) not null,
    MV_POSTER      VARCHAR2(100) not null,
    MV_LAUNCH_DATE DATE          not null,
    MV_LOCATION    VARCHAR2(30)  not null
)
    /

create table MOVIE_DETAIL
(
    MV_NUM         NUMBER       not null
        constraint MOVIE_DETAIL_PK
            primary key
        constraint MOVIE_DETAIL_MOVIE_INFO__FK
            references MOVIE_INFO,
    MV_GENRE       VARCHAR2(30) not null,
    MV_RUNNINGTIME VARCHAR2(30),
    MV_LIMIT_AGE   NUMBER,
    MV_SUMMARY     VARCHAR2(4000)
)
    /

create table MOVIE_MAIN_LIST
(
    MV_MAIN_LIST_NUM NUMBER not null
        constraint MOVIE_STAFF_PK
            primary key,
    MV_NUM           NUMBER not null
        constraint MOVIE_STAFF_MOVIE_INFO_MV_NUM_FK
            references MOVIE_INFO
)
    /

create table MOVIE_WILL_WATCH
(
    MV_WILL_WATCH_NUM NUMBER not null
        constraint MOVIE_WILL_WATCH_PK
            primary key,
    MV_NUM            NUMBER not null
        constraint MOVIE_WILL_WATCH_MOVIE_INFO_MV_NUM_FK
            references MOVIE_INFO,
    MEM_NUM           NUMBER not null
        constraint MOVIE_WILL_WATCH_MEMBER_MEM_NUM_FK
            references MEMBER,
    MV_WILL_DELETE    NUMBER
)
    /

create table REVIEW_INFO
(
    REVIEW_NUM     NUMBER         not null
        constraint REVIEW_INFO_PK
            primary key,
    MV_NUM         NUMBER         not null
        constraint REVIEW_INFO_MOVIE_INFO_MV_NUM_FK
            references MOVIE_INFO,
    MEM_NUM        NUMBER         not null
        constraint REVIEW_INFO_MEMBER_MEM_NUM_FK
            references MEMBER,
    MEM_ID         VARCHAR2(20)   not null,
    REVIEW_MESSAGE VARCHAR2(4000) not null
)
    /

create table MOVIE_PIC
(
    MV_PIC_NUM NUMBER        not null
        constraint MOVIE_PIC_PK
            primary key,
    MV_NUM     NUMBER
        constraint MOVIE_PIC_MOVIE_INFO_MV_NUM_FK
            references MOVIE_INFO,
    MV_PIC     VARCHAR2(100) not null
)
    /

create table MOVIE_RATINGS
(
    MV_RATING_NUM NUMBER not null
        constraint MOVIE_RATINGS_PK
            primary key,
    MV_NUM        NUMBER not null
        constraint MOVIE_RATINGS_MOVIE_INFO_MV_NUM_FK
            references MOVIE_INFO,
    MEM_NUM       NUMBER not null
        constraint MOVIE_RATINGS_MEMBER_MEM_NUM_FK
            references MEMBER,
    MV_RATING     NUMBER not null
)
    /

create table MOVIE_TRAILER
(
    MV_TRAILER_NUM NUMBER        not null
        constraint MOVIE_TRAILER_PK
            primary key,
    MV_NUM         NUMBER        not null
        constraint MOVIE_TRAILER_MOVIE_INFO_MV_NUM_FK
            references MOVIE_INFO,
    MV_TRAILER     VARCHAR2(100) not null
)
    /

create table MOVIE_STAFF_LIST
(
    MV_STAFF_NUM  NUMBER       not null
        constraint MOVIE_STAFF_LIST_PK
            primary key,
    MV_NUM        NUMBER
        constraint MOVIE_STAFF_LIST_MOVIE_INFO_MV_NUM_FK
            references MOVIE_INFO,
    MV_STAFF_NAME VARCHAR2(60) not null,
    MV_STAFF_JOB  NUMBER       not null
)
    /

