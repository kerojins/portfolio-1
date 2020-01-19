
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



