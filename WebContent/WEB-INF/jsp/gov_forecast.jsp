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
<!-- 引入 echarts.js -->
	<script type="text/javascript" src="<%=path %>/js/jquery-1.11.0.min.js"></script>
    <script src="<%=path %>/js/echarts.js"></script>   
    <script src="<%=path %>/js/baiduecharts.js"></script> 
    <script src="<%=path %>/js/shandong.js"></script>
    <script src="<%=path %>/js/highcharts.js"></script>
    <script src="<%=path %>/js/highcharts-more.js"></script>
    <script src="<%=path %>/js/exporting.js"></script>
    <script src="<%=path %>/js/shandong.js"></script>
 
</head>
<body class="forecast">
	<jsp:include page="gov_head.jsp" flush="true" />
    <jsp:include page="gov_leftBar.html" flush="true" />
    <section class="main-container clearfix">
        <div class="location">
            <i class="icon icon-forecast"></i>预测与预警
        </div>
       <!--  <div class="common-section">
           <div class="common-title">土壤环境预测预警</div>
           <div id="main" class="main" style = "width:100%;height:200px"></div>
           <div id="main2" class="main" style = "width:100%;height:200px"></div>
           <div id="main3" class="main" style = "width:100%;height:200px"></div>
        </div> -->
       
        <div class="common-section">
            <div class="common-title">自然环境预警</div>
             <iframe  class="common-section"  src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=12" style="margin-bottom:0px;padding-left: 220px;height:90px;border: #ddd 0px solid;" width="100%"></iframe>
            <div id="env_main" class="main" style = "width:100%;height:320px"></div>
        </div>
        <div class="clearfix">
            <div class="common-section count-left">
                <div class="common-title">病虫害预测</div>
                 <div id="bug_container" class="main" style = "width:100%;height:430px"></div>
            </div>
            <div class="common-section count-right">
                <div class="common-title">产量预测预警</div>
                <div id="prod_container" style="min-width:100%; height: 430px; margin: 0 auto"></div>
            </div>    
        </div>
        <div class="common-section">
            <div class="common-title">农产品价格预测</div>
            <div id="price_container" style="min-width:100%; height: 430px; margin: 0 auto"></div>
        </div>
           
    </section>
    <script src="<%=path %>/static/js/jquery-3.1.1.min.js"></script>
    <script src="<%=path %>/static/js/common.js"></script>
    <script type="text/javascript">
     
          
        //自然环境预测预警
        require.config({
            paths: {
                echarts: '../build/dist'
            }
        });
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/line' 
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var env_myChart = ec.init(document.getElementById('env_main')); 
                env_option = {
                	    tooltip : {
                	        trigger: 'axis',
                	        formatter: function (params, ticket, callback) {
                	        	if(params[2].data>30){
                	        		return params[1].name+"<br/> 降水量:"+params[1].data+"<br/> 蒸发量:"+params[0].data+"<br/>平均温度:"+params[2].data+"<br/>最高气温可达"+params[2].data+"℃以上，部分地区将超过37℃。请采取措施，做好相关防范工作。";
                	        	}else{
                	        		return params[1].name+"<br/> 降水量:"+params[1].data+"<br/> 蒸发量:"+params[0].data+"<br/>平均温度:"+params[2].data;
                	        	}
                	        }

                	    },
                	    toolbox: {
                	        show : false,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType: {show: true, type: ['line', 'bar']},
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    legend: {
                	        data:['蒸发量','降水量','平均温度'],
                	        x : 'center',
                	        y : 'bottom',
                	    },
                	    xAxis : [
                	        {
                	            type : 'category',
                	            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                	        }
                	    ],
                	    yAxis : [
                	        {
                	            type : 'value',
                	            name : '水量',
                	            axisLabel : {
                	                formatter: '{value} ml'
                	            }
                	        },
                	        {
                	            type : 'value',
                	            name : '温度',
                	            axisLabel : {
                	                formatter: '{value} °C'
                	            }
                	        }
                	    ],
                	    series : [

                	        {
                	            name:'蒸发量',
                	            type:'bar',
                	            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
                	        },
                	        {
                	            name:'降水量',
                	            type:'bar',
                	            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                	        },
                	        {
                	            name:'平均温度',
                	            type:'line',
                	            yAxisIndex: 1,
                	            data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 30.3, 31.4, 23.0, 16.5, 12.0, 6.2]
                	        }
                	    ]
                	};
        
                // 为echarts对象加载数据 
                env_myChart.setOption(env_option); 
                
            }
        ); 
        
       //病虫害预测预警
       $.get('<%=path%>/js/shandong.json', function (chinaJson) {
            echarts.registerMap('china1', chinaJson);
            var chart = echarts.init(document.getElementById('bug_container'));
            option5 = {
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
                            return params.seriesName + '<br/>' + params.name + ': ' + value;
                        }
                    },
                    visualMap: {
                        left: 'right',
                        min: 0,
                        max: 4,
                        inRange: {
                            color: ['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026']
                        },
                        text:['High','Low'],            
                        calculable: true
                    },
                    toolbox: {
                        show: true,
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
                            map: 'china1',
                            itemStyle:{
                                emphasis:{label:{show:true}}
                            },
                            textFixed: {
                                Alaska: [20, -20]
                            },
                            data:[
                                  {name: '济南市', value: 2},
                                  {name: '青岛市',value: 1},
                                  {name: '烟台市',value: 1},
                                  {name: '威海市', value: 3},
                                  {name: '日照市', value: 3},
                                  {name: '潍坊市', value: 4},
                                  {name: '莱芜市', value: 3},
                                  {name: '泰安市', value: 4},
                                  {name: '济宁市', value: 2},
                                  {name: '菏泽市', value: 4},
                                  {name: '聊城市', value: 3},
                                  {name: '枣庄市', value: 3},
                                  {name: '滨州市', value: 3},
                                  {name: '德州市', value: 4},
                                  {name: '东营市', value: 2},
                                  {name: '淄博市', value: 3},
                                  {name: '临沂市', value: 3}
                            ]
                        }
                    ]
                };
            chart.setOption(option5);
        });  
        //产量预测预警
        Highcharts.chart('prod_container', {
            chart: {
                type: 'line'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: ['一月', '二月', '三月', '四月', '五月', '六月']
            },
            yAxis: {
                title: {
                    text: '产量（斤）'
                }
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true
                    },
                    enableMouseTracking: true
                }
            },
            series: [{
                name: '计划',
                data: [7000, 6900, 6500, 4500, 6500, 5200]
            }, {
                name: '实际',
                data: [6750, 7050, 5700, 5400,6700, 5100]
            }]
        });
        
        //农产品价格预测预警
        $(function () {
            var chart = Highcharts.chart('price_container', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: ''
                },
                subtitle: {
                    text: ''
                },
                xAxis: {
                    categories: ['一月', '二月', '三月', '四月', '五月', '六月','七月','八月','九月','十月','十一月','十二月']
                },
                yAxis: {
                    labels: {
                        x: -15
                    },
                    title: {
                        text: '价格'
                    }
                },
                series: [{
                    name: '（预测价格）价格/元/斤',
                    data: [11.5, 14.00, 9.80, 10.00, 8.20, 8.50,6.00,13.00,9.50,12.50,11.0,12.5]
                },
                {
                    name: '（真实价格）价格/元/斤',
                    data: [10, 15, 8.5, 12, 9.2, 8]
                }],
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 500
                        },
                        // Make the labels less space demanding on mobile
                        chartOptions: {
                            xAxis: {
                                labels: {
                                    formatter: function () {
                                        return this.value.replace('月', '')
                                    }
                                }
                            },
                            yAxis: {
                                labels: {
                                    align: 'left',
                                    x: 0,
                                    y: -2
                                },
                                title: {
                                    text: ''
                                }
                            }
                        }
                    }]
                }
            });
            $('#small').click(function () {
                chart.setSize(400, 300);
            });
            $('#large').click(function () {
                chart.setSize(800, 300);
            });
        });
    </script>
</body>
</html>