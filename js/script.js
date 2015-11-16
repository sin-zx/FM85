/*	首页登陆模块的ajax提交
 * 	页面按钮效果
 * 	表单提交
 *	by zixin 2015.10
 */

$(document).ready(function(){

	// 登陆框调用ajax代码：
        $("#wish").keydown(function (event) {
            if (event.which == "13") {//回车键，用.ajax提交表单
                $("#btnSub").trigger("click");
            }
        });

	/*登陆部分结束*/

/*表单检查*/
	/*$("#addbtn").click(function () {
		var bookname=$("#bookname").val();  
		var sort=$("#sort").val();
		if(bookname==null || bookname==""){  
		    $("#addbook_warning").text("书名不能为空！");
	        $("#addFail").show();
		    $("#bookname").focus();  
		}
		else if(sort==null || sort==""){  
		    $("#addbook_warning").text("请添加分类！");
	        $("#addFail").show();
		    $("#sort").focus();  
		}
		else{  
		   $("#addForm").submit(); 
		}   
	});*/

/*表单部分结束*/
});

function checkForm(){  

	var fromWho=$("#fromWho").val();  
	var toWho=$("#toWho").val();
    var songname=$("#songname").val();
    var fromInfo=$("#fromInfo").val();
    var toInfo=$("#toInfo").val();
    var wish=$("#wish").val();

	if(fromWho==null || fromWho=="" || toWho==null || toWho==""){  
	    $("#addFail").text("您或对方的称呼不能为空！");
	    $("#addFail").show();
	    $("#fromWho").focus();  
	    return false;
	}
	else if(wish==null || wish==""){  
        $("#addFail").text("寄语不能为空！");
        $("#addFail").show();
        $("#wish").focus();
        return false;
    }
	else{  
            //开始发送数据
            $.ajax
            ({ 
                url: "orderHandle.asp", 
                dataType: 'html', //这里的html是指什么？~！！！！！！！！！
                //传送请求数据
                type:"post",
                data: { 
                    fromWho : fromWho, 
                    toWho : toWho,
                    songname : songname,
                    fromInfo : fromInfo,
                    toInfo : toInfo,
                    wish : wish
                },
                success: function(data){
                    if(data =="ok")
                      {
                        $("#addSuccess").text("提交成功！");
                        $("#addSuccess").show();
                        setTimeout("javascript:location.href=''", 1000);    //1秒后跳转
                        //window.location.href="index.asp";
                      }
                      else
                      {
                        $("#addFail").text("提交失败！请重试");
                        $("#addFail").show();
                      }
                }
            });
	} 
}  


