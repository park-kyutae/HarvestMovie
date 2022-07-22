--영화 뉴스 게시판
create table news(
 news_num number not null,
 news_title varchar2(150) not null,
 news_content clob not null,
 news_hit number(5) default 0 not null,
 news_date date default sysdate not null,
 news_modifydate date,
 news_photo varchar2(300),
 mem_num number not null,
 constraint news_pk primary key (news_num),
 constraint member_fk foreign key (mem_num) 
                             references member (mem_num)
);

create sequence news_seq;

