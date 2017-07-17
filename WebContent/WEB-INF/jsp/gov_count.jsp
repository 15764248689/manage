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
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>首页</title>

<script src="<%=path%>/js/timelineOption.js"></script>

<link href="<%=path%>/static/css/basic.css" rel="stylesheet"/>
<link href="<%=path%>/static/css/page.css" rel="stylesheet"/>
<link href="<%=path%>/static/css/govt.css" rel="stylesheet"/>

<script src="<%=path %>/js/echarts.js"></script>   
<script src="<%=path %>/js/baiduecharts.js"></script> 
<script src="<%=path %>/js/shandong.js"></script>
<script src="<%=path %>/js/highcharts.js"></script>
<script src="<%=path %>/js/highcharts-more.js"></script>
<script src="<%=path %>/js/exporting.js"></script>

</head>
<body class="count">
	<jsp:include page="gov_head.jsp" flush="true" />
    <jsp:include page="gov_leftBar.html" flush="true" />
    <section class="main-container clearfix">
        <div class="location">
            <i class="icon icon-count"></i>数据统计与分析
        </div>
        <div class="clearfix">
            <div class="common-section count-left">
                <div class="common-title">土地使用情况统计</div>
                <div id = "chart1" style = "height:450px">图片高度550px</div>
            </div>
            <div class="common-section count-right">
                <div class="common-title">种植分布统计</div>
                <div id = "chart2" style = "height:450px">图片高度550px</div>
            </div>
            <div class="common-section count-left">
                <div class="common-title">产量统计</div>
                <div id = "chart3" style = "height:300px">图片高度290px</div>
            </div>        
            <div class="common-section count-right">
                <div class="common-title">农产品价格统计</div>
                <div id = "chart4" style = "height:290px">图片高度290px</div>
            </div>    
        </div>
        
       <!--  <div class="common-section">
            <div class="common-title">价格统计</div>
            <div id = "chart5" style = "height:330px">图片高度330px</div>
        </div> -->
    </section>
    <script src="../static/js/jquery-3.1.1.min.js"></script>
    <script src="../static/js/common.js"></script>
</body>
</html>

<script>
<!-- 土地使用情况 -->
$.get('<%=path%>/js/qingdao.json', function (chinaJson) {
     echarts.registerMap('jimo', chinaJson);
     var chart1 = echarts.init(document.getElementById('chart1'));
     option1 = {
             title: {
                 text: '',
                 subtext: '',
                 sublink: '',
                 left: 'right'
             },
             tooltip: {
                 trigger: 'item',
                 showDelay: 0,
                 transitionDuration: 0.2,
                 formatter: function (params) {
                     var value = (params.value + '').split('.');
                     value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,');
                     return params.seriesName + '<br/>' + params.name + ': ' + value+"亩";
                 }
             },
             visualMap: {
                 left: 'right',
                 min: 1000,
                 max: 3000000,
                 inRange: {
                     color: ['#008B00', '#00CD00', '#00FF00', '#00FF7F', '#43CD80', '#9AFF9A', '#7CCD7C', '#66CD00', '#C0FF3E', '#9ACD32',]
                 },
                 text:['最高','最低'],            
                 calculable: true
             },
             toolbox: {
                 show: true,
                 //orient: 'vertical',
                 left: 'left',
                 top: 'top',
                 feature: {
                     dataView: {readOnly: false},
                     restore: {},
                     saveAsImage: {}
                 }
             },
             series: [
                 {
                     name: '',
                     type: 'map',
                     roam: true,
                     map: 'jimo',
                     itemStyle:{
                         emphasis:{label:{show:true}}
                     },
                     // 文本位置修正
                     textFixed: {
                         Alaska: [20, -20]
                     },
                     data:[
                         {name: '市南区', value: 1458},
                         {name: '市北区', value: 1936},
                         {name: '崂山区', value: 14342},
                         {name: '李沧区', value: 2074},
                         {name: '城阳区', value: 121895},
                         {name: '胶州市', value: 995000},
                         {name: '即墨市', value: 1565797},
                         {name: '平度市', value: 2796308},
                         {name: '莱西市', value: 1367325},
                         {name: '黄岛区', value: 1162727},
                     ]
                 }
             ]
         };
     chart1.setOption(option1);
 });
 
