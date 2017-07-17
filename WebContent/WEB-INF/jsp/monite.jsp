<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="<%=path%>/static/css/basic.css" rel="stylesheet">
<link href="<%=path%>/static/css/page.css" rel="stylesheet">

</head>
<body class="monitor">
	<jsp:include page="head.jsp" flush="true" />
   <jsp:include page="leftBar.html" flush="true" />
    <section class="main-container">
        <div class="location">
            <i class="icon icon-monite"></i>数据实时监测
        </div>
        <div class="common-section clearfix">
        
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
        
        
            <<%-- div class="common-title">生产数据</div>
            <dl class="monite-dl">
                <dt>空气监测</dt>
                <dd class = "monite-dl2">
                	<ul class="monite-weather">
                		<li>温度</br><img src="<%=path%>/static/images/monite_01.png"/></br><div id = "wendu"></div></li>
                		<li>湿度</br><img src="<%=path%>/static/images/monite_02.png"/></br><div id = "shidu"></div></li>
                		<li>二氧化碳</br><img src="<%=path%>/static/images/monite_03.png"/></br><div  id = "co2"></div></li>
                		<li>光照</br><img src="<%=path%>/static/images/monite_04.png"/></br><div id = "fuzhao"></div></li>
                	</ul>
                </dd>
            </dl>
            <dl class="monite-dl">
                <dt>土壤监测</dt>
                <dd>
                	<ul class="monite-weather ">
                		<li>温度</br><img src="<%=path%>/static/images/monite_01.png"/></br><div id = "wenduT"></div></li>
                		<li>湿度</br><img src="<%=path%>/static/images/monite_02.png"/></br><div id = "shiduT"></div></li>
                		<li>PH值</br><img src="<%=path%>/static/images/monite_07.png"/></br><div  id = "phT"></div></li>
                	</ul>
                </dd>
            </dl> --%>
            
        </div>
        <div class="common-section clearfix">
            <div class="common-title">天气参数</div>
            <div>
                <div class="monite-now">
                    <div class="time" id = "TQTime">9:30 实况</div>
                    <div class="weather clearfix">
                        <div class="weatherglass"><span style="height:55.2px;"></span></div>
                        <div class="degree"><span id = "TQwendu">19</span>°C</div>
                    </div>
                    <div class="humidity-wind">
                        <div class="humidity" id = "TQshidu"></div>
                        <div class="wind" id = "TQfeng"></div>
                    </div>
                    <div class="grade" id = "TQkongqi"></div>
                </div>
                <div class="monite-day">
                    <div id = "riqi1"></div>
                    <img src="../static/images/sunny_big.jpg" alt=""><br>
                    <div id = "tianqi1"></div>
                    <span id = "wendu1">26 <small>°C</small></span><br>
                    <em id = "feng1">3-4级</em><br>
                    <i>日出 04:47</i>
                </div>
                <div class="monite-day monite-night">
                    <div id = "riqi2"></div>
                    <img src="../static/images/night_big.jpg" alt=""><br>
                    <div id = "tianqi2"></div>
                    <span id = "wendu2">17 <small>°C</small></span><br>
                    <em id = "feng2">3-4级</em><br>
                    <i>日落 19:04</i>
                </div>
                <div class="monite-change">
                    <ul>
                        <li>08时<br><img src="../static/images/sunny_big.jpg"></li>
                        <li>11时<br><img src="../static/images/sunny_big.jpg"></li>
                        <li>14时<br><img src="../static/images/sunny_big.jpg"></li>
                        <li>17时<br><img src="../static/images/sunny_big.jpg"></li>
                        <li>20时<br><img src="../static/images/night_big.jpg"></li>
                        <li>23时<br><img src="../static/images/night_big.jpg"></li>
                        <li>02时<br><img src="../static/images/night_big.jpg"></li>
                        <li>05时<br><img src="../static/images/night_big.jpg"></li>
                    </ul>
                    <div class="change-line" id = "wenduZX"></div>
                    <ul>
                        <li id = "fengli1"></li>
                        <li id = "fengli2"></li>
                        <li id = "fengli3"></li>
                        <li id = "fengli4"></li>
                        <li id = "fengli5"></li>
                        <li id = "fengli6"></li>
                        <li id = "fengli7"></li>
                        <li id = "fengli8"></li>
                       <!--  <li id = "fengli8">南风<br>3-4级</li> -->
                    </ul>
                </div>
            </div>

    </section>
    <script src="<%=path%>/static/js/jquery-3.1.1.min.js"></script>
    <script src="<%=path%>/static/js/common.js"></script>
