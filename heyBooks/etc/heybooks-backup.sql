

/* Drop Tables */

DROP TABLE Counsel_reply CASCADE CONSTRAINTS;
DROP TABLE Event CASCADE CONSTRAINTS;
DROP TABLE Notice CASCADE CONSTRAINTS;
DROP TABLE Push CASCADE CONSTRAINTS;
DROP TABLE Admins CASCADE CONSTRAINTS;
DROP TABLE Cart_item CASCADE CONSTRAINTS;
DROP TABLE Counsel CASCADE CONSTRAINTS;
DROP TABLE New_item_notice CASCADE CONSTRAINTS;
DROP TABLE Review CASCADE CONSTRAINTS;
DROP TABLE Order_items CASCADE CONSTRAINTS;
DROP TABLE Today_view CASCADE CONSTRAINTS;
DROP TABLE Wishlist CASCADE CONSTRAINTS;
DROP TABLE Products CASCADE CONSTRAINTS;
DROP TABLE Editor CASCADE CONSTRAINTS;
DROP TABLE Mileage CASCADE CONSTRAINTS;
DROP TABLE Orders CASCADE CONSTRAINTS;
DROP TABLE Members CASCADE CONSTRAINTS;
DROP TABLE Product_category CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE Admins
(
	admin_num number NOT NULL,
	admin_id varchar2(30),
	admin_password varchar2(40),
	admin_date date NOT NULL,
	PRIMARY KEY (admin_num)
);


CREATE TABLE Cart_item
(
	cart_item_num number NOT NULL,
	members_num number NOT NULL,
	product_num number NOT NULL,
	cart_item_quantity number NOT NULL,
	cart_item_date date NOT NULL,
	PRIMARY KEY (cart_item_num)
);


CREATE TABLE Counsel
(
	counsel_num number NOT NULL,
	members_num number NOT NULL,
	counsel_type varchar2(50) NOT NULL,
	counsel_title varchar2(150) NOT NULL,
	counsel_content varchar2(400) NOT NULL,
	counsel_answer varchar2(20) NOT NULL,
	counsel_date date NOT NULL,
	PRIMARY KEY (counsel_num)
);


CREATE TABLE Counsel_reply
(
	counsel_reply_num number NOT NULL,
	counsel_num number NOT NULL,
	admin_num number NOT NULL,
	counsel_reply_content varchar2(1000) NOT NULL,
	counsel_reply_date date NOT NULL,
	PRIMARY KEY (counsel_reply_num)
);


CREATE TABLE Editor
(
	editor_num number NOT NULL,
	editor_name varchar2(100) NOT NULL,
	editor_birth varchar2(100),
	editor_nation varchar2(100) NOT NULL,
	editor_introduce varchar2(1000),
	editor_school varchar2(800),
	editor_award varchar2(1000),
	editor_date date NOT NULL,
	PRIMARY KEY (editor_num)
);


CREATE TABLE Event
(
	event_num number NOT NULL,
	admin_num number NOT NULL,
	event_title varchar2(200) NOT NULL,
	event_content clob NOT NULL,
	event_period date,
	event_thumbnail varchar2(200),
	event_hit number NOT NULL,
	event_date date NOT NULL,
	PRIMARY KEY (event_num)
);


CREATE TABLE Members
(
	members_num number NOT NULL,
	members_id varchar2(30) NOT NULL UNIQUE,
	members_password varchar2(200) NOT NULL,
	members_name varchar2(20) NOT NULL,
	members_years varchar2(50) NOT NULL,
	members_phone_number varchar2(50) NOT NULL,
	members_email varchar2(100) NOT NULL UNIQUE,
	members_gender varchar2(8) NOT NULL,
	members_post varchar2(60),
	members_address varchar2(600),
	members_detail_address varchar2(600),
	members_extra_address varchar2(200),
	members_add_number varchar2(50),
	members_job varchar2(50),
	members_favorite varchar2(200),
	members_regdate date NOT NULL,
	PRIMARY KEY (members_num)
);


