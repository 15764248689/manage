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
<body class="monitor">
   <jsp:include page="gov_head.jsp" flush="true" />
   <jsp:include page="gov_leftBar.html" flush="true" />
    <section class="main-container">
        <div class="location">
            <i class="icon icon-monite"></i>数据实时监测
        </div>
        <div class="clearfix">
        <div class="common-section count-left">
            <div class="common-title">空气监测</div>
            <ul class="govt-weather">
                <li>温度<br><img src="<%=path %>/static/images/govt/temperature.png"><br><span id = "wendu">32</span>℃</li>
                <li>湿度<br><img src="<%=path %>/static/images/govt/humidity.png"><br><span id = "shidu">32</span>%</li>
                <li>二氧化碳<br><img src="<%=path %>/static/images/govt/CO2.png"><br><span id = "co2">442</span>ppm</li>
                <li>光照<br><img src="<%=path %>/static/images/govt/irradiation.png"><br><span id = "fuzhao">852</span>Lux</li>
            </ul>
        </div>
        <div class="common-section count-right">
            <div class="common-title">土壤监测</div>           
            <ul class="govt-weather govt-weather2">
                <li>温度<br><img src="../static/images/govt/temperature.png"><br><span id = "wenduT">32</span>℃</li>
                <li>湿度<br><img src="../static/images/govt/humidity.png"><br><span id = "shiduT">32</span>%</li>
                <li>PH值<br><img src="../static/images/govt/ph.png"><br><span id = "phT">6.5</span></li>
            </ul>
        </div>
        <div class="common-section count-left">
            <div class="common-title">病虫害监测</div>
           <div style="height: 300px;" id = "worm"></div>
        </div>
        <div class="common-section count-right">
            <div class="common-title">天气数据</div>
            <div>
                <div class="monite-now">
                    <div class="time" id = "TQTime">9:30 实况</div>
                    <div class="weather clearfix">
                        <div class="weatherglass"><span style="height:55.2px;"></span></div>
                        <div class="degree"><span id = "TQwendu">19</span>°C</div>
                    </div>
                    <div class="humidity-wind">
                        <div class="humidity" id = "TQshidu">相对湿度55%</div>
                        <div class="wind" id = "TQfeng">西北风4级</div>
                    </div>
                    <div class="grade" id = "TQkongqi">58良</div>
                </div>
                <div class="monite-day">
                    <div id = "riqi1"></div>
                    <img src="<%=path %>/static/images/sunny_big.jpg" alt=""><br>
                   <div id = "tianqi1"></div>
                    <span id = "wendu1">26 <small>°C</small></span><br>
                    <em id = "feng1">3-4级</em><br>
                    <i>日出 04:47</i>
                </div>
                <div class="monite-day monite-night">
                    <div id = "riqi2"></div>
                    <img src="<%=path %>/static/images/night_big.jpg" alt=""><br>
                   <div id = "tianqi2"></div>
                    <span id = "wendu2">17 <small>°C</small></span><br>
                    <em id = "feng2">3-4级</em><br>
                    <i>日落 19:04</i>
                </div>                
            </div>
        </div>        
        <div class="common-section count-left">
            <div class="common-title">产量监测</div>
            <div id = "production" style = "height:290px">图片高度290px</div>
        </div>        
        <div class="common-section count-right">
            <div class="common-title">农药使用监测</div>
            <div style = "height:290px" id= "pesticide">图片高度290px</div>
        </div>
        </div>
    </section>
    <script src="<%=path %>/static/js/jquery-3.1.1.min.js"></script>
    <script src="<%=path %>/static/js/common.js"></script>
</body>
</html>
<script>
/* 病虫害预测 */
var option1 = {
	    tooltip : {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['真菌性病害','细菌性病害','病毒性病害','昆虫性虫害','螨虫性虫害']
	    },
	    calculable : true,
	    xAxis : [
	        {
	            type : 'category',
	            boundaryGap : false,
	            data : ['周一','周二','周三','周四','周五','周六','周日']
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            axisLabel : {formatter: '{value}次'}
	        }
	    ],
	    series : [
	        {
	            name:'真菌性病害',
	            type:'line',
	            data:[120, 132, 101, 134, 90, 230, 210]
	        },
	        {
	            name:'细菌性病害',
	            type:'line',
	            data:[220, 182, 191, 234, 290, 330, 310]
	        },
	        {
	            name:'病毒性病害',
	            type:'line',
	            data:[150, 232, 201, 154, 190, 330, 410]
	        },
	        {
	            name:'昆虫性虫害',
	            type:'line',
	            data:[320, 332, 301, 334, 390, 330, 320]
	        },
	        {
	            name:'螨虫性虫害',
	            type:'line',
	            data:[820, 932, 901, 934, 1290, 1330, 1320]
	        }
	    ]
	};
