<%
  if session("aleave")="" then
      response.redirect "adminlogin.asp"
	  response.end
  end if
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="stylesheet" type="text/css" href="../css/form.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>！！！</title>
</head>

<body >
<table border="0" cellspacing="1" width="100%" align=center>
  <tr> 
    <td width="100%"><table cellpadding="3" cellspacing="1" border="0" width="100%" class="tableBorder" align=center>
        <tr> 
          <td height=10 colspan=2 bgcolor="#B1B4D1" class="tableHeaderText"> <div align="center">后台管理 
            </div></td>
        </tr>
        <tr> 
          <td class="tableHeaderText" colspan=2 height=55>
            管理员：<font color="#A52A2A" size="3"><strong><%=session("admin")%></strong></font> 
          </td>
        </tr>
        <td> 
          <font size="3">欢迎进入后台管理系统！请慎用您的权限</font>
          <br><br>  
          <font size="3">联系制作者:zixin_xu@foxmail.com
        </td>

      </table></td>
  </tr>
</table>
</body>
</html>
