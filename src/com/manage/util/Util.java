package com.manage.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

public  class Util {

	/**     
	 * @discription 向页面输出一个json对象
	 * @author gengyanlong       
	 * @created 2017年5月24日 下午4:41:57     
	 * @param response
	 * @param map     
	 */
	public static void outJson(HttpServletResponse response,Map<String,Object> map){

		JsonConfig config = new JsonConfig();  
		config.setJsonPropertyFilter(new PropertyFilter()  
		{  
		    @Override  
		    public boolean apply(Object source, String name, Object value)  
		    {  
		        return value == null;  
		    }  
		});  
		try {
			PrintWriter out = response.getWriter();
			JSONArray json = JSONArray.fromObject(map,config);
			
			Object ss = JSON.toJSON(map);
			out.print(json);
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
