use companion;
select * from `member`;
insert into `member` values('admin','1234','어드민',null,'010-0000-0001','admin@admin.com','55555','서울시','비트캠프',0);

DELIMITER $$
DROP PROCEDURE IF EXISTS loopInsert $$
CREATE PROCEDURE loopInsert()
BEGIN
    DECLARE i INT DEFAULT 1;
        
    WHILE i <= 800 DO
        INSERT INTO article VALUES(0,null,'admin',concat('제목',i),concat('내용',i),now(),0,null);
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER $$
CALL loopInsert;
update article set board_id=1 where article_id>100;
update article set board_id=2 where article_id>200;
update article set board_id=3 where article_id>300;
update article set board_id=0 where article_id>400;
update article set board_id=1 where article_id>500;
update article set board_id=2 where article_id>600;
update article set board_id=3 where article_id>700;
commit;

select * from member order by member_id desc;
select * from article where board_id=2 order by article_id desc;
INSERT INTO article VALUES(2,null,'admin',concat('제목999'),concat('내용888'),now(),0,null,null);
select article_title, article_content, article_date, article_image from article where article_id=2;

select * from category;
insert into category values(701,700,'테스트1');
insert into category values(702,700,'테스트2');
insert into category values(703,700,'테스트3');

select * from product order by product_id desc;
insert into product values(700,null,'테스트','관리자 상품 입력 테스트',30000,30,now(),null,null,null,null,null,null,null);
update product set product_thumb=null where product_id>0;

select * from question;
insert into question values(null,100,null,1,'회원1',now(),null,'테스트제목','테스트내용',null,null,0,0);

select * from product p inner join category c on p.category_id=c.category_id where p.product_id=72;
select * from product p, category c where p.category_id=c.category_id and p.product_id=71;

select * from `like`;
insert into `like` values (null,'admin',1);
insert into `like` values (null,'admin',2);
insert into `like` values (null,'admin',3);
select count(product_id) from `like` where member_id='admin' and product_id=2;

select p.product_id,p.product_name,c.category_name, (select count(*) from `like` l where p.product_id=l.product_id) "count" 
from `product` p, `category` c where p.category_id=c.category_id order by p.product_id desc;

select * from `like`;

select 
	c.category_refid,
	(select cc.category_name from category cc where c.category_refid=cc.category_id) as "categoty_refidname",
	p.category_id,
	c.category_name,
	p.product_id,
	p.product_name,
	p.product_content,
	p.product_price,
	p.product_stock,
	p.product_date,
	p.product_image,
	p.product_thumb,
	p.product_option1,
	p.product_option2,
	p.product_option3,
	p.product_option4,
	p.product_option5,
	(select count(*) from `like` l where l.product_id=p.product_id) "like_sum" 
		from `product` p, `category` c 
			where p.category_id=c.category_id and
            c.category_name LIKE CONCAT('%', 3, '%')
            order by p.product_id desc
            
SELECT count(*) AS listCnt FROM `PRODUCT` where product_name LIKE CONCAT('%', 4, '%')
            
            
            
            
            
DELIMITER $$
DROP PROCEDURE IF EXISTS loopInsert $$
CREATE PROCEDURE loopInsert()
BEGIN
    DECLARE i INT DEFAULT 1;
        
    WHILE i <= 400 DO
        INSERT INTO product VALUES(701,null,concat('테스트이름',i),concat('테스트설명',i),i,i,now(),null,null,null,null,null,null,null);
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER $$
CALL loopInsert;
update product set category_id=100 where product_id>80;
update product set category_id=200 where product_id>120;
update product set category_id=300 where product_id>160;
update product set category_id=400 where product_id>200;
update product set category_id=500 where product_id>240;
update product set category_id=600 where product_id>280;
update product set category_id=700 where product_id>320;
update product set category_id=701 where product_id>360;
update product set category_id=600 where product_id>460;
update product set category_id=703 where product_id>485;
select * from product order by product_id desc;

select * from `member` where member_grade=1;

SELECT * FROM `ARTICLE` WHERE board_id=1 and (article_title LIKE CONCAT('%', 23, '%') OR
					article_content LIKE CONCAT('%', 23, '%') OR
					member_id LIKE CONCAT('%', 23, '%'))

select * from `question` where question_state_id=1;
insert into `question` values(null,0,5,30,'admin',now(),now(),'제목','내용',null,'답변내용',0,1);
insert into `question` values(null,2,10,15,'admin',now(),now(),'제목','내용',null,'답변내용',0,1); 
insert into `question` values(null,3,11,1,'admin',now(),now(),'제목','내용',null,'답변내용',0,1);
insert into `question` values(null,2,6,13,'admin',now(),now(),'제목','내용',null,'답변내용',0,1);
insert into `question` values(null,5,8,15,'admin',now(),now(),'제목','내용',null,'답변내용',0,1);
insert into `question` values(null,5,8,15,'admin',now(),now(),'제목','내용',null,'답변내용',0,1);


select q.*, t.question_type_name, st.question_state_name, se.question_secret_name FROM `QUESTION` q, `question_type` t, `question_state` st, `question_secret` se WHERE q.question_state_id=1 and
	q.question_type_id=t.question_type_id and q.question_state_id=st.question_state_id and q.question_secret_id=se.question_secret_id


select p.product_name, p.product_price, p.product_stock, o_d.order_detail_quantity from `product` p, `order_detail` o_d where p.product_id=o_d.product_id

SELECT a.*, (select product_name from `product` p where p.product_id=a.product_id) as product_name FROM `ARTICLE` a WHERE board_id=3

UPDATE `PRODUCT` SET 
			category_id =100,
         	product_name = '상품이름',
	        product_content = '상품내용',
	        product_price = 123,
	        product_stock = 456,
	        product_image = null,
	        product_thumb = null,
	        product_option1 = null,
	        product_option2 = null,
	        product_option3 = null,
	        product_option4 = null,
	        product_option5 = null
    			WHERE product_id = 1;
                
                
                
delete from `product` where product_id>800 and product_id<900
update product set product_thumb=null where product_id>=1000
select * from `order`
select * from `product`;
select * from `category`;
update category set category_name="목욕용품" where category_id=500;

