$(document).ready(function() {
	
    			//绑定全选按钮事件
    			$("#title-table-checkbox").click(function(){
    				
    				var sk=$('#title-table-checkbox').is(':checked');
    				
    				if(sk){
    					  $("[name='check']").prop("checked",true);//全选
    				}else{
    					 $("[name='check']").prop("checked",false);
    				}
    			});
    			
    			//取消一个选中时，设置全选按钮为不全部选中,如果全部手动选中，设置全选为选中状态
    			$("[name='check']").click(function(){
    				var p = true; 
    				$("[name='check']").each(function (index, obj) {
    	                if(obj.checked == false){
    	                	p = false;
    	                	return false;
    	                }
    	            });
    				if(p){
    					$('#title-table-checkbox').prop("checked",true);
    				}else{
    					$('#title-table-checkbox').prop("checked",false);
    				}
    				
    			});
    			
    			
 })
    		
	//更新模态框数据填充事件
	function userFill(id,userName,passWord,sex,birth){
		
		$("#idd").val(id);
		$("#userName").val(userName);
		$("#passWord").val(passWord);
		if(sex == 1){
			/* $("#male").checked = true;
			$("#female").checked = false; */
			document.getElementById("male").checked=true;
			document.getElementById("female").checked=false;
		}else if(sex == 0){
			/* $("#female").checked = true;
			$("#male").checked = false; */
			document.getElementById("male").checked=false;
			document.getElementById("female").checked=true;
		}
//		alert(1);
	    $("#birth").prop("value",birth);
		
	    
		var mydateInput = document.getElementById("birth");
	    var date = new Date();
	    var dateString = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
	    
	    //用户出生日期无法设定默认值
//	    mydateInput.value=dateString;
		$("#birth").value=dateString;
		
		$("#myModal").modal("show");
		
	}

	//模态框提交事件，根据id的有无处判断是新增还是修改
	function submit(){
		
		var userName = $("#userName").val();
		var birth = $("#birth").val();
		var passWord = $("#passWord").val();
		var sex =$("input[name='sex']:checked").val();
		
		//数据验证
		if(userName == ""||userName == null){
			alert("用户名不能为空");
			return false;
		}
		if(passWord == ""||passWord == null){
			alert("密码不能为空");
			return false;
		}
		if(birth == ""||birth == null){
			alert("出生年月不能为空");
			return false;
		}
		if(sex == "" || sex == null){
			alert("性别不能为空");
			return false;
		}
		
		
		var id= $("#idd").val();
		if(id!=""){
			updateUser(id,userName,birth,passWord,sex);
		}else{
			addUser(userName,birth,passWord,sex);
		}
	}
	
	//用户数据修改事件
	function updateUser(id,userName,birth,passWord,sex){
		$.ajax({
			url:"updateUser.action",
			data:{id:id,userName:userName,passWord:passWord,birth:birth,sex:sex},
			success:function(msg){
				if(msg==1){//成功
					alert("修改成功");
					window.location.reload();
				}
				if(msg==0){//失败
					alert("修改失败，请联系管理员");
				}
			}
		});
	}
	//用户数据添加事件
	function addUser(userName,birth,passWord,sex){
		var userName = $("#userName").val();
		var birth = $("#birth").val();
		var passWord = $("#passWord").val();
		var sex =$("input[name='sex']:checked").val();
		$.ajax({
			url:"addUser.action",
			data:{userName:userName,passWord:passWord,birth:birth,sex:sex},
			success:function(msg){
				if(msg==1){//成功
					alert("添加成功");
					window.location.reload();
				}
				if(msg==0){//失败
					alert("添加失败，请联系管理员");
				}
			}
		});
	}
	
	//用户数据删除事件，这里是真删数据，测试用，
	function userDelete(id){
		
		//添加是否确定删除选项
		var p = confirm("确定要删除吗？");	
		if(!p) return;
		
		$.ajax({
			url:"deleteUser.action",
			data:{id:id},
			success:function(msg){
				if(msg==1){//成功
					alert("删除成功");
					window.location.reload();
				}
				if(msg==0){//失败
					alert("删除失败，请联系管理员");
				}
			}
		});
	}
	
	//批量删除
	function deletes(){
		
		//添加是否确定删除选项
		var p = confirm("确定要删除吗？");	
		if(!p) return;
		
		var ids = "";
		$("[name='check']").each(function (index, obj) {
            if(obj.checked == true){
            	ids += obj.value + ",";
            }
        });
		ids = ids.substring(0,ids.length-1)
		
		$.ajax({
			url:"deletes.action",
			data:{ids:ids},
			success:function(msg){
				if(msg==1){//成功
					alert("删除成功");
					window.location.reload();
				}
				if(msg==0){//失败
					alert("删除失败，请联系管理员");
				}
			}
		});
		
	}
	
	//用户输入框验证
	function userValidation(user){
		//用户名为4-8位的字母数字组合，不能有特殊字符
		 var checkNum = /^[A-Za-z0-9]{4,8}$/;
		 var p = checkNum.test(user.value);
		 if(!p){
			 alert("用户名必须为4-8位的字母数字组合");
			 $("#submit").prop("disabled",true);
		 }
	}
	
	//用户密码验证
	function passValidation(pass){
		//密码不能全部是数字
		 var checkNum = /^[0-9]+$/;
		 var p = checkNum.test(pass.value);
		 if(p){
			 alert("密码不能全部是数字");
		 }
	}
	
	//搜索方法
	function search(){
		
	}
	
	
	