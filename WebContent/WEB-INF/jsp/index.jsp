<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>首页</title>
<link href="<%=path%>/static/css/basic.css" rel="stylesheet"/>
<link href="<%=path%>/static/css/page.css" rel="stylesheet"/>
</head>
<body class="home">
<jsp:include page="head.jsp" flush="true" />
<jsp:include page="leftBar.html" flush="true" />
    <section class="main-container">
    	<dl class="home-title">
    		<dt>monitoring & analysis</dt>
    		<dd>数据监测分析</dd>
    	</dl>
    	<ul class="home-type clearfix">
    		<li>
    			<a href="<%=path %>/jsp/monite.jsp">
	    			<div class="hexagon"><i class="icon icon-type1"></i></div>
	    			<div class="title">数据实时监测</div>
	    			<div class="info">生产数据：土地（温度，湿度，PH，等）   空气（-温度，湿度，二氧化碳）光照； 天气数据：气象局，环保局</div>
    			</a>
    		</li>
    		<li>
    			<a href="<%=path %>/jsp/count.jsp">
	    			<div class="hexagon"><i class="icon icon-type2"></i></div>
	    			<div class="title">数据统计与分析</div>
	    			<div class="info">一段时间生产数据统计      产量统计      产量与销售量对比分析      成本统计</div>
	    		</a>
    		</li>
    		<li>
    			<a href="<%=path %>/jsp/forecast.jsp">
	    			<div class="hexagon"><i class="icon icon-type3"></i></div>
	    			<div class="title">预测与预警</div>
	    			<div class="info">生生产指标预警      环境预警      病虫害预测预警      产量预测</div>
	    		</a>
    		</li>
    		<li>
    			<a href="<%=path %>/jsp/chart.jsp">
	    			<div class="hexagon"><i class="icon icon-type4"></i></div>
	    			<div class="title">报表管理</div>
	    			<div class="info">库存报表      销售报表      收入报表      成本报表</div>
	    		</a>
    		</li>
    	</ul>
    	<dl class="home-title">
    		<dt>data management</dt>
    		<dd>数据管理</dd>
    	</dl>
    	<ul class="home-link clearfix">
    		<li>
    			<div class="hexagon"><i class="icon icon-link1"></i></div>
    			<dl class="linkText">
    				<dt>生产管理</dt>
    				<dd>
    					<a href="">生产订单</a>
    					<a href="">生产计划</a>
    					<a href="">生产过程</a>
    					<a href="">生产咨询</a>
    				</dd>
    			</dl>
    		</li>
    		<li>
    			<div class="hexagon"><i class="icon icon-link2"></i></div>
    			<dl class="linkText">
    				<dt>库存管理</dt>
    				<dd>
    					<a href="">采集管理</a>
    					<a href="">入库管理</a>
    				</dd>
    			</dl>
    		</li>
    		<li>
    			<div class="hexagon"><i class="icon icon-link3"></i></div>
    			<dl class="linkText">
    				<dt>市场管理</dt>
    				<dd>
    					<a href="">供货管理</a>
    				</dd>
    			</dl>
    		</li>
    		<li>
    			<div class="hexagon"><i class="icon icon-link4"></i></div>
    			<dl class="linkText">
    				<dt>物流管理</dt>
    				<dd>
    					<a href="">运输车辆管理</a>
    					<a href="">保鲜管理</a>
    				</dd>
    			</dl>
    		</li>
    	</ul>
    </section>
    <script src="<%=path%>/static/js/jquery-3.1.1.min.js"></script>
    <script src="<%=path%>/static/js/common.js"></script>
</body>
</html>