

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
	-- �ſ�ī�� / ������ �Ա�
	payment_methods varchar2(20) NOT NULL,
	-- 1. ���� ���
	-- 2. ���� �Ϸ�
	-- 3. ��� �غ���
	-- 4. �����
	-- 5. ��� �Ϸ�
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

COMMENT ON COLUMN Orders.payment_methods IS '�ſ�ī�� / ������ �Ա�';
COMMENT ON COLUMN Orders.order_status IS '1. ���� ���
2. ���� �Ϸ�
3. ��� �غ���
4. �����
5. ��� �Ϸ�';






insert into product_category values(1,'��������','100','','',0,sysdate);

insert into product_category values(2,'�Ҽ�','101','100','',1,sysdate);
insert into product_category values(3,'��/������','102','100','',2,sysdate);
insert into product_category values(4,'����/�濵','103','100','',3,sysdate);
insert into product_category values(5,'�ڱ���','104','100','',4,sysdate);
insert into product_category values(6,'�ι�','105','100','',5,sysdate);
insert into product_category values(7,'����/��ȭ','106','100','',6,sysdate);
insert into product_category values(8,'����','107','100','',7,sysdate);
insert into product_category values(9,'��ġ/��ȸ','108','100','',8,sysdate);
insert into product_category values(10,'����/���߹�ȭ','109','100','',9,sysdate);
insert into product_category values(11,'����','110','100','',10,sysdate);
insert into product_category values(12,'���/����','111','100','',11,sysdate);
insert into product_category values(13,'��ǻ��/IT','112','100','',12,sysdate);
insert into product_category values(14,'���/û�ҳ�','113','100','',13,sysdate);
insert into product_category values(15,'����/����','114','100','',14,sysdate);
insert into product_category values(16,'����/����','115','100','',15,sysdate);
insert into product_category values(17,'�ǰ�','116','100','',16,sysdate);
insert into product_category values(18,'����','117','100','',17,sysdate);
insert into product_category values(19,'���/������','118','100','',18,sysdate);
insert into product_category values(20,'����','119','100','',19,sysdate);

-- �Ҽ� --
insert into product_category values(50,'����Ҽ�','150','100','101',1,sysdate);
insert into product_category values(51,'���̼Ҽ�','151','100','101',2,sysdate);
insert into product_category values(52,'�Ϻ��Ҽ�','152','100','101',2,sysdate);
insert into product_category values(53,'�߱��Ҽ�','153','100','101',3,sysdate);
insert into product_category values(54,'���þƼҼ�','154','100','101',4,sysdate);
insert into product_category values(55,'����/���ۼҼ�','155','100','101',5,sysdate);
insert into product_category values(56,'�帣�Ҽ�','156','100','101',6,sysdate);
insert into product_category values(57,'�׸��Ҽ�','157','100','101',7,sysdate);

-- ��/������ --
insert into product_category values(70,'�����','170','100','102',1,sysdate);
insert into product_category values(71,'�ѽ�/����/�ð�','171','100','102',2,sysdate);
insert into product_category values(72,'�������۽�','172','100','102',3,sysdate);
insert into product_category values(73,'���̽�','173','100','102',4,sysdate);
insert into product_category values(74,'�Ϻ�/�߱���','174','100','102',5,sysdate);
insert into product_category values(75,'��Ÿ�����','175','100','102',6,sysdate);
insert into product_category values(76,'����/���ֽ�','176','100','102',7,sysdate);
insert into product_category values(77,'���л������','177','100','102',8,sysdate);

-- ����/�濵 --
insert into product_category values(90,'�濵�Ϲ�','190','100','103',1,sysdate);
insert into product_category values(91,'�濵�̷�','191','100','103',2,sysdate);
insert into product_category values(92,'�����Ϲ�','192','100','103',3,sysdate);
insert into product_category values(93,'�����̷�','193','100','103',4,sysdate);
insert into product_category values(94,'�������','194','100','103',5,sysdate);
insert into product_category values(95,'������/������','195','100','103',6,sysdate);
insert into product_category values(96,'����/â��','196','100','103',7,sysdate);
insert into product_category values(97,'����ũ/����','197','100','103',8,sysdate);
insert into product_category values(98,'����/���','198','100','103',9,sysdate);
insert into product_category values(99,'����/ȣ��','199','100','103',10,sysdate);

