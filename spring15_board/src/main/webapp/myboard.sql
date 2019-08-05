drop table myboard;
drop sequence myboard_seq;
create table myboard
(
	num number(7) primary key,
	writer varchar2(20),
	title varchar2(20),
	content clob,
	hit number(5),
	regdate date
);
create sequence myboard_seq; 

insert into myboard values(myboard_Seq.nextval,'test1','�׽�Ʈ1','�׽�Ʈ��1..',0,sysdate);
insert into myboard values(myboard_Seq.nextval,'test2','�׽�Ʈ2','�׽�Ʈ��2..',0,sysdate);
commit;