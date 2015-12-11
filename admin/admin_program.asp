<!--#include file="adminconn.inc"-->
<!--#include file="function.asp"-->
<%
  if session("aleave")="" then
      response.redirect "adminlogin.asp"
	  response.end
  end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>节目管理</title>
</head>

<body >
  <br>
  <h3>&nbsp;&nbsp;<a href="admin_programAdd.asp">添加节目</a></h3>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#C6C6C6">
  <tr> 
    <td width="5%" height="25" align="center" bgcolor="#CCCCCC">ID</td>
    <td width="30%" align="center" bgcolor="#CCCCCC">标题</td>
    <td width="5%" align="center" bgcolor="#CCCCCC">发布者</td>
    <td width="10%" align="center" bgcolor="#CCCCCC">分类</td>
    <td width="10%" align="center" bgcolor="#CCCCCC">文件名</td>
    <td width="15%" align="center" bgcolor="#CCCCCC">在线链接</td>
    <td width="10%" align="center" bgcolor="#CCCCCC">发布日期</td>
    <td width="15%" align="center" bgcolor="#CCCCCC">操作</td>
  </tr>
  <%
page=clng(request("page"))
Set rs=Server.CreateObject("ADODB.RecordSet") 
sql="select * from programs order by id desc"
rs.Open sql,conn,1,1
if rs.eof and rs.bof then
response.Write("<h2>没有记录</h2>")
else
rs.PageSize=10
if page=0 then page=1 
pages=rs.pagecount
if page > pages then page=pages
rs.AbsolutePage=page  

for j=1 to rs.PageSize 
%>
  <tr bgcolor="#FFFFFF"> 
    <td height="22" align="center"><%=rs("id")%></td>
    <td>　
      <a href="../program_detail.asp?id=<%=rs("id")%>" target="_blank" title="<%=rs("title")%>"><%=left(rs("title"),20)%></a>
    </td>
    <td align="center"><%=left(rs("user"),5)%></td>
    <td align="center"><%=rs("class")%> </td>
    <td align="center"><%=rs("filename")%> </td>
    <td align="center"> <a href=<%=rs("url")%>><%=rs("url")%></a>  </td>
    <td align="center"><%=rs("addtime")%></td>
    <td align="center"><a href="admin_programModi.asp?id=<%=rs("id")%>">修改</a> <a href="admin_programDel.asp?id=<%=rs("id")%>">删除</a></td>
  </tr>
  <%
rs.movenext
if rs.eof then exit for
next                                                       
%>
</table>
  
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
<form method=Post action="admin_program.asp">  
      <td height="30" align="center"> 
    <%if Page<2 then      
    response.write "首页 上一页&nbsp;"
  else
    response.write "<a href=admin_program.asp?page=1>首页</a>&nbsp;"
    response.write "<a href=admin_program.asp?page=" & Page-1 & ">上一页</a>&nbsp;"
  end if
  if rs.pagecount-page<1 then
    response.write "下一页 尾页"
  else
    response.write "<a href=admin_program.asp?page=" & (page+1) & ">"
    response.write "下一页</a> <a href=admin_program.asp?page="&rs.pagecount&">尾页</a>"
  end if
   response.write "&nbsp;页次：<strong><font color=red>"&Page&"</font>/"&rs.pagecount&"</strong>页 "
    response.write "&nbsp;共<b><font color='#FF0000'>"&rs.recordcount&"</font></b>条记录 <b>"&rs.pagesize&"</b>条记录/页"
   response.write " 转到：<input type='text' name='page' size=4 maxlength=10 class=input value="&page&">"
   response.write " <input class=input type='submit'  value=' Goto '  name='cndok'></span></p>"     
%>
      </td></form>
  </tr>
</table>
<% 
end if
rs.close
set rs=nothing
%>

</body>
</html>
