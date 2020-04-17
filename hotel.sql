select * from article where board_id=2;
delete from article where board_id=2;
select * from article;
select * from board;
select * from member;
insert into article values (2,null,'admin','회원가입은 어떻게하나요?','회원가입 버튼을 눌러 진행하시면 됩니다.',now(),0,null);
insert into article values (2,null,'admin','회원탈퇴는 어떻게하나요?','고객센터에 문의 바랍니다.',now(),0,null);
insert into article values (2,null,'admin','고객센터 전화번호를 알려주세요!','1588-0000 입니다.',now(),0,null);
insert into article values (2,null,'admin','고객센터 운영시간이 어떻게 되나요?','평일 08:30~20:30<br/> 주말 09:00~14:00<br/>',now(),0,null);
insert into article values (2,null,'admin','카카오페이로 주문했는데 구매영수증은 어디에서 찾나요?','카카오페이로 컴패니언의 상품을 구매해주신 분들은 구매영수증(현금,카드 등)은 컴패니언 쇼핑몰에서 확인 및 출력을 하실 수 없습니다.<br/>이 경우, 카카오톡 "더보기","카카오페이","영수증"을 차례대로 선택하거나 "카카오페이 청구서" 내 상단 탭에서 약관에 동의한 후 확인 가능합니다.',now(),0,null);
insert into article values (2,null,'admin','주문하고부터 제품을 받기까지 어떤 절차가 있나요?','상품을 주문하시면 아래 단계에 따라 주문 및 배송이 진행됩니다.<br/><br/>[입금 대기]<br/>무통장입금의 경우, 입금 확인이 되기 전까지의 상태입니다.<br/>자동 입금 확인은 1~2시간 정도 소요될 수 있으며, 입금자명과금액이 일치하지 않는 경우, 관리자가 확인할 때까지 시간이 소요될 수 있습니다.<br/><br/>[결제 완료]<br/>자동 입금 확인이 된 건의 경우와 관리자가 직접 입금 확인 처리를 하는 경우에 결제 완료 상태가 표시됩니다.<br/>보통, 입금 확인과 함께 배송 준비가 진행되기 때문에, 결제 완료에서 곧 배송 준비중으로 상태가 변경됩니다.<br/><br/>[배송 준비중]<br/>무통장입금 외의 다른 결제 방법을 사용하신 경우, 바로 배송 준비중 단계로 설정됩니다.<br/>상품이 출고되어 운송장 번호를 입력하기 전까지의 상태이기 때문에, 다음 출고일 오후 정도까지 배송 준비중인 경우가 있습니다.<br/>영업일 오후 1시 30분 이전에 결제 완료된 상품은 당일 출고되며, 그 이후에 결제 완료된 상품은 다음 영업일 오후에 출고됩니다.<br/><br/>[배송중]<br/>상품이 출고되고 택배사와 운송장 번호가 입력되면 배송중으로 상태가 변경됩니다.<br/>우체국택배로 발송되는 경우, 통상적으로 다음 영업일에 상품이 도착하는 편이며, 늦어도 2~3일 이내에는 받아보실 수 있습니다.<br/><br/>[배송 완료]<br/>주문하신 상품이 도착해서 배송이 완료된 상태입니다.<br/>혹시 상품을 받아보지 못하셨는데, 배송 완료 처리가 된 경우, 고객센터로 꼭 문의해주세요. ',now(),0,null);
insert into article values (2,null,'admin','무통장입금으로 구매한 주문을 취소했는데 환불은 언제되나요?','무통장입금 주문 및 가상계좌 주문은 취소 처리가 완료되어도 자동으로 환불되지 않습니다.<br/>따라서, 고객님이 전달해주시는 환불 정보로 입금 처리하기까지 시간이 소요됩니다.<br/><br/>무통장입금으로 주문 후 취소하신 후에 고객센터로 문의해 아래 정보를 전달해주시면, 1~2일 내로 환불 금액이 입금됩니다.<br/>①은행명<br/>②계좌번호<br/>③(주문자명과 동일한)예금주명',now(),0,null);
insert into article values (2,null,'admin','오늘 주문했는데 언제 배송되나요?','통상적으로 평일 오후 1시를 기준으로 이전에 접수된 주문 건은 당일 출고되며, 이후에 접수된 주문 건은 익일 출고됩니다.<br/>주말(토,일) 또는 공휴일에 접수된 주문 건의 경우, 다음 평일에 출고됩니다.<br/><br/>택배사 사정에 따라 출고 시점이나 배송 일정에 일부 변동이 생길 수 있으니 이 점 양해 부탁드립니다.<br/>컴패니언은 고객님께서 최대한 빨리 상품을 받아보실 수 있도록 전직원이 노력하고 있으니 기다려주시면 감사하겠습니다.',now(),0,null);
commit;

select * from article;
select * from member;

insert into member values ('test01',1234,'테스터','테스트일반전화','테스트휴대전화','test@test.com','주소1','주소2','주소3',2);

insert into `reserve` values (null,'test01',0,now(),'2020-03-24','2020-03-30','진돗개',4,'물어요',DEFAULT);
select * from `reserve`;
select * from `payment`;
select * from `payment_state`;
select * from `order`;
select * from `service`;

select sum(payment_amount) as `daily_sum` from `payment` where payment_date like CONCAT('2020-04-02','%');
select sum(payment_amount) as daily_sum from `payment`;

select sum(payment_amount) as daily_sum from `payment` where payment_date like '2020-03-30%';
select sum(payment_amount) as monthly_sum from `payment` where payment_date like '2020-03%';