-- �ڱ��� --
insert into product_category values(110,'����/ó��','210','100','104',1,sysdate);
insert into product_category values(111,'�ڱ�ɷ°��','211','100','104',2,sysdate);
insert into product_category values(112,'�����Ͻ��ɷ°��','214','100','104',3,sysdate);
insert into product_category values(113,'�ΰ�����','212','100','104',4,sysdate);
insert into product_category values(114,'ȭ��/����','213','100','104',5,sysdate);

-- �ι� --
insert into product_category values(130,'�ι����Ϲ�','230','100','105',1,sysdate);
insert into product_category values(131,'�ɸ���','231','100','105',2,sysdate);
insert into product_category values(132,'������','232','100','105',3,sysdate);
insert into product_category values(133,'���Ʊ���','233','100','105',4,sysdate);
insert into product_category values(134,'Ư������','234','100','105',5,sysdate);
insert into product_category values(135,'�ӿ뱳��','235','100','105',6,sysdate);
insert into product_category values(136,'ö��','236','100','105',7,sysdate);

-- ����/��ȭ --
insert into product_category values(150,'�����Ϲ�','250','100','106',1,sysdate);
insert into product_category values(151,'�����','251','100','106',2,sysdate);
insert into product_category values(152,'�����','252','100','106',3,sysdate);
insert into product_category values(153,'�����','253','100','106',4,sysdate);
insert into product_category values(154,'�ѱ���','254','100','106',5,sysdate);
insert into product_category values(155,'��ȭ','255','100','106',6,sysdate);
insert into product_category values(156,'�μ���','256','100','106',7,sysdate);
insert into product_category values(157,'��ȭ�Ϲ�','257','100','106',8,sysdate);
insert into product_category values(158,'��ȭ��','258','100','106',9,sysdate);

-- ���� --
insert into product_category values(170,'�����Ϲ�','270','100','107',1,sysdate);
insert into product_category values(171,'�⵶��','271','100','107',2,sysdate);
insert into product_category values(172,'���縯','272','100','107',3,sysdate);
insert into product_category values(173,'�ұ�','273','100','107',4,sysdate);
insert into product_category values(174,'�׿�����','274','100','107',5,sysdate);


-- ��ġ/��ȸ --
insert into product_category values(190,'��ġ/�ܱ�','290','100','108',1,sysdate);
insert into product_category values(191,'����/��å','291','100','108',2,sysdate);
insert into product_category values(192,'����/����','292','100','108',3,sysdate);
insert into product_category values(193,'����','293','100','108',4,sysdate);
insert into product_category values(194,'��ȸ��','294','100','108',5,sysdate);
insert into product_category values(195,'��ȸ����','295','100','108',6,sysdate);
insert into product_category values(196,'���/�Ź�/���','296','100','108',7,sysdate);
insert into product_category values(197,'��ġ/��ȸ����','297','100','108',8,sysdate);
insert into product_category values(198,'���б���','298','100','108',9,sysdate);

-- ����/���߹�ȭ --
insert into product_category values(210,'�����Ϲ�','310','100','109',1,sysdate);
insert into product_category values(211,'�̼�','311','100','109',2,sysdate);
insert into product_category values(212,'��ȭ/�ִϸ��̼�','312','100','109',3,sysdate);
insert into product_category values(213,'������/��ä','313','100','109',4,sysdate);
insert into product_category values(214,'�м�/�Ƿ�','314','100','109',5,sysdate);
insert into product_category values(215,'����','315','100','109',6,sysdate);
insert into product_category values(216,'����/����','316','100','109',7,sysdate);
insert into product_category values(217,'����','317','100','109',8,sysdate);
insert into product_category values(218,'��ȭ','318','100','109',9,sysdate);

-- ���� --
insert into product_category values(230,'�����̷�','330','100','110',1,sysdate);
insert into product_category values(231,'����','331','100','110',2,sysdate);
insert into product_category values(232,'�������','332','100','110',3,sysdate);
insert into product_category values(233,'����','333','100','110',4,sysdate);
insert into product_category values(234,'������','334','100','110',5,sysdate);
insert into product_category values(235,'ȭ��','335','100','110',6,sysdate);
insert into product_category values(236,'������','336','100','110',7,sysdate);
insert into product_category values(237,'õ����','337','100','110',8,sysdate);
insert into product_category values(238,'���й���','338','100','110',9,sysdate);

