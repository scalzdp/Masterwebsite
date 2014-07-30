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
	
	/**get the login user message
	 * */
	public UserVO getLoginUser(UserVO uservo){
		UserVO vo = new UserVO();
		List<Customer> c = baseDAO.queryFactory(new Customer(), "t_customer", " and userEmail = '"+uservo.getUserEmail()+"'");
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
	
	/**save the register user
	 * */
	public UserVO registerUser(UserVO uservo){
		Customer c = new Customer();
		c.setName(uservo.getName());
		c.setUserEmail(uservo.getUserEmail());
		c.setPassword(uservo.getPassword());
		baseDAO.save(c);
		uservo.setId(c.getId());
		return uservo;
	}
	
	/**判断注册的邮箱是否有重复，如果邮箱已被注册返回false，否则返回true。
	 * */
	public boolean queryEmailRepeatTimes(UserVO uservo){
		List<Customer> cus = baseDAO.queryFactory(new Customer(), "t_customer", " and userEmail= '"+uservo.getUserEmail().trim()+"'");
		if(cus.size()>=1){
			return false;
		}else{
			return true;
		}
	}
}
