use companion;
select count(*) as listCnt from `product` where category_id=100;
select count(*) as listCnt from `product` where category_id=200;
select count(*) as listCnt from `product` where category_id=300;
select count(*) as listCnt from `product` where category_id=400;
select count(*) as listCnt from `product` where category_id=500;
select count(*) as listCnt from `product` where category_id=600;
select count(*) as listCnt from `product` where category_id=700;
select count(*) as listCnt from `product` where category_id=701;
select count(*) as listCnt from `product` where category_id=702;
select count(*) as listCnt from `product` where category_id=703;

select  p.*, odq.order_detail_quantity from `product` p, `category` c, (select order_detail.order_detail_quantity 
from distinct `order_detail`,`product` where product.product_id=order_detail.product_id) as odq
				where p.category_id=c.category_id and 
				(p.category_id=100 OR c.category_refid=100)
				ORDER BY order_detail_quantity DESC ;


