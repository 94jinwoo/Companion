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
	
//	product list select
	@Override
	public List<OrderVo> OrderSelectAll() throws SQLException{
		return sqlSession.selectList("order.OrderSelectAll");
		
	}
	// when	order success
	//transaction 
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

// orderPurchase 
	@Override
	public OrderVo OrderProductPurchaseOne(int product_id) throws SQLException {
		return sqlSession.selectOne("order.OrderProductPurchaseOne",product_id);
	}
// cart add
	@Override
	public void OrderCartAdd(OrderVo orderVo) throws SQLException {
		
		//cart table에 
		sqlSession.insert("order.OrderCartAdd",orderVo);
		
	}
}