-- ���/���� --
insert into product_category values(250,'����/���׸���','350','100','111',1,sysdate);
insert into product_category values(251,'���/�Ǽ�','351','100','111',2,sysdate);
insert into product_category values(252,'ȯ��/����/����','352','100','111',3,sysdate);
insert into product_category values(253,'�ڵ���/����','353','100','111',4,sysdate);
insert into product_category values(254,'��������','354','100','111',5,sysdate);
insert into product_category values(255,'�����Ϲ�','355','100','111',6,sysdate);
insert into product_category values(256,'�ݼ�/���','356','100','111',7,sysdate);
insert into product_category values(257,'���/����/�װ�','357','100','111',8,sysdate);
insert into product_category values(258,'����/����','358','100','111',9,sysdate);
insert into product_category values(259,'�����/���','359','100','111',10,sysdate);
insert into product_category values(260,'��Ȱ����','360','100','111',11,sysdate);
insert into product_category values(261,'����','361','100','111',12,sysdate);

-- ��ǻ��/IT --
insert into product_category values(270,'��ǻ�Ͱ���','370','100','112',1,sysdate);
insert into product_category values(271,'IT�Ϲ�','371','100','112',2,sysdate);
insert into product_category values(272,'��ǻ���Թ�/Ȱ��','372','100','112',3,sysdate);
insert into product_category values(273,'�������/�ؼ�','373','100','112',4,sysdate);
insert into product_category values(274,'OS','374','100','112',5,sysdate);
insert into product_category values(275,'��Ʈ��ũ','375','100','112',6,sysdate);
insert into product_category values(276,'����/��ŷ','376','100','112',7,sysdate);
insert into product_category values(277,'�����ͺ��̽�','377','100','112',8,sysdate);
insert into product_category values(278,'���߹����','378','100','112',9,sysdate);
insert into product_category values(279,'����','379','100','112',10,sysdate);
insert into product_category values(280,'�����α׷���','380','100','112',11,sysdate);
insert into product_category values(281,'���α׷���/���','381','100','112',12,sysdate);
insert into product_category values(282,'��������α׷���','382','100','112',13,sysdate);
insert into product_category values(283,'�׷���','383','100','112',14,sysdate);
insert into product_category values(284,'��Ƽ�̵��','384','100','112',15,sysdate);

-- ���/û�ҳ� --
insert into product_category values(290,'��̹���','390','100','113',1,sysdate);
insert into product_category values(291,'��̱���','391','100','113',2,sysdate);
insert into product_category values(292,'��̸�ȭ','392','100','113',3,sysdate);
insert into product_category values(293,'����','393','100','113',4,sysdate);
insert into product_category values(294,'û�ҳ� ������','394','100','113',5,sysdate);
insert into product_category values(295,'û�ҳ� ��','395','100','113',6,sysdate);
insert into product_category values(296,'û�ҳ� ö��','396','100','113',7,sysdate);
insert into product_category values(297,'û�ҳ� ����','397','100','113',8,sysdate);


-- ����/���� --
insert into product_category values(310,'EBS ����','410','100','114',1,sysdate);
insert into product_category values(311,'EBS ���','411','100','114',2,sysdate);
insert into product_category values(312,'����/����','412','100','114',3,sysdate);
insert into product_category values(313,'����','413','100','114',4,sysdate);
insert into product_category values(314,'�������','414','100','114',5,sysdate);
insert into product_category values(315,'���ι��/����','415','100','114',6,sysdate);
insert into product_category values(316,'���/����','416','100','114',7,sysdate);
insert into product_category values(317,'Ư�����','417','100','114',8,sysdate);


-- ����/���� --
insert into product_category values(330,'��ȥ/����','430','100','115',1,sysdate);
insert into product_category values(331,'�ӽ�/���','431','100','115',2,sysdate);
insert into product_category values(332,'����','432','100','115',3,sysdate);
insert into product_category values(333,'�ڳ౳��','433','100','115',4,sysdate);
insert into product_category values(334,'�츲������','434','100','115',5,sysdate);
insert into product_category values(335,'Ȩ���׸���','435','100','115',6,sysdate);


-- �ǰ� --
insert into product_category values(350,'�ǰ��Ϲ�','450','100','116',1,sysdate);
insert into product_category values(351,'���ǰ�','451','100','116',2,sysdate);
insert into product_category values(352,'�ѹ�ġ��','452','100','116',3,sysdate);
insert into product_category values(353,'�ڿ��ǰ�','453','100','116',4,sysdate);
insert into product_category values(354,'�ǰ��Ļ�','454','100','116',5,sysdate);
insert into product_category values(355,'����ġ��/����','455','100','116',6,sysdate);
insert into product_category values(356,'���̾�Ʈ','456','100','116',7,sysdate);
insert into product_category values(357,'�/Ʈ���̴�','457','100','116',8,sysdate);
insert into product_category values(358,'�Ǻ�/����ũ��','458','100','116',9,sysdate);
insert into product_category values(359,'�ǰ�����','459','100','116',10,sysdate);