/* 种植分布统计 */
option2 = {
	tooltip : {
        trigger: 'item',
        //formatter: "{a} <br/>{b} : {c}({d}%)"
        formatter: function (params, ticket, callback) {
            /* $.get('detail?name=' + params.name, function (content) {
                callback(ticket, toHTML(content)); 
            }); */
            var data = params.data;
            return params.name+"<br/> 蓝莓："+
            (data.value*0.32).toFixed(2)+"亩<br/> 葡萄："+
            (data.value*0.30).toFixed(2)+"亩<br/> 草莓："+
            (data.value*0.38).toFixed(2)+"亩<br/> 种植面积百分比:"+params.percent+"%" ;
        }
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
            name:'种植面积',
            type:'pie',
            radius : [30, 120],
            roseType : 'area',
            max: 40,                // for funnel
            sort : 'ascending',     // for funnel
            data:[
  				/* {name: '市南区', value: 1458},
				{name: '市北区', value: 1936}, */
				{name: '崂山区', value: 4342},
				/* {name: '李沧区', value: 2074}, */
				{name: '城阳区', value: 71895},
				{name: '胶州市', value: 95000},
				{name: '即墨市', value: 65797},
				{name: '平度市', value: 96308},
				{name: '莱西市', value: 67325},
				{name: '黄岛区', value: 62727},
/*    				{name: '市南区', value: 1458},
				{name: '市北区', value: 1936},
				{name: '崂山区', value: 94342},
				{name: '李沧区', value: 2074},
				{name: '城阳区', value: 71895},
				{name: '胶州市', value: 95000},
				{name: '即墨市', value: 565797},
				{name: '平度市', value: 796308},
				{name: '莱西市', value: 367325},
				{name: '黄岛区', value: 162727}, */
            ]
        }
    ]
};
var chart2 = echarts.init(document.getElementById('chart2'));
chart2.setOption(option2);


/* 产量统计 */
 option3 = {
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['蓝莓','葡萄','草莓']
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
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : ['二月','三月','四月','五月','六月','七月']
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel : {formatter: '{value}斤'}
		        }
		    ],
		    series : [
		        {
		            name:'蓝莓',
		            type:'line',
		            smooth:true,
		            itemStyle: {normal: {areaStyle: {type: 'default'}}},
		            data:[2800, 2600, 2700, 3300, 2900, 3000]
		        },
		        {
		            name:'葡萄',
		            type:'line',
		            smooth:true,
		            itemStyle: {normal: {areaStyle: {type: 'default'}}},
		            data:[3000, 3500, 3100, 3700, 4000, 3400]
		        },
		        {
		            name:'草莓',
		            type:'line',
		            smooth:true,
		            itemStyle: {normal: {areaStyle: {type: 'default'}}},
		            data:[2700, 2900, 3100, 3000, 2800, 2900]
		        }
		    ]
		};

var chart3 = echarts.init(document.getElementById('chart3'));
chart3.setOption(option3);


/* <!-- 价格预测 --> */
/* var option5 = {
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['蓝莓','葡萄','草莓']
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
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : ['六月','七月','八月','九月','十月','十一月']
        }
    ],
    yAxis : [
        {
            type : 'value',
            axisLabel : {
                formatter: '{value}元/斤'
            }
        }
    ],
    series : [
        {
            name:'蓝莓',
            type:'line',
            data:[80, 70, 65, 65, 30, 30],
        },
        {
            name:'葡萄',
            type:'line',
            data:[15, 18, 14, 11, 12, 10],
        },
        {
            name:'草莓',
            type:'line',
            data:[5, 4.5, 4, 4.1, 3.7, 4.2],
        },
    ]
};
var chart5 = echarts.init(document.getElementById('chart5'));
chart5.setOption(option5); */

<!--农产品价格统计 -->
var yMax = 500;
var dataShadow = [];

option4 = {
 	legend: {
        data:['蓝莓', '葡萄',"草莓"],
    },
    tooltip : {
        trigger: 'axis'
    },
    xAxis:{
        type: 'category',
        data: ["一月",'二月','三月','三月','四月','五月','六月']
    },
    yAxis: {
    	name:"元/斤",
        axisLine: {
            show: true
        }
    },
    series: [
        {
        	name:"蓝莓",
            type: 'bar',
            itemStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#83bff6'},
                            {offset: 0.5, color: '#188df0'},
                            {offset: 1, color: '#188df0'}
                        ]
                    ),
                    barBorderRadius:10,
                    
                },
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
            data: [88,60,75,70,60,50]
        },
        {
        	name:"葡萄",
            type: 'bar',
            itemStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#CD8500'},
                            {offset: 0.5, color: '#CD8500'},
                            {offset: 1, color: '#CDBE70'}
                        ]
                    ),
                    barBorderRadius: 10,
                },
                emphasis: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#CD8500'},
                            {offset: 0.7, color: '#CD8500'},
                            {offset: 1, color: '#CDBE70'}
                        ]
                    ),
                    barBorderRadius: 10,
                }
            },
            data: [17,18,20,14,18,13]
        },
        {
        	name:"草莓",
            type: 'bar',
            itemStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#66CDAA'},
                            {offset: 0.5, color: '#66CDAA'},
                            {offset: 1, color: '#6B8E23'}
                        ]
                    ),
                    barBorderRadius: 10,
                },
                emphasis: {
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1,
                        [
                            {offset: 0, color: '#66CDAA'},
                            {offset: 0.7, color: '#66CDAA'},
                            {offset: 1, color: '#6B8E23'}
                        ]
                    ),
                    barBorderRadius: 10,
                }
            },
            data: [14,9,6,6,5,7]
        },
    ]
};


var chart4 = echarts.init(document.getElementById('chart4'));
chart4.setOption(option4);  



 
</script>