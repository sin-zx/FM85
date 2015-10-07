<%
if request.form("logout")<>"" then 
session("admin")=""
session("password")=""
session("aleave")=""
response.redirect "adminlogin.asp"
end if
%>
<html>
<head>
<LINK href="../css/css.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" href="../css/form.css">
<title>后台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
  <br/>
  <br/>
<form method=post action="chklogin.asp" class="basic-grey">
  <label>
    <span>管理账号：</span>
    <input name="admin" type="text"> 
  </label>
  <label>
    <span>密码：</span>
    <input type="password" name="password"> 
  </label>
  <br/>
  <br/>
  <label>
  <span>&nbsp;</span>
  <span>&nbsp;</span>
  <input type="submit" class="button" name="Submit" value="确定" />
  &nbsp;&nbsp;
  <input type="reset" class="button" name="Submit2" value="重置" >
  </label>
</body>
</html>