CREATE TABLE Mileage
(
	mileage_num number NOT NULL,
	order_num number NOT NULL,
	members_num number NOT NULL,
	mileage_score number NOT NULL,
	mileage_total number NOT NULL,
	mileage_date date NOT NULL,
	PRIMARY KEY (mileage_num)
);


CREATE TABLE New_item_notice
(
	new_item_notice_num number NOT NULL,
	members_num number NOT NULL,
	editor_num number NOT NULL,
	New_item_notice_date date NOT NULL,
	PRIMARY KEY (new_item_notice_num)
);


CREATE TABLE Notice
(
	notice_num number NOT NULL,
	admin_num number NOT NULL,
	notice_title varchar2(150) NOT NULL,
	notice_content clob NOT NULL,
	notice_hit number,
	notice_date date NOT NULL,
	PRIMARY KEY (notice_num)
);


CREATE TABLE Orders
(
	order_num number NOT NULL,
	members_num number NOT NULL,
	total_price varchar2(200) NOT NULL,
	total_count varchar2(100),
	order_name varchar2(100) NOT NULL,
	order_phone_number varchar2(100) NOT NULL,
	order_add_number varchar2(100),
	order_post varchar2(50),
	order_address varchar2(600) NOT NULL,
	order_detail_address varchar2(600) NOT NULL,
	order_extra_address varchar2(200),
	order_message varchar2(500),
	order_shipping_charge varchar2(50) NOT NULL,
	-- 신용카드 / 무통장 입금
	payment_methods varchar2(20) NOT NULL,
	-- 1. 결제 대기
	-- 2. 결제 완료
	-- 3. 배송 준비중
	-- 4. 배송중
	-- 5. 배송 완료
	order_status number(2,0) NOT NULL,
	order_date date NOT NULL,
	PRIMARY KEY (order_num)
);


CREATE TABLE Order_items
(
	order_item_num number NOT NULL,
	product_num number NOT NULL,
	order_num number NOT NULL,
	order_item_quantity varchar2(100) NOT NULL,
	order_item_price varchar2(200) NOT NULL,
	order_item_date date NOT NULL,
	PRIMARY KEY (order_item_num)
);


CREATE TABLE Products
(
	product_num number NOT NULL,
	product_cate_num number NOT NULL,
	product_editor_num number,
	product_publish varchar2(50) NOT NULL,
	product_name varchar2(100) NOT NULL,
	product_page number(5,0) NOT NULL,
	product_discription varchar2(2000),
	product_index varchar2(1500),
	product_status varchar2(15) NOT NULL,
	product_view varchar2(10) NOT NULL,
	product_shipping_charge varchar2(100) NOT NULL,
	product_discount varchar2(20) NOT NULL,
	product_price varchar2(100) NOT NULL,
	product_discount_price varchar2(100),
	product_supplement number NOT NULL,
	product_stock  number NOT NULL,
	product_picture varchar2(1000),
	product_preview varchar2(1000),
	product_update_date date,
	product_date date NOT NULL,
	PRIMARY KEY (product_num)
);


CREATE TABLE Product_category
(
	cate_num number NOT NULL,
	cate_name varchar2(30) NOT NULL,
	cate_ref1 varchar2(20) UNIQUE,
	cate_ref2 varchar2(20),
	cate_ref3 varchar2(20),
	cate_order number,
	cate_date date NOT NULL,
	PRIMARY KEY (cate_num)
);


CREATE TABLE Push
(
	push_num number NOT NULL,
	members_num number NOT NULL,
	admin_num number NOT NULL,
	push_category varchar2(20) NOT NULL,
	push_content varchar2(600) NOT NULL,
	push_date date NOT NULL,
	PRIMARY KEY (push_num)
);


CREATE TABLE Review
(
	review_num number NOT NULL,
	order_item_num number NOT NULL,
	members_num number NOT NULL,
	review_img varchar2(200) NOT NULL,
	review_title varchar2(150) NOT NULL,
	review_content varchar2(600) NOT NULL,
	review_grade number(2,0) NOT NULL,
	review_recommend number,
	reveiw_report number,
	review_spoiler varchar2(10),
	review_date date NOT NULL,
	PRIMARY KEY (review_num)
);


