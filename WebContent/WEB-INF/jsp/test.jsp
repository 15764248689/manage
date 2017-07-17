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
            <div id = "myChart" style = "height:320px">图片高度310px</div>
        </div>
    </section>
    
</body>
</html>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById("myChart"));
	
	
	option = {
		    title : {
		        text: "某地区蒸发量和降水量",
		        subtext: "纯属虚构"
		    },
		    tooltip : {
		        trigger: "axis"
		    },
		    legend: {
		        data:["蒸发量"]
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: ["line", "bar"]},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : "category",
		            data : ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]
		        }
		    ],
		    yAxis : [
		        {
		            type : "value"
		        }
		    ],
		    series : [
		        {
		            name:"蒸发量",
		            type:"line",
		            data:[1,2,3,4,5,6,7,8,9,10,11,12],
		            itemStyle: {
		                emphasis: {
		                    color: new echarts.graphic.LinearGradient(
		                        0, 0, 0, 1,
		                        [
		                            {offset: 0, color: '#2378f7'},
		                            {offset: 0.7, color: '#2378f7'},
		                            {offset: 1, color: '#83bff6'}
		                        ]
		                    ),
		                    barBorderRadius: 10,
		                }
		            },
		        }
		    ]
		};
	
	myChart.on('mouseover', function (params) {
	     /* myChart.dispatchAction({
	    	 type: 'highlight',
	    	    seriesName: params.seriesName,
	   		 });  */
	   		var option = myChart.getOption(); 
	     option.series[0].itemStyle = [{
	    	 normal: {
                 color:'#000',
             }
         }];
	});
	myChart.on('mouseout', function (params) {
	    /*  myChart.dispatchAction({
	    	 type: 'downplay',
	    	    seriesName: params.seriesName,
	   		 });  */
	   	var option = myChart.getOption(); 
		option.series[0].itemStyle = [{
			normal: {
                color: '#000',
            }
        }];
	     
		});
	
		myChart.setOption(option);
</script>