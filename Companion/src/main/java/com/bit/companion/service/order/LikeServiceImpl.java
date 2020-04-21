package com.bit.companion.service.order;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.companion.model.entity.order.LikeVo;
import com.bit.companion.model.entity.order.OrderVo;
import com.bit.companion.model.order.LikeDao;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	LikeDao likedao;

	@Override
	public int likeInsert(LikeVo likeVo) throws Exception{
		int result;
		result = likedao.likeInsert(likeVo);
		return result; 
	} 



}