CREATE TABLE Today_view
(
	Today_view_num number NOT NULL,
	members_num number NOT NULL,
	product_num number NOT NULL,
	today_view_date date NOT NULL,
	PRIMARY KEY (Today_view_num)
);


CREATE TABLE Wishlist
(
	wishlist_num number NOT NULL,
	members_num number NOT NULL,
	product_num number NOT NULL,
	wishlist_date date NOT NULL,
	PRIMARY KEY (wishlist_num)
);



/* Create Foreign Keys */

ALTER TABLE Counsel_reply
	ADD FOREIGN KEY (admin_num)
	REFERENCES Admins (admin_num)
;


ALTER TABLE Event
	ADD FOREIGN KEY (admin_num)
	REFERENCES Admins (admin_num)
;


ALTER TABLE Notice
	ADD FOREIGN KEY (admin_num)
	REFERENCES Admins (admin_num)
;


ALTER TABLE Push
	ADD FOREIGN KEY (admin_num)
	REFERENCES Admins (admin_num)
;


ALTER TABLE Counsel_reply
	ADD FOREIGN KEY (counsel_num)
	REFERENCES Counsel (counsel_num)
;


ALTER TABLE New_item_notice
	ADD FOREIGN KEY (editor_num)
	REFERENCES Editor (editor_num)
;


ALTER TABLE Products
	ADD FOREIGN KEY (product_editor_num)
	REFERENCES Editor (editor_num)
;


ALTER TABLE Cart_item
	ADD FOREIGN KEY (members_num)
	REFERENCES Members (members_num)
;


ALTER TABLE Counsel
	ADD FOREIGN KEY (members_num)
	REFERENCES Members (members_num)
;


ALTER TABLE Mileage
	ADD FOREIGN KEY (members_num)
	REFERENCES Members (members_num)
;


ALTER TABLE New_item_notice
	ADD FOREIGN KEY (members_num)
	REFERENCES Members (members_num)
;


ALTER TABLE Orders
	ADD FOREIGN KEY (members_num)
	REFERENCES Members (members_num)
;


ALTER TABLE Push
	ADD FOREIGN KEY (members_num)
	REFERENCES Members (members_num)
;


ALTER TABLE Review
	ADD FOREIGN KEY (members_num)
	REFERENCES Members (members_num)
;


ALTER TABLE Today_view
	ADD FOREIGN KEY (members_num)
	REFERENCES Members (members_num)
;


ALTER TABLE Wishlist
	ADD FOREIGN KEY (members_num)
	REFERENCES Members (members_num)
;


ALTER TABLE Mileage
	ADD FOREIGN KEY (order_num)
	REFERENCES Orders (order_num)
;


ALTER TABLE Order_items
	ADD FOREIGN KEY (order_num)
	REFERENCES Orders (order_num)
;


ALTER TABLE Review
	ADD FOREIGN KEY (order_item_num)
	REFERENCES Order_items (order_item_num)
;


ALTER TABLE Cart_item
	ADD FOREIGN KEY (product_num)
	REFERENCES Products (product_num)
;


ALTER TABLE Order_items
	ADD FOREIGN KEY (product_num)
	REFERENCES Products (product_num)
;


ALTER TABLE Today_view
	ADD FOREIGN KEY (product_num)
	REFERENCES Products (product_num)
;


ALTER TABLE Wishlist
	ADD FOREIGN KEY (product_num)
	REFERENCES Products (product_num)
;


ALTER TABLE Products
	ADD FOREIGN KEY (product_cate_num)
	REFERENCES Product_category (cate_num)
;



/* Comments */

COMMENT ON COLUMN Orders.payment_methods IS '신용카드 / 무통장 입금';
COMMENT ON COLUMN Orders.order_status IS '1. 결제 대기
2. 결제 완료
3. 배송 준비중
4. 배송중
5. 배송 완료';






insert into product_category values(1,'국내도서','100','','',0,sysdate);

