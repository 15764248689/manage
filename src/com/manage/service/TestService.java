package com.manage.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.manage.IDao.userMapper;
import com.manage.model.User;


@Service("testService")
@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
public class TestService {
	
	@Resource
	private userMapper userDao;

	
	public User login(String userName,String passWord){
		
		return userDao.login(userName, passWord);
	}
	public List<User> findAll(Integer startNumber,Integer endNumber){
		
		return userDao.findAll(startNumber, endNumber);
	};
	
	public User findById(Integer id){
		
		return userDao.findById(id);
	};
	
	public boolean addUser(User user){
		return userDao.addUser(user);
	};
	
	public boolean deleteUser(Integer id){
		
		return userDao.deleteUser(id);
	};
	
	public boolean deletes(String ids){
		
		return userDao.deletes(ids);
	};
	
	public boolean updateUser(User user){
		
		return userDao.updateUser(user);
	};

}
