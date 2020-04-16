package com.bit.companion.model.admin;

import java.sql.SQLException;
import java.util.List;

import com.bit.companion.common.Search;
import com.bit.companion.model.entity.admin.AdminHotelServiceVo;
import com.bit.companion.model.entity.admin.AdminReservationVo;

public interface AdminReservationDao {

	// reservation list
	List<AdminReservationVo> selectAll() throws SQLException;
	
	// hotelService list
	List<AdminHotelServiceVo> selectService() throws SQLException;

	// reservation detail
	AdminReservationVo selectOne(int reserve_id) throws SQLException;

	// reservation state update
	int updateOne(AdminReservationVo bean) throws SQLException;
	
}