insert into product_category values(2,'소설','101','100','',1,sysdate);
insert into product_category values(3,'시/에세이','102','100','',2,sysdate);
insert into product_category values(4,'경제/경영','103','100','',3,sysdate);
insert into product_category values(5,'자기계발','104','100','',4,sysdate);
insert into product_category values(6,'인문','105','100','',5,sysdate);
insert into product_category values(7,'역사/문화','106','100','',6,sysdate);
insert into product_category values(8,'종교','107','100','',7,sysdate);
insert into product_category values(9,'정치/사회','108','100','',8,sysdate);
insert into product_category values(10,'예술/대중문화','109','100','',9,sysdate);
insert into product_category values(11,'과학','110','100','',10,sysdate);
insert into product_category values(12,'기술/공학','111','100','',11,sysdate);
insert into product_category values(13,'컴퓨터/IT','112','100','',12,sysdate);
insert into product_category values(14,'어린이/청소년','113','100','',13,sysdate);
insert into product_category values(15,'교재/참고서','114','100','',14,sysdate);
insert into product_category values(16,'가정/육아','115','100','',15,sysdate);
insert into product_category values(17,'건강','116','100','',16,sysdate);
insert into product_category values(18,'여행','117','100','',17,sysdate);
insert into product_category values(19,'취미/스포츠','118','100','',18,sysdate);
insert into product_category values(20,'잡지','119','100','',19,sysdate);

-- 소설 --
insert into product_category values(50,'현대소설','150','100','101',1,sysdate);
insert into product_category values(51,'영미소설','151','100','101',2,sysdate);
insert into product_category values(52,'일본소설','152','100','101',2,sysdate);
insert into product_category values(53,'중국소설','153','100','101',3,sysdate);
insert into product_category values(54,'러시아소설','154','100','101',4,sysdate);
insert into product_category values(55,'고전/명작소설','155','100','101',5,sysdate);
insert into product_category values(56,'장르소설','156','100','101',6,sysdate);
insert into product_category values(57,'테마소설','157','100','101',7,sysdate);

-- 시/에세이 --
insert into product_category values(70,'현대시','170','100','102',1,sysdate);
insert into product_category values(71,'한시/시조/시가','171','100','102',2,sysdate);
insert into product_category values(72,'고전명작시','172','100','102',3,sysdate);
insert into product_category values(73,'영미시','173','100','102',4,sysdate);
insert into product_category values(74,'일본/중국시','174','100','102',5,sysdate);
insert into product_category values(75,'기타나라시','175','100','102',6,sysdate);
insert into product_category values(76,'감성/연애시','176','100','102',7,sysdate);
insert into product_category values(77,'문학상수상작','177','100','102',8,sysdate);

-- 경제/경영 --
insert into product_category values(90,'경영일반','190','100','103',1,sysdate);
insert into product_category values(91,'경영이론','191','100','103',2,sysdate);
insert into product_category values(92,'경제일반','192','100','103',3,sysdate);
insert into product_category values(93,'경제이론','193','100','103',4,sysdate);
insert into product_category values(94,'기업경제','194','100','103',5,sysdate);
insert into product_category values(95,'마케팅/세일즈','195','100','103',6,sysdate);
insert into product_category values(96,'유통/창업','196','100','103',7,sysdate);
insert into product_category values(97,'재태크/금융','197','100','103',8,sysdate);
insert into product_category values(98,'무역/운송','198','100','103',9,sysdate);
insert into product_category values(99,'관광/호텔','199','100','103',10,sysdate);

-- 자기계발 --
insert into product_category values(110,'성공/처세','210','100','104',1,sysdate);
insert into product_category values(111,'자기능력계발','211','100','104',2,sysdate);
insert into product_category values(112,'비지니스능력계발','214','100','104',3,sysdate);
insert into product_category values(113,'인관관계','212','100','104',4,sysdate);
insert into product_category values(114,'화술/협상','213','100','104',5,sysdate);

-- 인문 --
insert into product_category values(130,'인문학일반','230','100','105',1,sysdate);
insert into product_category values(131,'심리학','231','100','105',2,sysdate);
insert into product_category values(132,'교육학','232','100','105',3,sysdate);
insert into product_category values(133,'유아교육','233','100','105',4,sysdate);
insert into product_category values(134,'특수교육','234','100','105',5,sysdate);
insert into product_category values(135,'임용교시','235','100','105',6,sysdate);
insert into product_category values(136,'철학','236','100','105',7,sysdate);

