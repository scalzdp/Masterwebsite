package com.bip.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bip.DAO.IBaseDAO;
import com.bip.bean.Customer;
import com.bip.bean.Evaluation;
import com.bip.cachetool.ICatch;
import com.bip.vo.EvaluationOfHistoryVO;
import com.bip.vo.PictureVO;
import com.bip.vo.RealActionVO;
import com.bip.vo.UserVO;

@Service
public class CustomerService {
	
	@Autowired
	private IBaseDAO baseDAO;
	
	@Autowired
	private ICatch catched;
	
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
	
	/**�ж�ע��������Ƿ����ظ�����������ѱ�ע�᷵��false�����򷵻�true��
	 * */
	public boolean queryEmailRepeatTimes(UserVO uservo){
		List<Customer> cus = baseDAO.queryFactory(new Customer(), "t_customer", " and userEmail= '"+uservo.getUserEmail().trim()+"'");
		if(cus.size()>=1){
			return false;
		}else{
			return true;
		}
	}
	
	/**through userId get this user evaluation historys 
	 * */
	public List<EvaluationOfHistoryVO> getEvaluationHistory(int userid){
		List<EvaluationOfHistoryVO> vos = new ArrayList<EvaluationOfHistoryVO>();
		List<Evaluation> evaluations = baseDAO.queryFactory(new Evaluation(),"t_evaluation", " and userId ="+userid);
		for(Evaluation e :evaluations){
			EvaluationOfHistoryVO vo = new EvaluationOfHistoryVO();
			RealActionVO ravo = catched.searchFromCachedByRealActionID(e.getId());
			vo.setDateTime(e.getTime());
			vo.setEvaluationId(e.getId());
			vo.setMemo(e.getMemo());
			for(PictureVO pvo : ravo.getPicturevos()){
				if(pvo.getIsMain().equals(1)){
					vo.setPath(pvo.getPicMaxPath());
				}
			}
			vo.setRealActivityId(ravo.getRealactivityID());
			vos.add(vo);
		}
		
		return vos;
	}
}
