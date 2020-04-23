package com.bit.companion.service.order;

import java.util.Map;

import org.springframework.ui.Model;

import com.bit.companion.model.entity.order.LikeVo;

public interface LikeService {
	//like insert 
	int likeInsert(LikeVo likevo) throws Exception;
} 
 