-- 역사/문화 --
insert into product_category values(150,'역사일반','250','100','106',1,sysdate);
insert into product_category values(151,'세계사','251','100','106',2,sysdate);
insert into product_category values(152,'서양사','252','100','106',3,sysdate);
insert into product_category values(153,'동양사','253','100','106',4,sysdate);
insert into product_category values(154,'한국사','254','100','106',5,sysdate);
insert into product_category values(155,'신화','255','100','106',6,sysdate);
insert into product_category values(156,'민속학','256','100','106',7,sysdate);
insert into product_category values(157,'문화일반','257','100','106',8,sysdate);
insert into product_category values(158,'문화사','258','100','106',9,sysdate);

-- 종교 --
insert into product_category values(170,'종교일반','270','100','107',1,sysdate);
insert into product_category values(171,'기독교','271','100','107',2,sysdate);
insert into product_category values(172,'가톨릭','272','100','107',3,sysdate);
insert into product_category values(173,'불교','273','100','107',4,sysdate);
insert into product_category values(174,'그외종교','274','100','107',5,sysdate);


-- 정치/사회 --
insert into product_category values(190,'정치/외교','290','100','108',1,sysdate);
insert into product_category values(191,'행정/정책','291','100','108',2,sysdate);
insert into product_category values(192,'국방/군사','292','100','108',3,sysdate);
insert into product_category values(193,'법학','293','100','108',4,sysdate);
insert into product_category values(194,'사회학','294','100','108',5,sysdate);
insert into product_category values(195,'사회복지','295','100','108',6,sysdate);
insert into product_category values(196,'언론/신문/방송','296','100','108',7,sysdate);
insert into product_category values(197,'정치/사회문고','297','100','108',8,sysdate);
insert into product_category values(198,'대학교재','298','100','108',9,sysdate);

-- 예술/대중문화 --
insert into product_category values(210,'예술일반','310','100','109',1,sysdate);
insert into product_category values(211,'미술','311','100','109',2,sysdate);
insert into product_category values(212,'만화/애니메이션','312','100','109',3,sysdate);
insert into product_category values(213,'디자인/색채','313','100','109',4,sysdate);
insert into product_category values(214,'패션/의류','314','100','109',5,sysdate);
insert into product_category values(215,'음악','315','100','109',6,sysdate);
insert into product_category values(216,'사진/영상','316','100','109',7,sysdate);
insert into product_category values(217,'연극','317','100','109',8,sysdate);
insert into product_category values(218,'영화','318','100','109',9,sysdate);

-- 과학 --
insert into product_category values(230,'과학이론','330','100','110',1,sysdate);
insert into product_category values(231,'도감','331','100','110',2,sysdate);
insert into product_category values(232,'교양과학','332','100','110',3,sysdate);
insert into product_category values(233,'수학','333','100','110',4,sysdate);
insert into product_category values(234,'물리학','334','100','110',5,sysdate);
insert into product_category values(235,'화학','335','100','110',6,sysdate);
insert into product_category values(236,'생물학','336','100','110',7,sysdate);
insert into product_category values(237,'천문학','337','100','110',8,sysdate);
insert into product_category values(238,'과학문고','338','100','110',9,sysdate);

-- 기술/공학 --
insert into product_category values(250,'건축/인테리어','350','100','111',1,sysdate);
insert into product_category values(251,'토목/건설','351','100','111',2,sysdate);
insert into product_category values(252,'환경/도시/조경','352','100','111',3,sysdate);
insert into product_category values(253,'자동차/조경','353','100','111',4,sysdate);
insert into product_category values(254,'운전면허','354','100','111',5,sysdate);
insert into product_category values(255,'공학일반','355','100','111',6,sysdate);
insert into product_category values(256,'금속/재료','356','100','111',7,sysdate);
insert into product_category values(257,'기계/역학/항공','357','100','111',8,sysdate);
insert into product_category values(258,'전기/전자','358','100','111',9,sysdate);
insert into product_category values(259,'농수산/축산','359','100','111',10,sysdate);
insert into product_category values(260,'생활과학','360','100','111',11,sysdate);
insert into product_category values(261,'의학','361','100','111',12,sysdate);

