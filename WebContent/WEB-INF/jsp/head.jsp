<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>demo</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 引入 echarts.js -->
	<script type="text/javascript" src="<%=path %>/js/jquery-1.11.0.min.js"></script>
    <script src="<%=path %>/js/echarts.js"></script>
    <script src="<%=path %>/js/china.js"></script>
  </head>
<header class="main-header">
	<div class="logo"><a href=""><img src="<%=path%>/static/images/logo.png" ></a></div>
	<nav class="menu">
		<ul>
			<li class="home"><a href="<%=path %>/jsp/index.jsp">首页</a></li>
			<li class="monitor"><a href="<%=path %>/jsp/monite.jsp">数据实时监测</a></li>
			<li class="count"><a href="<%=path %>/jsp/count.jsp">数据统计与分析</a></li>
			<li class="forecast"><a href="<%=path %>/jsp/forecast.jsp">预测与预警</a></li>
			<li class="chart"><a href="<%=path %>/jsp/chart.jsp">报表管理</a></li>
		</ul>
	</nav>
</header>