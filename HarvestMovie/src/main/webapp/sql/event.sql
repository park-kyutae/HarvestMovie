--게시판
create table event(
 event_board_num number not null,
 event_title varchar2(150) not null,
 event_content clob not null,
 event_hit number(5) default 0 not null,
 event_reg_date date default sysdate not null,
 event_modify_date date,
 event_filename varchar2(150),
 event_ip varchar2(40) not null,
 mem_num number not null,
 constraint event_pk primary key (event_board_num),
 constraint event_fk foreign key (mem_num) 
                             references member (mem_num)
);

create sequence event_seq;

--게시판 좋아요
create table event_fav(
 event_fav_num number not null,
 event_board_num number not null,
 mem_num number not null,
 constraint event_fav_pk primary key(event_fav_num),
 constraint event_fav_fk1 foreign key (event_board_num) references event (event_board_num),
 constraint event_fav_fk2 foreign key (mem_num) references member (mem_num)
);

create sequence eventfav_seq;

--게시판 댓글
create table event_reply(
 event_re_num number not null,
 event_re_content varchar2(900) not null,
 event_re_date date default sysdate not null,
 event_re_modifydate date,
 event_re_ip varchar2(40) not null,
 event_board_num number not null,
 mem_num number not null,
 constraint ereply_pk primary key (event_re_num),
 constraint ereply_fk foreign key (event_board_num) references event (event_board_num),
 constraint ereply_fk2 foreign key (mem_num) references member (mem_num)
);

create sequence ereply_seq;


