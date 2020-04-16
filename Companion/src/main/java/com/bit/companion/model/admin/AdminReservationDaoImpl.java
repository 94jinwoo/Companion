package com.bit.companion.model.admin;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.companion.common.Search;
import com.bit.companion.model.entity.admin.AdminHotelServiceVo;
import com.bit.companion.model.entity.admin.AdminReservationVo;

@Repository
public class AdminReservationDaoImpl implements AdminReservationDao {
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired
	SqlSession sqlsession;
	
	// reservation list - selectAll
	@Override
	public List<AdminReservationVo> selectAll() throws SQLException {
		return sqlsession.selectList("adminReservation.selectAll");
	}
	
	// hotelService list -selectAll
	@Override
	public List<AdminHotelServiceVo> selectService() throws SQLException {
		return sqlsession.selectList("adminReservation.selectService");
	}
	// reservation - detail
	@Override
	public AdminReservationVo selectOne(int reserve_id) throws SQLException {
		System.out.println(reserve_id);
		return sqlsession.selectOne("adminReservation.selectOne", reserve_id);
	}
	// reservation - edit
	@Override
	public int updateOne(AdminReservationVo bean) throws SQLException {
		return sqlsession.update("adminReservation.updateOne", bean);
		
	}

	
}
