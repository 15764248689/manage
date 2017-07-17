package com.manage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.manage.model.User;
import com.manage.service.TestService;
import com.manage.util.Paging;

import org.springframework.ui.Model;

@Controller
@RequestMapping("/contro/testAction")
public class TestAction {
	
	@Autowired
	private TestService testService;

	
	@RequestMapping("/login")
	public void login(HttpServletResponse response,HttpServletRequest request,
			HttpSession session,String userName,String passWord){
		//User user = testDao.findById(1);
		System.out.println(userName);
		System.out.println(passWord);
		User user = testService.login(userName,passWord);
		try {
			 PrintWriter out = response.getWriter();
			if(user != null){
				session.setAttribute("user", userName);
				out.print(1);
				out.close();
			}else{
				out.print(0);
				out.close();
			}	
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("userList")
	public String userList(HttpServletResponse response,HttpServletRequest request,
			HttpSession session,Model model,Integer startPage){
		
		int pageSize = 3;
		int showPage = 5;
		
		if(startPage == null||startPage == 0) startPage = 1;
		
		List<User> userList = testService.findAll((startPage-1)*pageSize,pageSize);
		Integer count = userList.get(0).getCount();
		
		Paging page = new Paging(count,startPage,pageSize,showPage);
		
		model.addAttribute("isShowStart1", page.isShowStart1());
		model.addAttribute("isShowEnd1", page.isShowEnd1());
		model.addAttribute("page", page);
		model.addAttribute("userList", userList);
		
		return "userList";
	}
	
	@RequestMapping("updateUser")
	public void updateUser(HttpServletResponse response,HttpServletRequest request,
			HttpSession session,Model model,User user){
		boolean p = testService.updateUser(user);
		try {
			PrintWriter out = response.getWriter();
			if(p){
				out.print(1);
				out.close();
			}else{
				out.print(0);
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("addUser")
	public void addUser(HttpServletResponse response,HttpServletRequest request,
			HttpSession session,Model model,User user){
		user.setEnable(1);
		boolean p = testService.addUser(user);
		
		try {
			PrintWriter out = response.getWriter();
			if(p){
				out.print(1);
				out.close();
			}else{
				out.print(0);
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("deleteUser")
	public void deleteUser(HttpServletResponse response,HttpServletRequest request,
			HttpSession session,Model model,Integer id){
		boolean p = testService.deleteUser(id);
		try {
			PrintWriter out = response.getWriter();
			if(p){
				out.print(1);
				out.close();
			}else{
				out.print(0);
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("deletes")
	public void deletes(HttpServletResponse response,HttpServletRequest request,
			HttpSession session,Model model,String ids){
		boolean p = testService.deletes(ids);
		System.out.println(ids);
		try {
			PrintWriter out = response.getWriter();
			if(p){
				out.print(1);
				out.close();
			}else{
				out.print(0);
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping("exit")
	public void exit(HttpServletResponse response,HttpServletRequest request,
			HttpSession session){
		
		session.removeAttribute("user");
		
		try {
			PrintWriter out = response.getWriter();
			
			out.print(1);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