-- 컴퓨터/IT --
insert into product_category values(270,'컴퓨터공학','370','100','112',1,sysdate);
insert into product_category values(271,'IT일반','371','100','112',2,sysdate);
insert into product_category values(272,'컴퓨터입문/활용','372','100','112',3,sysdate);
insert into product_category values(273,'전산통계/해석','373','100','112',4,sysdate);
insert into product_category values(274,'OS','374','100','112',5,sysdate);
insert into product_category values(275,'네트워크','375','100','112',6,sysdate);
insert into product_category values(276,'보안/해킹','376','100','112',7,sysdate);
insert into product_category values(277,'데이터베이스','377','100','112',8,sysdate);
insert into product_category values(278,'개발방법론','378','100','112',9,sysdate);
insert into product_category values(279,'게임','379','100','112',10,sysdate);
insert into product_category values(280,'웹프로그래밍','380','100','112',11,sysdate);
insert into product_category values(281,'프로그래밍/언어','381','100','112',12,sysdate);
insert into product_category values(282,'모바일프로그래밍','382','100','112',13,sysdate);
insert into product_category values(283,'그래픽','383','100','112',14,sysdate);
insert into product_category values(284,'멀티미디어','384','100','112',15,sysdate);

-- 어린이/청소년 --
insert into product_category values(290,'어린이문학','390','100','113',1,sysdate);
insert into product_category values(291,'어린이교양','391','100','113',2,sysdate);
insert into product_category values(292,'어린이만화','392','100','113',3,sysdate);
insert into product_category values(293,'진로','393','100','113',4,sysdate);
insert into product_category values(294,'청소년 에세이','394','100','113',5,sysdate);
insert into product_category values(295,'청소년 시','395','100','113',6,sysdate);
insert into product_category values(296,'청소년 철학','396','100','113',7,sysdate);
insert into product_category values(297,'청소년 역사','397','100','113',8,sysdate);


-- 교재/참고서 --
insert into product_category values(310,'EBS 중학','410','100','114',1,sysdate);
insert into product_category values(311,'EBS 고등','411','100','114',2,sysdate);
insert into product_category values(312,'영어/수학','412','100','114',3,sysdate);
insert into product_category values(313,'한자','413','100','114',4,sysdate);
insert into product_category values(314,'검정고시','414','100','114',5,sysdate);
insert into product_category values(315,'공부방법/진학','415','100','114',6,sysdate);
insert into product_category values(316,'논술/면접','416','100','114',7,sysdate);
insert into product_category values(317,'특목고대비','417','100','114',8,sysdate);


-- 가정/육아 --
insert into product_category values(330,'결혼/가정','430','100','115',1,sysdate);
insert into product_category values(331,'임신/출산','431','100','115',2,sysdate);
insert into product_category values(332,'육아','432','100','115',3,sysdate);
insert into product_category values(333,'자녀교육','433','100','115',4,sysdate);
insert into product_category values(334,'살림의지혜','434','100','115',5,sysdate);
insert into product_category values(335,'홈인테리어','435','100','115',6,sysdate);


-- 건강 --
insert into product_category values(350,'건강일반','450','100','116',1,sysdate);
insert into product_category values(351,'뇌건강','451','100','116',2,sysdate);
insert into product_category values(352,'한방치료','452','100','116',3,sysdate);
insert into product_category values(353,'자연건강','453','100','116',4,sysdate);
insert into product_category values(354,'건강식사','454','100','116',5,sysdate);
insert into product_category values(355,'질병치료/예방','455','100','116',6,sysdate);
insert into product_category values(356,'다이어트','456','100','116',7,sysdate);
insert into product_category values(357,'운동/트레이닝','457','100','116',8,sysdate);
insert into product_category values(358,'피부/메이크업','458','100','116',9,sysdate);
insert into product_category values(359,'건강문고','459','100','116',10,sysdate);


-- 여행 --
insert into product_category values(370,'국내여행','470','100','117',1,sysdate);
insert into product_category values(371,'해외여행','471','100','117',2,sysdate);
insert into product_category values(372,'여행에세이','472','100','117',3,sysdate);
insert into product_category values(373,'테마여행','473','100','117',4,sysdate);
insert into product_category values(374,'인기지역','474','100','117',5,sysdate);
insert into product_category values(375,'지도','475','100','117',6,sysdate);