insert into payment values (null,1,'회원1',now(),100,0);
insert into payment values (null,2,'회원1',now(),200,0);
insert into payment values (null,3,'회원1',now(),300,0);
insert into payment values (null,4,'회원1',now(),400,0);
insert into payment values (null,5,'회원1',now(),500,0);
insert into payment values (null,6,'회원1',now(),600,0);
insert into payment values (null,7,'회원1',now(),700,0);
insert into payment values (null,8,'회원1',now(),800,0);
insert into payment values (null,9,'회원1',now(),900,0);
insert into payment values (null,10,'회원1',now(),1000,0);

insert into payment values (null,11,'회원1',now(),1100,0);
insert into payment values (null,12,'회원1',now(),1200,0);
insert into payment values (null,13,'회원1',now(),1300,0);
insert into payment values (null,14,'회원1',now(),1400,0);
insert into payment values (null,15,'회원1',now(),1500,0);
insert into payment values (null,16,'회원1',now(),1600,0);
insert into payment values (null,17,'회원1',now(),1700,0);
insert into payment values (null,18,'회원1',now(),1800,0);
insert into payment values (null,19,'회원1',now(),1900,0);
insert into payment values (null,20,'회원1',now(),2000,0);

insert into payment values (null,21,'회원1',now(),2100,0);
insert into payment values (null,22,'회원1',now(),2200,0);
insert into payment values (null,23,'회원1',now(),2300,0);
insert into payment values (null,24,'회원1',now(),2400,0);
insert into payment values (null,25,'회원1',now(),2500,0);
insert into payment values (null,26,'회원1',now(),2600,0);
insert into payment values (null,27,'회원1',now(),2700,0);
insert into payment values (null,28,'회원1',now(),2800,0);
insert into payment values (null,29,'회원1',now(),2900,0);
insert into payment values (null,30,'회원1',now(),3000,0);

insert into payment values (null,30,'회원1',now(),3000,0);
insert into payment values (null,30,'회원1','2019-10-01',47540000,0);
delete from payment where payment_date = '2019-12-01 00:00:00';

SELECT 
			r.reserve_id, 
		    r.member_id,
		    s.service_name,
		    r.reserve_checkin,
		    r.reserve_checkout,
		    r.reserve_dogtype,
		    r.reserve_dogage,
		    r.reserve_date,
		    r.reserve_state_id
    	FROM `RESERVE` r, `SERVICE` s WHERE r.service_id=s.service_id and service_name LIKE CONCAT('%', '독파크', '%');
SELECT 
			r.reserve_id, 
		    r.member_id,
		    s.service_name,
		    r.reserve_checkin,
		    r.reserve_checkout,
		    r.reserve_dogtype,
		    r.reserve_dogage,
		    r.reserve_date,
		    r.reserve_state_id
    	FROM `RESERVE` r, `SERVICE` s WHERE r.service_id=s.service_id and (service_name LIKE CONCAT('%', '독파크', '%') OR
							reserve_date LIKE CONCAT('%', '독파크', '%') OR
							member_id LIKE CONCAT('%', '독파크', '%'));
                            
		SELECT 
					o.order_id,
					o.member_id,
				    o.order_date,
				    o.order_phone,
				    o.order_tel,
				    o.order_name,
				    o.order_msg,
				    o.order_addr1,
				    o.order_addr2,
				    o.order_addr3,
				    o.order_amount,
				    (SELECT m.member_name from `member` m where o.member_id=m.member_id  and o.order_id=171) as member_name,
				    (SELECT m.member_phone from `member` m where o.member_id=m.member_id  and o.order_id=171) as member_phone,
				    (SELECT m.member_email from `member` m where o.member_id=m.member_id and o.order_id=171) as member_email,
				    (SELECT o_s.order_state_admin from `order_state`o_s, `order` o where o.order_state_id=o_s.order_state_id  and o.order_id=171) as order_state_admin,
		            (SELECT d.delivery_company from `delivery` d where o.order_id=d.order_id and o.order_id=171) as delivery_company,
		            (SELECT d.delivery_number from `delivery` d where o.order_id=d.order_id and o.order_id=171) as delivery_number,
		            (SELECT d_s.delivery_state_name from `delivery_state` d_s, `delivery` d where d_s.delivery_state_id=d.delivery_state_id and o.order_id=d.order_id and o.order_id=171) as delivery_state_name,
                    (SELECT p.payment_date from `payment` p where p.order_id=o.order_id and o.order_id=171) as payment_date,
                    (SELECT p.payment_amount from `payment` p where p.order_id=o.order_id and o.order_id=171) as payment_amount,
                    (SELECT p_s.payment_state_name from `payment_state` p_s, `payment` p where p_s.payment_state_id=p.payment_state_id and p.order_id=171) as payment_state_name
				    from `order` o where o.order_id=171;
select * from article;
SELECT p.payment_date from `payment` p, `order` o where p.order_id=o.order_id and o.order_id=171;
select 
		o_d.order_detail_id,
        o_d.order_id,
        o_d.product_id,
        o_d.order_detail_price,
        o_d.order_detail_quantity,
        o_d.order_detail_option,
        (select p.product_name from `product` p where o_d.product_id=p.product_id and o.order_id=171) as product_name,
        (select p.product_price from `product` p where o_d.product_id=p.product_id and o.order_id=171) as product_price
        from `order_detail` o_d, `order` o where o_d.order_id=o.order_id and o.order_id=171;


select * from `order_state`;
select * from `member`;
select * from `order`;
select * from `order_detail`;
select * from `delivery`;
select * from `delivery_state`;
select * from `payment`;
select * from `payment_state`;

select * from `article` where board_id=2;

delete from `article` where board_id=2 and article_date like '2020-04-14%';

delete from `payment` where order_id>178;

delete from `delivery` where order_id>178;

delete from `order` where order_id>178;

delete from `order_detail` where order_id>178;
commit;