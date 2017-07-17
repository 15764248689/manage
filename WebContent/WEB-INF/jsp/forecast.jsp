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
    <script src="<%=path %>/js/shandong.js"></script>
</head>
<body class="forecast">
	<jsp:include page="head.jsp" flush="true" />
    <jsp:include page="leftBar.html" flush="true" />
    <section class="main-container clearfix">
        <div class="location">
            <i class="icon icon-forecast"></i>预测与预警
        </div>
        <div class="common-section">
            <div class="common-title">生产指标预警</div>
             <div id="main2" class="main" style = "width:100%;height:310px"></div>
             <div id="main3" class="main" style = "width:100%;height:310px"></div>
        </div>
        <div class="common-section">
            <div class="common-title">环境预警</div>
             <div id="main4" class="main" style = "width:100%;height:310px"></div>
        </div>
        <div class="common-section count-left">
            <div class="common-title">病虫害预警</div>
            <div id="main5" class="main" style = "width:100%;height:420px"></div>
        </div>
        <div class="common-section count-right">
            <div class="common-title">库存预警</div>
            <ul class="forecast-list">
                <li class="unRead"><span class="fr">2017-06-02 17:32</span><i class="icon icon-bell"></i>葡萄剩余库3箱，请尽快补充！</li>
                <li><span class="fr">2017-06-01 14:22</span><i class="icon icon-bell"></i>葡萄剩余库存5箱,请尽快补充！</li>
                <li><span class="fr">2017-05-31 14:22</span><i class="icon icon-bell"></i>葡萄剩余库存2箱,请尽快补充！</li>
                <li><span class="fr">2017-05-30 13:27</span><i class="icon icon-bell"></i>葡萄剩余库存4箱,请尽快补充！</li>
                <li><span class="fr">2017-05-28 14:40</span><i class="icon icon-bell"></i>葡萄剩余库存5箱,请尽快补充！</li>
                <li><span class="fr">2017-05-26 14:22</span><i class="icon icon-bell"></i>葡萄剩余库存4箱,请尽快补充！</li>
                <li><span class="fr">2017-05-22 15:30</span><i class="icon icon-bell"></i>葡萄剩余库存5箱,请尽快补充！</li>
                <li><span class="fr">2017-05-21 14:22</span><i class="icon icon-bell"></i>葡萄剩余库存5箱,请尽快补充！</li>
            </ul>
        </div>       
    </section>
    <script src="<%=path%>/static/js/jquery-3.1.1.min.js"></script>
    <script src="<%=path%>/static/js/common.js"></script>
    <script type="text/javascript">
    var temp_min;
    var temp_max;
    var axisData;
    var series_data;
    var data_food;
    var markPoint_data;
    var temp_markPoint_data;
    optionsAjax = function(userid)  {
     	 $.ajax({  
              type : "post",  
              async : false, //同步执行  
              url:"<%=basePath%>ent/warn",  
              dataType:"json", //返回数据形式为json  
              success:function(result) {  
            	//温度最高值
	          	temp_min=eval(result.data.temp_min);
            	//温度最低值
	          	temp_max=eval(result.data.temp_max);
	          	axisData =eval(result.data.ph_axisData);  
	          	series_data =eval(result.data.ph_series_data);
	          	console.log(result);
	          	//土壤有机物含量数据
	          	data_food = eval(result.data.data_food);
	          	markPoint_data =eval(result.data.markPoint_data);
	          	temp_markPoint_data = eval(result.data.temp_markPoint_data);
	          	
              },  
              error : function(errorMsg) {  
                  alert("请求数据出错");  
              }  
          });
    };
    optionsAjax(1);
    //=============================PH值预警==================================
    option2 = {
   		title: {
   	        text: 'PH值预警',
   	        left: 0
   	    },
        tooltip : {
            trigger: 'axis',
            showDelay: 0           
        },
        legend: {
            data:['PH值'],
            borderColor:'#ccc'
        },
        toolbox: {
            y : -30,
            show : true,
            feature : {
                mark : {show: true},
                dataZoom : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        dataZoom : {
            show : true,
            realtime: true,
            start : 50,
            end : 100
        },
        grid: {
            left: '3%',
            right: '2%',
            bottom: '15%'
        },
        toolbox: {
	        show: true,
	        feature: {
	            dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: {}
	        }
	    },
        xAxis : [
                 {
                     type : 'category',
                     position:'bottom',
                     boundaryGap : false,
                     axisTick: {onGap:false},
                     splitLine: {show:false},
                     data : axisData
                 }
        ],
        yAxis : [
            {
            	type: 'value',
     	        axisLabel: {
     	            formatter: '{value}'
     	        }
            }
        ],
        series : [
            {
                name:'PH值',
                type:'line',
                symbol: 'none',
                itemStyle : {  
        		   normal : {  
        			 color:'#08a9f2'  ,
        	         lineStyle:{   
        	            color:'#08a9f2'  
                              }   
                            }   
                },   
                data:series_data,
                markPoint: {
	                data:  markPoint_data
	            }
            },
            {
                name:'标准值',
                type:'line',
                symbol: 'none',
                itemStyle : {  
        		   normal : {  
        	         lineStyle:{   
        	            color:'#FF0000' ,
        	            type:'dashed'
                              }   
                            }   
                },   
                data:[6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6]
            }
        ]
    };
    myChart2 = echarts.init(document.getElementById('main2'));
    myChart2.setOption(option2);
    
    //=============================未来一周气温变化===========================
    option3 = {
    	    title: {
    	        text: '周气温变化',
    	        subtext: ''
    	    },
    	    tooltip: {
    	        trigger: 'axis'
    	    },
    	    legend: {
    	        data:['当前气温','最低气温']
    	    },
    	    grid: {
    	        left: '3%',
    	        right: '2%',
    	        bottom: '15%'
    	    },
    	    toolbox: {
    	        show: true,
    	        feature: {
    	            dataZoom: {
    	                yAxisIndex: 'none'
    	            },
    	            dataView: {readOnly: false},
    	            magicType: {type: ['line', 'bar']},
    	            restore: {},
    	            saveAsImage: {}
    	        }
    	    },
    	    xAxis:  {
    	        type: 'category',
    	        boundaryGap: false,
    	        data: ['周一','周二','周三','周四','周五','周六','周日']
    	    },
    	    yAxis: {
    	        type: 'value',
    	        axisLabel: {
    	            formatter: '{value}℃'
    	        }
    	    },
    	    series: [
    	        {
    	            name:'当前气温',
    	            type:'line',
    	            data:temp_max,
    	            itemStyle : {  
             		   normal : {  
             			 color:'GREEN', 
             	         lineStyle:{   
             	            color:'GREEN' 
                                   }   
                                 }   
                     },
    	            markPoint: {
    	                data: temp_markPoint_data
    	            } 
    	        },
    	        {
                    name:'（高）标准值',
                    type:'line',
                    symbol: 'none',
                    itemStyle : {  
            		   normal : {  
            	         lineStyle:{   
            	            color:'YELLOW' ,
            	            type:'dashed'
                                  }   
                                }   
                    },   
                    data:[25, 25,25,25,25,25,25]
                },
    	        {
                    name:'（低）标准值',
                    type:'line',
                    symbol: 'none',
                    itemStyle : {  
            		   normal : {  
            	         lineStyle:{   
            	            color:'#FF0000' ,
            	            type:'dashed'
                                  }   
                                }   
                    },   
                    data:[16, 16, 16, 16,16, 16,16]
                }
    	    ]
    	};

    myChart3 = echarts.init(document.getElementById('main3'));
    myChart3.setOption(option3);
                
//===============================土壤有效养分含量报表======================
var data0 = splitData(data_food);
function splitData(rawData) {
    var categoryData = [];
    var values = []
    for (var i = 0; i < rawData.length; i++) {
        categoryData.push(rawData[i].splice(0, 1)[0]);
        values.push(rawData[i])
    }
    return {
        categoryData: categoryData,
        values: values
    };
}

function calculateMA(dayCount) {
    var result = [];
    for (var i = 0, len = data0.values.length; i < len; i++) {
        if (i < dayCount) {
            result.push('-');
            continue;
        }
        var sum = 0;
        for (var j = 0; j < dayCount; j++) {
            sum += data0.values[i - j][1];
        }
        result.push(((sum / dayCount)/15).toFixed(2));
    }
    return result;
}

	option4 = {
	    title: {
	        text: '土壤有效养分含量',
	        subtext: '每公斤土壤中氮、磷、钾含量',
	        left: 0
	    },
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {
	            type: 'cross'
	        }
	    },
	    legend: {
	        data: ['氮', '磷', '钾']
	    },
	    grid: {
	        left: '4%',
	        right: '2%',
	        bottom: '15%'
	    },
	    xAxis: {
	        type: 'category',
	        data: data0.categoryData,
	        scale: true,
	        boundaryGap : false,
	        axisLine: {onZero: false},
	        splitLine: {show: false},
	        splitNumber: 20,
	        min: 'dataMin',
	        max: 'dataMax'  
	         
	    },
	    yAxis: {
	        scale: true,
	        axisLabel : { formatter: '{value}mg'},
	        splitArea: {
	            show: true
	        }
	    },
	    dataZoom: [
	        {
	            type: 'inside',
	            start: 50,
	            end: 100
	        },
	        {
	            show: true,
	            type: 'slider',
	            y: '90%',
	            start: 50,
	            end: 100
	        }
	    ],
	    series: [
	        {
	            name: '氮',
	            type: 'line',
	            data: calculateMA(5),
	            smooth: true,
	            lineStyle: {
	                normal: {opacity: 0.5}
	            }
	        },
	        //['2017/1/24', 1320.26,1320.26,1287.3,1362.94]
	        {
                name:'（低）标准值',
                type:'line',
                symbol: 'none',
                itemStyle : {  
        		   normal : {  
        	         lineStyle:{   
        	            color:'#FF0000' ,
        	            type:'dashed'
                              }   
                            }   
                },   
                data:[['2017/1/24', 150,150,150,150],['2017/5/27', 150,150,150,150]]
            },
	        {
	            name: '磷',
	            type: 'line',
	            data: calculateMA(10),
	            smooth: true,
	            lineStyle: {
	                normal: {opacity: 0.5}
	            }
	        },
	        {
	            name: '钾',
	            type: 'line',
	            data: calculateMA(20),
	            smooth: true,
	            lineStyle: {
	                normal: {opacity: 0.5}
	            }
	        } 
	
	    ]
	};
     var myChart4 = echarts.init(document.getElementById('main4'));
     myChart4.setOption(option4); 
    
   //===================病虫害地图报表=================================
    $.get('<%=path%>/js/shandong.json', function (chinaJson) {
        echarts.registerMap('china1', chinaJson);
        var chart = echarts.init(document.getElementById('main5'));
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
                        color: ['#313695', '#4575b4', 
                                '#74add1', '#abd9e9',
                                '#e0f3f8', '#ffffbf', 
                                '#fee090', '#fdae61', 
                                '#f46d43', '#d73027', 
                                '#a50026']
                    },
                    text:['High','Low'],            
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
                        map: 'china1',
                        itemStyle:{
                            emphasis:{label:{show:true}}
                        },
                        // 文本位置修正
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
    </script>
</body>
</html>