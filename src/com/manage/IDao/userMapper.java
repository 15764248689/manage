package com.manage.IDao;

import java.util.List;

import com.manage.model.User;



public interface userMapper {
	
	
	//�û���½
	User login(String userName,String passWord);
	//��ȡȫ���û��б���ҳ
	List<User> findAll(Integer startNumber,Integer endNumber);
	//����id��ȡһ���û�
	User findById(Integer id);
	//����һ���û�����
	boolean addUser(User user);
	//����idɾ��һ������
	boolean deleteUser(Integer id);
	//�޸�һ������
	boolean updateUser(User user);
	//�û�����ɾ��
	boolean deletes(String ids);
	
}
