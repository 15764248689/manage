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
<link href="<%=path%>/static/css/govt.css" rel="stylesheet"/>
</head>
<body class="home">
	<jsp:include page="gov_head.jsp" flush="true" />
    <jsp:include page="gov_leftBar.html" flush="true" />
    <section class="main-container">
    	<dl class="home-title">
    		<dt>monitoring & analysis</dt>
    		<dd>数据监测分析</dd>
    	</dl>
    	<ul class="home-type clearfix">
    		<li>
    			<a href="<%=path %>/jsp/gov_monite.jsp">
	    			<div class="hexagon"><i class="icon icon-type1"></i></div>
	    			<div class="title">农业实时监测</div>
	    			<div class="info">生产数据：土地（温度，湿度，PH，等）   空气（-温度，湿度，二氧化碳）光照；天气数据：气象局，环保局;病虫害监测  农产品产量  农药使用监测</div>
    			</a>
    		</li>
    		<li>
    			<a href="<%=path %>/jsp/gov_count.jsp">
	    			<div class="hexagon"><i class="icon icon-type2"></i></div>
	    			<div class="title">数据统计与分析</div>
	    			<div class="info">土地使用情况统计      种植分布统计     产量统计      农产品价格统计      市场分析</div>
	    		</a>
    		</li>
    		<li>
    			<a href="<%=path %>/jsp/gov_forecast.jsp">
	    			<div class="hexagon"><i class="icon icon-type3"></i></div>
	    			<div class="title">预测与预警</div>
	    			<div class="info">土壤环境预测预警      自然环境预测预警      病虫害预测预警      产量预测预警 农产品价格预测</div>
	    		</a>
    		</li>
    		<li>
    			<a href="<%=path %>/jsp/gov_news.jsp">
	    			<div class="hexagon"><i class="icon icon-type4"></i></div>
	    			<div class="title">最新资讯</div>
	    			<div class="info">国家相关政策      地方政策补贴      农事新闻</div>
	    		</a>
    		</li>
    	</ul>
    	<dl class="home-title">
    		<dt>data management</dt>
    		<dd>数据管理</dd>
    	</dl>
    	<ul class="home-type home-type2 clearfix">
            <li>
                <div class="hexagon"><i class="icon icon-land"></i></div>
                <div class="title">土地资源管理</div>
                <div class="link"><a href="">按行政区域划分</a><a href="">按种植区域划分</a></div>
            </li>
            <li>
                <div class="hexagon"><i class="icon icon-quality"></i></div>
                <div class="title">农产品质量追溯</div>
                <div class="link"><a href="">生产档案</a><a href="">产品档案</a><a href="">流通监测</a><a href="">防伪查询</a> </div>
            </li>
            <li>
                <div class="hexagon"><i class="icon icon-internet"></i></div>
                <div class="title">农业电子商务平台</div>
                <div class="link"><a href="">农产品市场分布</a><a href="">农产品市场价格</a><a href="">农产品品牌推广</a></div>
            </li>
            <li>
                <div class="hexagon"><i class="icon icon-technology"></i></div>
                <div class="title">农业技术服务管理</div>
                <div class="link"><a href="">农业技术推广</a><a href="">农业咨询培训</a><a href="">便民服务</a></div>
            </li>
            <li>
                <div class="hexagon"><i class="icon icon-machinery"></i></div>
                <div class="title">农机管理</div>
                <div class="link"><a href="">政策补贴</a><a href="">农机调配</a></div>
            </li>
        </ul>
    </section>
    <script src="<%=path %>/static/js/jquery-3.1.1.min.js"></script>
    <script src="<%=path %>/static/js/common.js"></script>
</body>