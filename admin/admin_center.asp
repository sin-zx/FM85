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
          <td class="tableHeaderText" colspan=2 height=55>管理员：<font color="#A52A2A"><strong><%=session("admin")%></strong></font> 
            <font size="2">欢迎进入后台管理系统！请慎用您的权限</font> </td>
        </tr>
        <td> 
            <font size="2"><strong>网站制作者： <font color="#00FFFF">NewScript工作室</font></strong> 
        </td>
        <!--
        <tr> 
          <th colspan=2 bgcolor="#E1DBEC" class="tableHeaderText"> 
            <table width="95%" border="0" cellpadding="0" cellspacing="2" bgcolor="#C6C0E2">
              <tr> 
                <td height="30" align="center" bgcolor="#E1DBEC"><font color="#0000FF"><strong>献给广大个人站长：建站必备程序之—风诺新闻发布管理系统 
                  V1.0 </strong></font></td>
              </tr>
              <tr> 
                <td bgcolor="#E1DBEC">使用本系统注意事项：</td>
              </tr>
              <tr> 
                <td height="25" bgcolor="#E1DBEC">　　1，本程序由<a href="mailto:webmaster@funo.cn"><font color="#0000FF">曾经沧海</font></a>独立开发,免费提供给中小型网站使用;非经<a href="mailto:webmaster@funo.cn"><font color="#0000FF">曾经沧海</font></a><a href="mailto:cnowen@hotmail.com"></a>许可,不得将之用于盈利或非盈利性的商业用途！</td>
              </tr>
              <tr> 
                <td height="25" bgcolor="#E1DBEC">　　2，本系统为共享程序,用户自由选择是否使用,在使用中出现任何问题而造成的损失<a href="mailto:webmaster@funo.cn"><font color="#0000FF">曾经沧海</font></a><a href="mailto:cnowen@hotmail.com"></a>不负任何责任！</td>
              </tr>
              <tr> 
                <td height="25" bgcolor="#E1DBEC">　　3，尊重作者劳动成果,希望各站长在使用时不要修改版权和制作申明！！！</td>
              </tr>
              <tr> 
                <td height="25" bgcolor="#E1DBEC">　　4，此版本为免费版本,不提供任何技术支持;需要更好的程序请联系作者<a href="mailto:webmaster@funo.cn"><font color="#0000FF">曾经沧海</font></a><a href="mailto:cnowen@hotmail.com"></a>订做. 
                  联系邮箱：webmaster@funo.cn</td>
              </tr>
              <tr> 
                <td height="25" align="right" bgcolor="#E1DBEC">&nbsp;</td>
              </tr>
            </table>
          </th>
        </tr>
      -->
      </table></td>
  </tr>
</table>
</body>
</html>