-- 취미/스포츠 --
insert into product_category values(390,'가정원예','490','100','118',1,sysdate);
insert into product_category values(391,'인테리어/수납','491','100','118',2,sysdate);
insert into product_category values(392,'생활공예/DIY','492','100','118',3,sysdate);
insert into product_category values(393,'살림의지혜','493','100','118',4,sysdate);
insert into product_category values(394,'애완동물','494','100','118',5,sysdate);
insert into product_category values(395,'등산/낚시','495','100','118',6,sysdate);
insert into product_category values(396,'바둑','496','100','118',7,sysdate);
insert into product_category values(397,'골프','497','100','118',8,sysdate);
insert into product_category values(398,'무술','498','100','118',9,sysdate);
insert into product_category values(399,'스포츠','499','100','118',10,sysdate);


-- 잡지 --
insert into product_category values(410,'여성/남성/패션','510','100','119',1,sysdate);
insert into product_category values(411,'인문/사회/종교','511','100','119',2,sysdate);
insert into product_category values(412,'자연/공학','512','100','119',3,sysdate);
insert into product_category values(413,'문학/교양','513','100','119',4,sysdate);
insert into product_category values(414,'어학/교육','514','100','119',5,sysdate);
insert into product_category values(415,'예술/대중문화','515','100','119',6,sysdate);
insert into product_category values(416,'취미/레포츠','516','100','119',7,sysdate);



-- 외국도서 --

insert into product_category values(700,'외국도서','700','','',0,sysdate);

insert into product_category values(701,'문학','701','700','',1,sysdate);
insert into product_category values(702,'인문/사회','702','700','',2,sysdate);
insert into product_category values(703,'유아/아동/청소년','703','700','',3,sysdate);
insert into product_category values(704,'경제/경영','704','700','',4,sysdate);
insert into product_category values(705,'과학/기술','705','700','',5,sysdate);
insert into product_category values(706,'취미/실용/여행','706','700','',6,sysdate);
insert into product_category values(707,'ELT/수험서','707','700','',7,sysdate);
insert into product_category values(708,'교재','708','700','',8,sysdate);
insert into product_category values(709,'생활/요리/건강','709','700','',9,sysdate);
insert into product_category values(710,'예술/건축','710','700','',10,sysdate);

-- 문학 --
insert into product_category values(750,'문학이론/역사/비평','750','700','701',1,sysdate);
insert into product_category values(751,'소설','751','700','701',2,sysdate);
insert into product_category values(752,'시','752','700','701',3,sysdate);
insert into product_category values(753,'희곡','753','700','701',4,sysdate);
insert into product_category values(754,'에세이/자서전','754','700','701',5,sysdate);
insert into product_category values(755,'기타 작품집','755','700','701',6,sysdate);
insert into product_category values(756,'만화','756','700','701',7,sysdate);


-- 인문/사회 --
insert into product_category values(770,'교양','770','700','702',1,sysdate);
insert into product_category values(771,'철학','771','700','702',2,sysdate);
insert into product_category values(772,'심리학','772','700','702',3,sysdate);
insert into product_category values(773,'종교','773','700','702',4,sysdate);
insert into product_category values(774,'명상','774','700','702',5,sysdate);
insert into product_category values(775,'역사','775','700','702',6,sysdate);
insert into product_category values(776,'정치학','776','700','702',7,sysdate);
insert into product_category values(777,'법학','777','700','702',8,sysdate);
insert into product_category values(778,'교육학','778','700','702',9,sysdate);
insert into product_category values(779,'사회/문화','779','700','702',10,sysdate);
insert into product_category values(780,'언어학','780','700','702',11,sysdate);
insert into product_category values(781,'문헌정보학','781','700','702',12,sysdate);

