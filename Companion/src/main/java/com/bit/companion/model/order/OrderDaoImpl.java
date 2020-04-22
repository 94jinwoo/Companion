package com.bit.companion.model.order;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.bit.companion.model.entity.order.OrderVo;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
//	상품 목록 출력.
	@Override
	public List<OrderVo> OrderSelectAll() throws SQLException{
		return sqlSession.selectList("order.OrderSelectAll");
		
	}

	
//	상품 주문 성공했을 경우에 orderSuccess 페이지에서 insert 수행 
	//transaction 처리.
	@Override
	public void OrderInfo_Details(OrderVo orderVo) throws SQLException {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("example-transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
		if((orderVo.getProduct_stock())-(orderVo.getOrder_detail_quantity())<0) {
			System.out.println("상품 재고가 구입하려는 상품 수량보다 부족합니다.");
		}else {
			try {
				sqlSession.insert("order.OrderProductPurchase",orderVo);
				sqlSession.insert("order.OrderDetailInsert",orderVo);
				sqlSession.insert("order.OrderPaymentInsert",orderVo);
				sqlSession.update("order.OrderUpdateProductStock",orderVo);
			}catch (Exception e) {
				transactionManager.rollback(status);
				throw e;
			}
		}
		transactionManager.commit(status);
	}


// 상품 하나 주문 하기 orderPurchase 페이지에 필요한 정보 부르는 것.
	@Override
	public OrderVo OrderProductPurchaseOne(int product_id) throws SQLException {
		return sqlSession.selectOne("order.OrderProductPurchaseOne",product_id);
	}
// 장바구니에 담기
	@Override
	public void OrderCartAdd(OrderVo orderVo) throws SQLException {
		
		//cart table에 
		sqlSession.insert("order.OrderCartAdd",orderVo);
		
	}
	
// 장바구니용.
	@Override 
	public int CartOrderPurchase(List<OrderVo> orderVo) throws SQLException {
		sqlSession.insert("order.CartOrderPurchase",orderVo);
		sqlSession.insert("order.CartDetailInsert",orderVo);
		sqlSession.insert("order.CartPaymentInsert",orderVo);
		return sqlSession.insert("order.CartDeliveryInsert",orderVo);
	}
	
	
}