-- ���� --
insert into product_category values(370,'��������','470','100','117',1,sysdate);
insert into product_category values(371,'�ؿܿ���','471','100','117',2,sysdate);
insert into product_category values(372,'���࿡����','472','100','117',3,sysdate);
insert into product_category values(373,'�׸�����','473','100','117',4,sysdate);
insert into product_category values(374,'�α�����','474','100','117',5,sysdate);
insert into product_category values(375,'����','475','100','117',6,sysdate);


-- ���/������ --
insert into product_category values(390,'��������','490','100','118',1,sysdate);
insert into product_category values(391,'���׸���/����','491','100','118',2,sysdate);
insert into product_category values(392,'��Ȱ����/DIY','492','100','118',3,sysdate);
insert into product_category values(393,'�츲������','493','100','118',4,sysdate);
insert into product_category values(394,'�ֿϵ���','494','100','118',5,sysdate);
insert into product_category values(395,'���/����','495','100','118',6,sysdate);
insert into product_category values(396,'�ٵ�','496','100','118',7,sysdate);
insert into product_category values(397,'����','497','100','118',8,sysdate);
insert into product_category values(398,'����','498','100','118',9,sysdate);
insert into product_category values(399,'������','499','100','118',10,sysdate);


-- ���� --
insert into product_category values(410,'����/����/�м�','510','100','119',1,sysdate);
insert into product_category values(411,'�ι�/��ȸ/����','511','100','119',2,sysdate);
insert into product_category values(412,'�ڿ�/����','512','100','119',3,sysdate);
insert into product_category values(413,'����/����','513','100','119',4,sysdate);
insert into product_category values(414,'����/����','514','100','119',5,sysdate);
insert into product_category values(415,'����/���߹�ȭ','515','100','119',6,sysdate);
insert into product_category values(416,'���/������','516','100','119',7,sysdate);



-- �ܱ����� --

insert into product_category values(700,'�ܱ�����','700','','',0,sysdate);

insert into product_category values(701,'����','701','700','',1,sysdate);
insert into product_category values(702,'�ι�/��ȸ','702','700','',2,sysdate);
insert into product_category values(703,'����/�Ƶ�/û�ҳ�','703','700','',3,sysdate);
insert into product_category values(704,'����/�濵','704','700','',4,sysdate);
insert into product_category values(705,'����/���','705','700','',5,sysdate);
insert into product_category values(706,'���/�ǿ�/����','706','700','',6,sysdate);
insert into product_category values(707,'ELT/���輭','707','700','',7,sysdate);
insert into product_category values(708,'����','708','700','',8,sysdate);
insert into product_category values(709,'��Ȱ/�丮/�ǰ�','709','700','',9,sysdate);
insert into product_category values(710,'����/����','710','700','',10,sysdate);

-- ���� --
insert into product_category values(750,'�����̷�/����/����','750','700','701',1,sysdate);
insert into product_category values(751,'�Ҽ�','751','700','701',2,sysdate);
insert into product_category values(752,'��','752','700','701',3,sysdate);
insert into product_category values(753,'���','753','700','701',4,sysdate);
insert into product_category values(754,'������/�ڼ���','754','700','701',5,sysdate);
insert into product_category values(755,'��Ÿ ��ǰ��','755','700','701',6,sysdate);
insert into product_category values(756,'��ȭ','756','700','701',7,sysdate);


-- �ι�/��ȸ --
insert into product_category values(770,'����','770','700','702',1,sysdate);
insert into product_category values(771,'ö��','771','700','702',2,sysdate);
insert into product_category values(772,'�ɸ���','772','700','702',3,sysdate);
insert into product_category values(773,'����','773','700','702',4,sysdate);
insert into product_category values(774,'���','774','700','702',5,sysdate);
insert into product_category values(775,'����','775','700','702',6,sysdate);
insert into product_category values(776,'��ġ��','776','700','702',7,sysdate);
insert into product_category values(777,'����','777','700','702',8,sysdate);
insert into product_category values(778,'������','778','700','702',9,sysdate);
insert into product_category values(779,'��ȸ/��ȭ','779','700','702',10,sysdate);
insert into product_category values(780,'�����','780','700','702',11,sysdate);
insert into product_category values(781,'����������','781','700','702',12,sysdate);