</body>
</html>
<script>

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
          
          if(localStorage.getItem("date") == null) localStorage.setItem("date", new Date());
          
          var newDate = new Date();
          var oldDate = new Date(localStorage.getItem("date"));
          
          var pDate = newDate.getTime() - oldDate.getTime() >= 3600000?false:true;
          
          
          var SSwendu,SSshidu,SSco2,SSfuzhao;
          //生成当日温度（空气）
          if(localStorage.getItem("SSwendu") != null && pDate && localStorage.getItem("SSwendu") != 'undefined'){
        	  SSwendu = localStorage.getItem("SSwendu");
          } else{
        	  SSwendu = Math.ceil(Math.random()*(_w.t1-_w.t2))+parseInt(_w.t2);
          }
          //生成当日湿度40-60（空气）
          if(localStorage.getItem("SSshidu") != null && pDate && localStorage.getItem("SSshidu") != 'undefined'){
        	  SSshidu = localStorage.getItem("SSshidu");
          }else{
        	  SSshidu = 40 + Math.ceil(20*((SSwendu - _w.t2)/(_w.t1-_w.t2)));
          } 
           
          //生成当日co2浓度（空气）
          if(localStorage.getItem("SSco2") != null && pDate && localStorage.getItem("SSco2") != 'undefined'){
        	  SSco2 = localStorage.getItem("SSco2");
          }else{
        	  SSco2 = Math.ceil(Math.random()*100)+350;
          } 
           
          //生成当日辐照强度（空气）
          if(localStorage.getItem("SSfuzhao") != null && pDate && localStorage.getItem("SSfuzhao") != 'undefined'){
        	  SSfuzhao = localStorage.getItem("SSfuzhao");
          }else{
        	  SSfuzhao = Math.ceil(Math.random()*40000)+40000;
          } 
           
          //设置到页面
          $("#wendu").html(SSwendu);
          $("#shidu").html(SSshidu);
          $("#co2").html(SSco2);
          $("#fuzhao").html(SSfuzhao);
          //存储到localStorage
          localStorage.setItem("SSwendu", SSwendu);
          localStorage.setItem("SSshidu",SSshidu );
          localStorage.setItem("SSco2", SSco2);
          localStorage.setItem("SSfuzhao", SSfuzhao);
          
          
          
          var wenduT,shiduT,phT;
          //生成当日温度（土壤）10-22
          if(localStorage.getItem("wenduT") != null && pDate && localStorage.getItem("wenduT") != 'undefined'){
        	  wenduT = localStorage.getItem("wenduT");
          }else{
        	  wenduT = Math.ceil(Math.random()*12)+10;
          } 
        	  
          //生成当日湿度40-60（土壤）
          if(localStorage.getItem("shiduT") != null && pDate && localStorage.getItem("shiduT") != 'undefined') {
        	  shiduT = localStorage.getItem("shiduT");
          }else{
        	  shiduT = 72 + (wenduT - 12);
          }
        	  
          //生成当日co2浓度（空气）
          if(localStorage.getItem("phT") != null && pDate && localStorage.getItem("phT") != 'undefined') {
        	  phT = localStorage.getItem("phT");
          }else{
              phT = parseFloat(Math.random().toFixed(1))+6.5;
          }
        	  
         //存储到localStorage
           localStorage.setItem("wenduT", wenduT);
           localStorage.setItem("shiduT",shiduT);
           localStorage.setItem("phT", phT);
          
           localStorage.setItem("date", new Date());
          
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
          
          //绘制温度折线图
          zhexianXS(_w.d1,_w.p1);
          
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
          if(localStorage.getItem("air") != null && 
        		  localStorage.getItem("airDate") == (date2+"-"+date.getHours())){
        	  var text = [];
        	  var obj = document.getElementById('TQkongqi');
        	  text.push(localStorage.getItem("air")); 
        	  obj.innerText = text.join("\n");
        	  
          }else{
        	  air();
          }
          
          
          if(localStorage.getItem("date2") != null && date2 == localStorage.getItem("date2")){
        	  ZXdata(date.getHours(),SSwendu);
        	  //在温度范围内随即生成温度折线数据
        	 zxsj(_w.s1,_w.s2);
          }else{
        	  
        	  //清空折线数据
        	  ZXDataClean();
        	  ZXdata(date.getHours(),SSwendu);
        	  localStorage.setItem("date2",date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate());
        	  //在温度范围内随即生成温度折线数据
        	  zxsj(_w.s1,_w.s2);
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
/* 	  text.push("Position_Name: " + life[0].position_name);
	  text.push("PM2.5: " + life[0].pm2_5);
	  text.push("PM2.5_24h: " + life[0].pm2_5_24h);
	  text.push("Primary_Pollutant: " + life[0].primary_pollutant);
	  text.push("Quality: " + life[0].quality);
	  text.push("UpdateTime: " + life[0].time_point); */
	  
	  var airDateTime = new Date();
	  var airDate = airDateTime.getFullYear()+"-"+airDateTime.getMonth()
	  					+"-"+airDateTime.getDate()+"-"+airDateTime.getHours();
	  
	  localStorage.setItem("air",life[0].aqi+life[0].quality);
	  localStorage.setItem("airDate",airDate);
	  
	  
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
	  

  	 
	 function zhexianXS(fx,fl){
		  option = {
				  grid: {
				        left: '6%',
				        right: '6%',
				    },
				    xAxis : [
				        {
				        	show:false,
				            type : 'category',
				            boundaryGap : false,
				            data : ['1','2','3','4','5','6','7',"8"],
				            axisLabel:{
			                 //X轴刻度配置
			                    interval:0 //0：表示全部显示不间隔；auto:表示自动根据刻度个数和宽度自动设置间隔个数
			                } 
				        } 
				    ],
				    yAxis : [
				        {	show:false,
				            type : 'value',
				            axisLabel : {
				                formatter: '{value} °C'
				            }
				        }
				    ],
				    series : [
				        {
				            type:'line',
				            label:{
					        	normal: {
					        	show: true,
					        	},
					        },
					        lineStyle: {
					        	normal: {
					        	color: '#FFC125',
					        	},
					        }
				        }
				        
				    ]
				};
		 
		 var wenduZX = echarts.init(document.getElementById('wenduZX'));
		 
		 var data = [];
		 if(localStorage.getItem("riqi1")!= null&&localStorage.getItem("riqi1") != 'undefined') 
			 data[0] = localStorage.getItem("riqi1");
		 if(localStorage.getItem("riqi2")!= null&&localStorage.getItem("riqi2") != 'undefined') 
			 data[1] = localStorage.getItem("riqi2");
		 if(localStorage.getItem("riqi3")!= null&&localStorage.getItem("riqi3") != 'undefined') 
			 data[2] = localStorage.getItem("riqi3");
		 if(localStorage.getItem("riqi4")!= null&&localStorage.getItem("riqi4") != 'undefined') 
			 data[3] = localStorage.getItem("riqi4");
		 if(localStorage.getItem("riqi5")!= null&&localStorage.getItem("riqi5") != 'undefined') 
			 data[4] = localStorage.getItem("riqi5");
		 if(localStorage.getItem("riqi6")!= null&&localStorage.getItem("riqi6") != 'undefined') 
			 data[5] = localStorage.getItem("riqi6");
		 if(localStorage.getItem("riqi7")!= null&&localStorage.getItem("riqi7") != 'undefined') 
			 data[6] = localStorage.getItem("riqi7");
		 if(localStorage.getItem("riqi8")!= null&&localStorage.getItem("riqi8") != 'undefined') 
			 data[7] = localStorage.getItem("riqi8");
		 
		 option.series[0].data = data;
		 
		 $("#fengli1").html(fx+"<br> "+fl+"级");
		 $("#fengli2").html(fx+"<br> "+fl+"级");
		 $("#fengli3").html(fx+"<br> "+fl+"级");
		 $("#fengli4").html(fx+"<br> "+fl+"级");
		 $("#fengli5").html(fx+"<br> "+fl+"级");
		 $("#fengli6").html(fx+"<br> "+fl+"级");
		 $("#fengli7").html(fx+"<br> "+fl+"级");
		 $("#fengli8").html(fx+"<br> "+fl+"级");
		 
		 wenduZX.setOption(option);
	 }
	 
	 function ZXdata(m,n){
		switch(m)
   	  {
   	  case 2:localStorage.setItem("riqi7",n);
   	  break;
   	  case 5:localStorage.setItem("riqi8",n);
   	  break;
   	  case 8:localStorage.setItem("riqi1",n);
   	  break;
   	  case 11:localStorage.setItem("riqi2",n);
   	  break;
   	  case 14:localStorage.setItem("riqi3",n);
   	  break;
   	  case 17:localStorage.setItem("riqi4",n);
   	  break;
   	  case 20:localStorage.setItem("riqi5",n);
   	  break;
   	  case 23:localStorage.setItem("riqi6",n);
   	  break;
   	  }
	 }
	 
	 function ZXDataClean(){
		 localStorage.removeItem("riqi1");
		 localStorage.removeItem("riqi2");
		 localStorage.removeItem("riqi3");
		 localStorage.removeItem("riqi4");
		 localStorage.removeItem("riqi5");
		 localStorage.removeItem("riqi6");
		 localStorage.removeItem("riqi7");
		 localStorage.removeItem("riqi8");
	 }
	 
	 
	 function zxsj(max,min){
		 for(var i = 1;i<9;i++){
			 localStorage.setItem("riqi"+i,Math.ceil(Math.random()*(max-min))+min);
		 }
	 }
	 
	 zxsj(24,17)
</script>