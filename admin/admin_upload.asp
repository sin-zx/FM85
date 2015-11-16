<!--#include file="adminconn.inc"-->
<%
  if session("aleave")="" then
      response.redirect "adminlogin.asp"
	  response.end
  end if
%>
<script language = "JavaScript">


function CheckForm()
{

	if (document.addNEWS.title.value.length == 0) {
		alert("标题没有填写.");
		document.addNEWS.title.focus();
		return false;
	}
		if (document.addNEWS.user.value.length == 0) {
		alert("发布人没有填写");
		document.addNEWS.user.focus();
		return false;
	}
	return true;
}
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="../css/form.css" type="text/css">
<title>资料上传</title>
</head>
<body leftmargin="0" topmargin="0" bgcolor="#F7F7F7">
  <form class="basic-grey" name="addNEWS" method="post" action="upload/upload.asp"  enctype="multipart/form-data" onSubmit="return CheckForm();">
          <label>
          <span>文件名：</span>
          <input id="name" type="text" name="title" />
          </label>
          <label>
          <span>文件介绍：</span>
           <textarea name="content"></textarea>
          </label>
          <label>
          <span>发布人：</span>
          <input type="text" name="user" value="admin"/>
          </label>
          
          <br/>
        <label>
        <span>选择文件：</span>
        <input type="file" name="file1" />
        <b>注：文件大小限制为20M</b> 
         </label>
      <br/>
      <br/>
      
          <label>
          <span>&nbsp;</span>
          <span>&nbsp;</span>
          <input type="submit" class="button" value="SEND" />
          <input type="reset" class="button" name="Submit2" value="RESET" > 
          </label>
          </form>
</body>
</html>