create table member(
 mem_num number(20) not null,
 id varchar2(10) unique not null,
 auth number(1) default 2 not null, 
 constraint member_pk primary key (mem_num)
);

create table member_detail(
 mem_num number not null,
 mem_name varchar2(30) not null,
 mem_pw varchar2(12) not null,
 mem_email varchar2(50) not null,
 mem_zipcode varchar2(7) not null,
 mem_addr1 varchar2(100) not null,
 mem_addr2 varchar2(50) not null,
 mem_photo varchar2(150),
 mem_reg_date date default sysdate not null,
 mem_modify_date date,
 constraint member_detail_pk primary key (mem_num),
 constraint member_detail_fk foreign key (mem_num) references member (mem_num)
);
create sequence member_seq;