var worm = echarts.init(document.getElementById('worm'));
worm.setOption(option1);

/* 产量监测 */
var option2 = {
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    legend: {
	        data: ['蓝莓', '葡萄','草莓']
	    },
	    xAxis:  {
	        type: 'value',
	        axisLabel : {formatter: '{value}斤'}
	    },
	    yAxis: {
	        type: 'category',
	        data: ['二月','三月','三月','四月','五月','六月']
	    },
	    series: [
	        {
	            name: '蓝莓',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'insideRight'
	                }
	            },
	            markArea: {
	            	itemStyle: {
	            	normal: {color:"#fff",},
	              }
	            },
	            data: [2800, 2600, 2700, 3300, 2900, 3000]
	        },
	        {
	            name: '葡萄',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'insideRight'
	                }
	            },
	            markLine: {
	            	lineStyle: {
	            	normal: {color:"#fff",},
	              }
	            },
	            data: [3000, 3500, 3100, 3700, 4000, 3400]
	        },
	        {
	            name: '草莓',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'insideRight'
	                }
	            },
	            areaStyle:{
	            	normal: {color:"#fff",},
	            },
	            data: [2700, 2900, 3100, 3000, 2800, 2900]
	        }
	    ]
	};

var production = echarts.init(document.getElementById('production'));
production.setOption(option2);


/* 农药使用监测 */
$.get('<%=path%>/js/shandong.json', function (chinaJson) {
     echarts.registerMap('china1', chinaJson);
     var chart = echarts.init(document.getElementById('pesticide'));
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
                     return params.seriesName + '<br/>' + params.name + ': ' + value+"级";
                 }
             },
             visualMap: {
                 left: 'right',
                 min: 0,
                 max: 5,
                 inRange: {
                     color: ['#00FF7F', '#43CD80', '#9AFF9A', '#7CCD7C', '#66CD00']
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
                     name: '农药使用程度',
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
                         {name: '烟台市',value: 3},
                         {name: '威海市', value: 0},
                         {name: '日照市', value: 4},
                         {name: '潍坊市', value: 3},
                         {name: '莱芜市', value: 4},
                         {name: '泰安市', value: 2},
                         {name: '济宁市', value: 1},
                         {name: '菏泽市', value: 5},
                         {name: '聊城市', value: 5},
                         {name: '枣庄市', value: 3},
                         {name: '滨州市', value: 2},
                         {name: '德州市', value: 0},
                         {name: '东营市', value: 3},
                         {name: '淄博市', value: 3},
                         {name: '临沂市', value: 2}
                     ]
                 }
             ]
         };
     chart.setOption(option5);
 });


