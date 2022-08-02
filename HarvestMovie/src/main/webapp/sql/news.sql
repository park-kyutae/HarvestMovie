create table news_reply(
  news_re_num number not null,
  news_re_content varchar2(900) not null,
  news_re_date date default sysdate not null,
  news_re_modifydate date,
  news_num number not null,
  mem_num number not null,
  constraint nreply_pk primary key (news_re_num),
  constraint nreply_fk foreign key (news_num)
                          references news (news_num),
  constraint nreply_fk2 foreign key (mem_num) 
                          references member (mem_num)
);

create sequence news_reply_seq;

create sequence news_fav_seq;