-- ����/�Ƶ�/û�ҳ� --
insert into product_category values(790,'�Ҽ�','790','700','703',1,sysdate);
insert into product_category values(791,'����/����','791','700','703',2,sysdate);
insert into product_category values(792,'��ȭ','792','700','703',3,sysdate);
insert into product_category values(793,'������/é�ͺ�','793','700','703',4,sysdate);
insert into product_category values(794,'��ȭ/�׸�å','794','700','703',5,sysdate);
insert into product_category values(795,'����/�������','795','700','703',6,sysdate);

-- ����/�濵 --
insert into product_category values(810,'������','810','700','704',1,sysdate);
insert into product_category values(811,'�濵��','811','700','704',2,sysdate);
insert into product_category values(812,'������/������','812','700','704',3,sysdate);
insert into product_category values(813,'�繫����','813','700','704',4,sysdate);
insert into product_category values(814,'����','814','700','704',5,sysdate);
insert into product_category values(815,'���','815','700','704',6,sysdate);
insert into product_category values(816,'ȸ��','816','700','704',7,sysdate);
insert into product_category values(817,'�ڱ���','817','700','704',8,sysdate);

-- ����/��� --
insert into product_category values(830,'�������','830','700','705',1,sysdate);
insert into product_category values(831,'����','831','700','705',2,sysdate);
insert into product_category values(832,'������/�������','832','700','705',3,sysdate);
insert into product_category values(833,'�󸲼�����','833','700','705',4,sysdate);
insert into product_category values(834,'��������/õ����','834','700','705',5,sysdate);
insert into product_category values(835,'������','835','700','705',6,sysdate);
insert into product_category values(836,'����','836','700','705',7,sysdate);
insert into product_category values(837,'��ǻ��','837','700','705',8,sysdate);
insert into product_category values(838,'����������','838','700','705',9,sysdate);

-- ���/�ǿ�/���� --
insert into product_category values(850,'����','850','700','706',1,sysdate);
insert into product_category values(851,'�������ٱ�','851','700','706',2,sysdate);
insert into product_category values(852,'����','852','700','706',3,sysdate);
insert into product_category values(853,'����','853','700','706',4,sysdate);
insert into product_category values(854,'��Ÿ ���','854','700','706',5,sysdate);

-- ELT/���輭 --
insert into product_category values(870,'ELT','871','700','707',1,sysdate);
insert into product_category values(871,'���輭','872','700','707',2,sysdate);

-- ���� --
insert into product_category values(890,'����/�濵','890','700','708',1,sysdate);
insert into product_category values(891,'�ι�/��ȸ','891','700','708',2,sysdate);
insert into product_category values(892,'������','892','700','708',3,sysdate);
insert into product_category values(893,'����','893','700','708',4,sysdate);
insert into product_category values(894,'ö��','894','700','708',5,sysdate);
insert into product_category values(895,'�ɸ���','895','700','708',6,sysdate);
insert into product_category values(896,'������','896','700','708',7,sysdate);

-- ��Ȱ/�丮/�ǰ� --
insert into product_category values(910,'������ ��Ȱ','910','700','709',1,sysdate);
insert into product_category values(911,'�丮','911','700','709',2,sysdate);
insert into product_category values(912,'������','912','700','709',3,sysdate);
insert into product_category values(913,'�ǰ�','913','700','709',4,sysdate);
insert into product_category values(914,'�ֿϵ���','914','700','709',5,sysdate);
insert into product_category values(915,'���׸���','915','700','709',6,sysdate);


-- ����/���� --
insert into product_category values(930,'�����Ϲ�','930','700','710',1,sysdate);
insert into product_category values(931,'������','931','700','710',2,sysdate);
insert into product_category values(932,'�ڹ���/����','932','700','710',3,sysdate);
insert into product_category values(933,'�̼��帣','933','700','710',4,sysdate);
insert into product_category values(934,'������','934','700','710',5,sysdate);
insert into product_category values(935,'�м�','935','700','710',6,sysdate);
insert into product_category values(936,'����','936','700','710',7,sysdate);
insert into product_category values(937,'����','937','700','710',8,sysdate);
insert into product_category values(938,'����','938','700','710',9,sysdate);
insert into product_category values(939,'��ȭ/TV','939','700','710',10,sysdate);
insert into product_category values(940,'����/��������','940','700','710',11,sysdate);

insert into admins values(1,'admin','123',sysdate);

commit;


