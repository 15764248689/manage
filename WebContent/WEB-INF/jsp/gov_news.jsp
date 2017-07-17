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
<body class="chart">
	<jsp:include page="gov_head.jsp" flush="true" />
    <jsp:include page="gov_leftBar.html" flush="true" />
    <section class="main-container clearfix">
        <div class="location">
            <i class="icon icon-news"></i>最新资讯
        </div>
        <div class="news-left">
            <ul class="news-tab clearfix">
                <li class="on">农事新闻</li>
                <li>国家相关政策</li>
                <li>地方政策补贴</li>
            </ul>
            <ul class="news-list clearfix">
                <li>
                    <a href="">青岛市2017年无公害农产品培训班在胶州举办</a>
                </li>
               
                <li>
                    <a href="">关于召开全市假劣农资无害化处理现场会的通知</a>
                </li>
                <li>
                    <a href="">青岛市农业行政处罚裁量基准</a>
                </li>
                <li>
                    <a href="">关于推进农村集体经济组织产权制度改革的意见</a>
                </li>
                <li>
                    <a href="">国际农业科技发展峰会在京召开</a>
                </li>
                <li>
                    <a href="">关于推进种子管理体制改革加强市场监管的通知</a>
                </li>
                <li>
                    <a href="">关于加强耕地保护和改进占补平衡的意见</a>
                </li>
                <li>
                    <a href="">非主要农作物品种登记办法</a>
                </li>
                <li>
                    <a href="">关于加快推进重要产品追溯体系建设的意见</a>
                </li>
                <li>
                    <a href="">青岛都市现代农业发展规划（2016—2020 年）</a>
                </li>
                <li>
                    <a href="">山东省农村集体经济审计条例</a>
                </li>
                <li>
                    <a href="">山东：坚决杜绝毒生姜等农产品安全事件发生</a>
                </li>
                <li>
                    <a href="">鼓起农民钱袋子　需更多政策扶持</a>
                </li>
                <li>
                    <a href="">山东农业保险：强农惠农生力军</a>
                </li>
                <li>
                    <a href="">人大代表谈“三农”：让农业强 农村美 农民富</a>
                </li>
                <li>
                    <a href="">关于开展重点农产品质量安全 专项治理</a>
                </li>
                <li>
                    <a href="">砥砺奋进的五年：全球减贫的中国贡献</a>
                </li>
            </ul>
        </div>
        <div class="news-right">
            <dl class="news-info">
                <dt>青岛市2017年无公害农产品培训班在胶州举办<br><span>发布时间：2017/06/2   来源：质监处   点击次数：2148</span></dt>
                <dd>
                    <div style="text-align:center"> <img src="<%=path %>/static/images/demo.jpg"   width="500" height="350" /></div></br></br>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;央为推动无公害农产品事业持续发展，加强体系队伍能力建设，提高农产品质量安全监管水平，青岛市农委于2017年5月10日，在胶州市举办一期无公害农产品检查员、内检员培训班。来自全市471名从事无公害农产品监管工作人员、已通过无公害农产品认证的获证单位、新申报及计划申报无公害农产品认证单位内部管理人员或业务骨干参加了培训。</p>

 <p>  &nbsp;&nbsp;&nbsp;&nbsp;本次培训，邀请了农业部农产品质量安全中心两名专家,就无公害农产品管理与技术、检查员、内检员制度和农产品质量安全监管基础知识进行授课，让学员全面了解当前农产品质量安全监管形势和发展。授课结束后，组织学员进行了考试。</p>

 <p>  &nbsp;&nbsp;&nbsp;&nbsp;此次培训内容丰富、针对性强，培训效果显著。通过培训，全市上下统一了思想，明确了任务，为扎实做好2017年无公害农产品监管工作打下良好基础。</p>
 
                </dd>
            </dl>
        </div>
    </section>
    <script src="<%=path%>/static/js/jquery-3.1.1.min.js"></script>
    <script src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/news.js"></script>
</body>
</html>