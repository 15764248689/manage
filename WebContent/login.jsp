<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
    <title>登录页</title>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path %>/js/jquery-1.11.0.min.js"></script>
    <script src="<%=path %>/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=path %>/bootstrap/css/bootstrap-responsive.min.css" />
    <script type="text/javascript">
    		$(document).ready(function() {  
    			$("#submitBut").click(function(){
        			var userName = $("#userName").val();
        			var passWord = $("#passWord").val();
        			if(userName == "" || passWord == ""){
        				alert("用户名或者密码不能为空");
        				return;
        			 }
        			
        			$.ajax({
        				url:"<%=path%>/testAction/login",
        				data:{userName:userName,passWord:passWord},
        				success:function(msg){
        					if(msg==1){//登录成功
        						alert("登陆成功，正在跳转")
        						window.location="<%=path%>/index.jsp";
        					}
        					if(msg==0){//登录失败
        						alert("登录失败,账号或密码错误");
        					}
        				}
        			});
        		});
    			
    			
    			function goIndex(){
    				
    			}
    			
    			
    			$("#cancelBut").click(function(){
    				window.location.reload();
    			})
    			
    		})
    </script>
</head>
<body>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form role="form">
				<div class="form-group"  >
					 <label for="exampleInputEmail1">账号</label>
					 <input type="email" class="form-control" id="userName" style="width:50%"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">密码</label>
					 <input type="password" class="form-control" id="passWord" style="width:50%"/>
				</div>
				<div class="container">
					<div class="row clearfix">
						<div class="col-md-12 column">
							 <button type="button" class="btn btn-default btn-primary" id = "submitBut">登录</button>
							 <button type="button" class="btn btn-default btn-primary" id = "cancelBut">取消</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
