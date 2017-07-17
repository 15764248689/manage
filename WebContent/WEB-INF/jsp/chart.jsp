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
<!-- 引入 echarts.js -->
	<script type="text/javascript" src="<%=path %>/js/jquery-1.11.0.min.js"></script>
    <script src="<%=path %>/js/echarts.js"></script>
    <script src="<%=path %>/js/china.js"></script>
</head>
<body class="chart">
	 <jsp:include page="head.jsp" flush="true" />
    <jsp:include page="leftBar.html" flush="true" />
    <section class="main-container clearfix">
        <div class="location">
            <i class="icon icon-chart"></i>报表管理
        </div>
        <div class="clearfix">
             <div class="common-section count-left">
                <div class="common-title">产量报表</div>
                 <div id="main0" class="main" style = "width:100%;height:320px"></div>
            </div>        
            <div class="common-section count-right">
                <div class="common-title">销售报表</div>
                <div id="main2" class="main" style = "width:100%;height:320px"></div>
            </div>
        </div>   
        <div class="common-section count-left">
                <div class="common-title">库存报表</div>
                <div id="main3" class="main" style = "width:100%;height:375px"></div>
            </div>    
        <div class="common-section count-right">
            <div class="common-title">收入成本报表</div>
             <div id="main1" class="main" style = "width:100%;height:375px"></div>
         </div>     
    </section>
    <script src="<%=path%>/static/js/jquery-3.1.1.min.js"></script>
    <script src="<%=path%>/static/js/common.js"></script>
    <script type="text/javascript">
    var production = echarts.init(document.getElementById('main0'));
    var	option1 = {
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
    	};
   //产量统计
    $.ajax({
    	type:"post",
		url:"<%=path%>/contro/analysisAction/getProduc",
		dataType:"json",
		success:function(msg){
			
			option1.series = msg[0].series;
			option1.xAxis = [{
		        type : 'value',
		        position: 'top',
		        axisLabel : { formatter: '{value}斤'  }
		    }];
				option1.yAxis = [{
		        type : 'category',
		        show:true,
		        axisLine: {show: false},
		        axisLabel: {show: true},
		        axisTick: {show: false},
		        splitLine: {show: false},
		        data : ['一月', '二月', 
		                '三月', '四月', 
		                '五月', '六月']
		    }];
			option1.legend = msg[0].legend;
			production.setOption(option1);
		},
		error:function(){
			alert("服务器错误");
		}
	});
   
   
    var option_earn ;
    var option_store ;
    var option_sale;
    optionsAjax = function(userid)  {
      	 $.ajax({  
               type : "post",  
               async : false, //同步执行  
               url:"<%=basePath%>ent/chart",  
               dataType:"json", //返回数据形式为json  
               success:function(result) {  
              	  option_earn=eval(result.data.earn);
              	  option_store=eval(result.data.store);
              	  option_sale=eval(result.data.sale);
               },  
               error : function(errorMsg) {  
                   alert("请求数据出错");  
               }  
           });
     };
     optionsAjax(1);
     //==============================================================
    optionpie = {
    title : {
        text: '',
        subtext: '',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        x : 'center',
        y : 'top',
        data:['育种','人力','农药','日常','其他']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true,
                type: ['pie', 'funnel']
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        
        {
            name:'成本报表（单位/元）',
            type:'pie',
            radius : [30, 110],
            center : ['50%', '50%'],
            roseType : 'area',
            data:[
                {value:20000, name:'育种'},
                {value:25000, name:'人力'},
                {value:25000, name:'农药'},
                {value:18000, name:'日常'},
                {value:12000, name:'其他'}
            ]
        }
    ]
};
     //==============================================================
     var myChart0 = echarts.init(document.getElementById('main3'));
     var myChart1 = echarts.init(document.getElementById('main1'));
     var myChart2 = echarts.init(document.getElementById('main2'));
    // 为echarts对象加载数据 
    myChart0.setOption(option_store); 
    myChart1.setOption(optionpie); 
    myChart2.setOption(option_sale); 
    </script>
</body>
</html>