-- 유아/아동/청소년 --
insert into product_category values(790,'소설','790','700','703',1,sysdate);
insert into product_category values(791,'동시/연극','791','700','703',2,sysdate);
insert into product_category values(792,'만화','792','700','703',3,sysdate);
insert into product_category values(793,'리더스/챕터북','793','700','703',4,sysdate);
insert into product_category values(794,'동화/그림책','794','700','703',5,sysdate);
insert into product_category values(795,'사전/백과사전','795','700','703',6,sysdate);

-- 경제/경영 --
insert into product_category values(810,'경제학','810','700','704',1,sysdate);
insert into product_category values(811,'경영학','811','700','704',2,sysdate);
insert into product_category values(812,'마케팅/세일즈','812','700','704',3,sysdate);
insert into product_category values(813,'재무관리','813','700','704',4,sysdate);
insert into product_category values(814,'투자','814','700','704',5,sysdate);
insert into product_category values(815,'취업','815','700','704',6,sysdate);
insert into product_category values(816,'회계','816','700','704',7,sysdate);
insert into product_category values(817,'자기계발','817','700','704',8,sysdate);

-- 과학/기술 --
insert into product_category values(830,'교양과학','830','700','705',1,sysdate);
insert into product_category values(831,'수학','831','700','705',2,sysdate);
insert into product_category values(832,'생물학/생명공학','832','700','705',3,sysdate);
insert into product_category values(833,'농림수산학','833','700','705',4,sysdate);
insert into product_category values(834,'지구과학/천문학','834','700','705',5,sysdate);
insert into product_category values(835,'물리학','835','700','705',6,sysdate);
insert into product_category values(836,'의학','836','700','705',7,sysdate);
insert into product_category values(837,'컴퓨터','837','700','705',8,sysdate);
insert into product_category values(838,'에너지공학','838','700','705',9,sysdate);

-- 취미/실용/여행 --
insert into product_category values(850,'공예','850','700','706',1,sysdate);
insert into product_category values(851,'정원가꾸기','851','700','706',2,sysdate);
insert into product_category values(852,'여행','852','700','706',3,sysdate);
insert into product_category values(853,'게임','853','700','706',4,sysdate);
insert into product_category values(854,'기타 취미','854','700','706',5,sysdate);

-- ELT/수험서 --
insert into product_category values(870,'ELT','871','700','707',1,sysdate);
insert into product_category values(871,'수험서','872','700','707',2,sysdate);

-- 교재 --
insert into product_category values(890,'경제/경영','890','700','708',1,sysdate);
insert into product_category values(891,'인문/사회','891','700','708',2,sysdate);
insert into product_category values(892,'교육학','892','700','708',3,sysdate);
insert into product_category values(893,'법학','893','700','708',4,sysdate);
insert into product_category values(894,'철학','894','700','708',5,sysdate);
insert into product_category values(895,'심리학','895','700','708',6,sysdate);
insert into product_category values(896,'역사학','896','700','708',7,sysdate);

-- 생활/요리/건강 --
insert into product_category values(910,'가정과 생활','910','700','709',1,sysdate);
insert into product_category values(911,'요리','911','700','709',2,sysdate);
insert into product_category values(912,'스포츠','912','700','709',3,sysdate);
insert into product_category values(913,'건강','913','700','709',4,sysdate);
insert into product_category values(914,'애완동물','914','700','709',5,sysdate);
insert into product_category values(915,'인테리어','915','700','709',6,sysdate);


-- 예술/건축 --
insert into product_category values(930,'예술일반','930','700','710',1,sysdate);
insert into product_category values(931,'예술사','931','700','710',2,sysdate);
insert into product_category values(932,'박물관/수집','932','700','710',3,sysdate);
insert into product_category values(933,'미술장르','933','700','710',4,sysdate);
insert into product_category values(934,'디자인','934','700','710',5,sysdate);
insert into product_category values(935,'패션','935','700','710',6,sysdate);
insert into product_category values(936,'사진','936','700','710',7,sysdate);
insert into product_category values(937,'건축','937','700','710',8,sysdate);
insert into product_category values(938,'음악','938','700','710',9,sysdate);
insert into product_category values(939,'영화/TV','939','700','710',10,sysdate);
insert into product_category values(940,'연극/공연예술','940','700','710',11,sysdate);

insert into admins values(1,'admin','123',sysdate);

commit;


