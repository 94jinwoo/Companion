package com.bit.companion.service.admin;

import org.springframework.ui.Model;

import com.bit.companion.common.Search;
import com.bit.companion.model.entity.admin.AdminReservationVo;

public interface AdminReservationService {

	//reservation list
	void list(Model model);
	
	//hotelservice list
	void service(Model model);
	
	//reservation detail
	void detail(Model model, int reserve_id);

	// reservation state update
	void update(AdminReservationVo bean);

}
