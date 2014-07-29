package com.bip.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bip.DAO.IBaseDAO;
import com.bip.bean.Customer;
import com.bip.vo.UserVO;

@Service
public class CustomerService {
	
	@Autowired
	private IBaseDAO baseDAO;
	
	public UserVO getLoginUser(UserVO uservo){
		UserVO vo = new UserVO();
		List<Customer> c = baseDAO.queryFactory(new Customer(), "t_customer", " and userEmail ="+uservo.getUserEmail());
		if(c.size()>0){
			if(c.get(0).getPassword().equals(uservo.getPassword())){
				 vo.setName(c.get(0).getName());
				 vo.setId(c.get(0).getId());
				 vo.setTelephone(c.get(0).getTelephone());
				return vo;
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
}