window.setInterval(findWeather, 3600000); 
function findWeather() {
    var cityUrl = 'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js';
    $.getScript(cityUrl, function (script, textStatus, jqXHR) {
      var citytq = remote_ip_info.city; // 获取城市
		
      citytq = "青岛";
      var url = "http://php.weather.sina.com.cn/iframe/index/w_cl.php?code=js&city=" + citytq + "&day=0&dfc=3";
      $.ajax({
        url: url,
        dataType: "script",
        scriptCharset: "gbk",
        success: function (data) {
          var _w = window.SWther.w[citytq][0];
          
          if(localStorage.getItem("govdate") == null) localStorage.setItem("govdate", new Date());
          
          var newDate = new Date();
          var oldDate = new Date(localStorage.getItem("govdate"));
          
          var pDate = newDate.getTime() - oldDate.getTime() >= 3600000?false:true;
          
          
          var SSwendu,SSshidu,SSco2,SSfuzhao;
          //生成当日温度（空气）
          if(localStorage.getItem("govSSwendu") != null && pDate && localStorage.getItem("govSSwendu") != 'undefined'){
        	  SSwendu = localStorage.getItem("govSSwendu");
          } else{
        	  SSwendu = Math.ceil(Math.random()*(_w.t1-_w.t2))+parseInt(_w.t2);
          }
          //生成当日湿度40-60（空气）
          if(localStorage.getItem("govSSshidu") != null && pDate && localStorage.getItem("govSSshidu") != 'undefined'){
        	  SSshidu = localStorage.getItem("govSSshidu");
          }else{
        	  SSshidu = 40 + Math.ceil(20*((SSwendu - _w.t2)/(_w.t1-_w.t2)));
          } 
           
          //生成当日co2浓度（空气）
          if(localStorage.getItem("govSSco2") != null && pDate && localStorage.getItem("govSSco2") != 'undefined'){
        	  SSco2 = localStorage.getItem("govSSco2");
          }else{
        	  SSco2 = Math.ceil(Math.random()*100)+350;
          } 
           
          //生成当日光照强度（空气）
          if(localStorage.getItem("govSSfuzhao") != null && pDate && localStorage.getItem("govSSfuzhao") != 'undefined'){
        	  SSfuzhao = localStorage.getItem("govSSfuzhao");
          }else{
        	  SSfuzhao = Math.ceil(Math.random()*40000)+40000;
          } 
           
          //设置到页面
          $("#wendu").html(SSwendu);
          $("#shidu").html(SSshidu);
          $("#co2").html(SSco2);
          $("#fuzhao").html(SSfuzhao);
          //存储到localStorage
          localStorage.setItem("govSSwendu", SSwendu);
          localStorage.setItem("govSSshidu",SSshidu );
          localStorage.setItem("govSSco2", SSco2);
          localStorage.setItem("govSSfuzhao", SSfuzhao);
          
          
          
          var wenduT,shiduT,phT;
          //生成当日温度（土壤）10-22
          if(localStorage.getItem("govwenduT") != null && pDate && localStorage.getItem("govwenduT") != 'undefined'){
        	  wenduT = localStorage.getItem("govwenduT");
          }else{
        	  wenduT = Math.ceil(Math.random()*12)+10;
          } 
        	  
          //生成当日湿度40-60（土壤）
          if(localStorage.getItem("govshiduT") != null && pDate && localStorage.getItem("govshiduT") != 'undefined') {
        	  shiduT = localStorage.getItem("govshiduT");
          }else{
        	  shiduT = 72 + (wenduT - 12);
          }
        	  
          //生成当日co2浓度（空气）
          if(localStorage.getItem("govphT") != null && pDate && localStorage.getItem("govphT") != 'undefined') {
        	  phT = localStorage.getItem("govphT");
          }else{
              phT = parseFloat(Math.random().toFixed(1))+6.5;
          }
        	  
         //存储到localStorage
           localStorage.setItem("govwenduT", wenduT);
           localStorage.setItem("govshiduT",shiduT);
           localStorage.setItem("govphT", phT);
          
           localStorage.setItem("govdate", new Date());
          
          $("#wenduT").html(wenduT);
          $("#shiduT").html(shiduT);
          $("#phT").html(phT);
          
              
          //天气温度
          $("#TQwendu").html(SSwendu);
          //相对湿度
          $("#TQshidu").html("相对湿度"+SSshidu+"%");
          //风
          $("#TQfeng").html(_w.d1 + _w.p1 + "级");
          
          
          $("#wendu1").html(_w.t1 + "<small>°C</small>");
          $("#wendu2").html(_w.t2 + "<small>°C</small>");
          $("#feng1").html(_w.d1 + _w.p1 + "级");
          $("#feng2").html(_w.d1 + _w.p1 + "级");
          
          
          var date = new Date();
          
          $("#TQTime").html(date.getHours()+":"+date.getMinutes()+"  实况");
          /* $("#riqi1").html(date.getDate());
          $("#riqi2").html(date.getDate()); */
          $("#tianqi1").html(_w.s1);
          $("#tianqi2").html(_w.s1);
          
          //记录数据时间
          localStorage.setItem("date", date);
          
          
          //记录年月日 
          var date2 = date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate();
          
          //获取空气质量并设置到页面
          if(localStorage.getItem("govair") != null && 
        		  localStorage.getItem("govairDate") == (date2+"-"+date.getHours())){
        	  var text = [];
        	  var obj = document.getElementById('TQkongqi');
        	  text.push(localStorage.getItem("govair")); 
        	  obj.innerText = text.join("\n");
        	  
          }else{
        	  air();
          }
          
        }
      });
    }); 
  };
  findWeather();
  
  	  var KEY = "5j1znBVAsnSf5xQyNQyq"; 
	  var API = "http://www.pm25.in/api/querys/pm2_5.json";
	  var CITY = "qingdao"; 
	  var PMjsonpCallbackdemo = function(data) {
	  
		  
	  var life = data;
	  var text = [];
	  var obj = document.getElementById('TQkongqi');
	  text.push(life[0].aqi+life[0].quality); 
	  
	  var airDateTime = new Date();
	  var airDate = airDateTime.getFullYear()+"-"+airDateTime.getMonth()
	  					+"-"+airDateTime.getDate()+"-"+airDateTime.getHours();
	  
	  localStorage.setItem("govair",life[0].aqi+life[0].quality);
	  localStorage.setItem("govairDate",airDate);
	  
	  
	  obj.innerText = text.join("\n");
	  }
  
	  //获取空气质量
  	 function air(){
  		 //获得空气质量aqi
  		  var url = API + "?city=" + CITY + "&" + "token=" + KEY + "&callback=PMjsonpCallbackdemo";
		  var newScript = document.createElement('script');
		  newScript.type = 'text/javascript';
		  newScript.src = url;
		  $('#TQkongqi').append(newScript);
  	 }
	  
</script>