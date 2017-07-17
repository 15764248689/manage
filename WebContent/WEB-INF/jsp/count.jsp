<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("utf-8");
%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>首页</title>
<script src="<%=path%>/static/js/jquery-3.1.1.min.js"></script>
<script src="<%=path%>/static/js/common.js"></script>
<link href="<%=path%>/static/css/basic.css" rel="stylesheet">
<link href="<%=path%>/static/css/page.css" rel="stylesheet">
</head>
<body class="count">
	 <jsp:include page="head.jsp" flush="true" />
    <jsp:include page="leftBar.html" flush="true" />
    <section class="main-container clearfix">
        <div class="location">
            <i class="icon icon-count"></i>数据统计与分析
        </div>
        <div class="common-section count-left" style = "width:100%">
            <div class="common-title">生产数据统计</div>
            <div id = "production_short" style = "height:320px">图片高度310px</div>
        </div>
<!--    <div class="common-section count-right">
            <div class="common-title">产量统计</div>
            <div id = "production" style = "height:320px">图片高度310px</div>
        </div> -->
        <div class="common-section count-left">
            <div class="common-title">产量与销售量对比</div>
            <div id = "salesProduc" style = "height:320px">图片高度310px</div>
        </div>        
        <div class="common-section count-right">
            <div class="common-title">成本统计</div>
            <div id = "cost" style = "height:320px">图片高度310px</div>
        </div>
    </section>
    
</body>
</html>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var production_short = echarts.init(document.getElementById('production_short'));
   // var production = echarts.init(document.getElementById('production'));
	var salesProduc = echarts.init(document.getElementById('salesProduc'));
	var cost = echarts.init(document.getElementById('cost'));
	
	var option1,option2,option3;
	
	option1 = {
    tooltip : {trigger: 'axis'},
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    yAxis : [{type : 'value'}]
};
	option2 = {
    tooltip : {trigger: 'axis'},
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    yAxis : [{type : 'value'}]
};
	option3 = {
    tooltip : {trigger: 'axis'},
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    yAxis : [{type : 'value'}]
};
/* var	option1 = {
    tooltip : {
        trigger: 'axis'
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
}; */
    
	
	//设置成本统计
    $.ajax({
    	type:"post",
		url:"<%=path%>/contro/analysisAction/getCost",
		dataType:"json",
		success:function(msg){
			option1.title = msg[0].title;
			option1.series = msg[0].series;
			option1.xAxis = msg[0].xAxis;
			option1.yAxis = [{
				position:"left",
				name:"单位/元",
				axisLabel : {formatter: '{value}'},
	        }];
			option1.legend = msg[0].legend;
			option1.series[0].areaStyle = {normal: {color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                offset: 0,
                color: '#00FF00'
            }, {
                offset: 1,
                color: '#00FF00'
            }])}};
			
			cost.setOption(option1);
		},
		error:function(){
			alert("服务器错误");
		}
	});
	//生产数据统计
    $.ajax({
    	type:"post",
		url:"<%=path%>/contro/analysisAction/getShortProduc",
		dataType:"json",
		success:function(msg){
			option2.series = msg[0].series;
			option2.xAxis = msg[0].xAxis;
			option2.yAxis = [{
				position:"left",
				name:"土壤温度",
				axisLabel : {formatter: '{value}°C'},
	            inverse: true
	        }, { 
	        	position:"left",
	            offset:35,
	            name:"墒情",
	            axisLabel : {formatter: '{value}%'},
	        }, { 
	        	position:"left",
	            offset:80,
	            name:"Co2/ppm",
	            axisLabel : {formatter: '{value}'},
	            inverse: true
	        },{
	        	position:"right",
	        	name:"土壤PH",
	        	axisLabel : {formatter: '{value}'},
	        }, { 
	        	position:"right",
	        	offset:35,
	        	name:"风力",
	            axisLabel : {formatter: '{value}级'},
	            inverse: true
	        }, { 
	        	position:"right",
	        	offset:80,
	        	name:"光照/Lx",
	        	axisLabel : {formatter: '{value}'},
	        }];
			
			
			
			option2.legend = msg[0].legend;
			
			production_short.setOption(option2);
		},
		error:function(){
			alert("服务器错误");
		}
	});
	
	//产量统计
  <%--   $.ajax({
    	type:"post",
		url:"<%=path%>/contro/analysisAction/getProduc",
		dataType:"json",
		success:function(msg){
			
			option1.series = msg[0].series;
			option1.xAxis = [{
		        type : 'value',
		        position: 'top',
		    }];
				option1.yAxis = [{
		        type : 'category',
		        axisLine: {show: false},
		        axisLabel: {show: false},
		        axisTick: {show: false},
		        splitLine: {show: false},
		        data : ['一月', '二月', 
		                '三月', '四月', 
		                '五月', '六月', 
		                '七月', '八月', 
		                '九月', '十月', 
		                '十一月', '十二月']
		    }];
			option1.legend = msg[0].legend;
			production.setOption(option1);
		},
		error:function(){
			alert("服务器错误");
		}
	}); --%>
	
	//产量与销量对比
    $.ajax({
    	type:"post",
		url:"<%=path%>/contro/analysisAction/getProducSales",
		dataType:"json",
		success:function(msg){
			option3.series = msg[0].series;
			option3.xAxis = msg[0].xAxis;
			option3.legend = msg[0].legend;
			
			option3.yAxis = [{
				position:"left",
				name:"单位/斤",
				axisLabel : {formatter: '{value}'},
	        }];
			
			salesProduc.setOption(option3);
		},
		error:function(){
			alert("服务器错误");
		}
	});
    
</script>