<!--#include file="adminconn.inc"-->
<%
  if session("aleave")="" then
      response.redirect "adminlogin.asp"
	  response.end
  end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>点歌管理</title>
</head>

<body >
  <br>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#C6C6C6">
  <tr> 
    <td width="5%" height="25" align="center" bgcolor="#CCCCCC">ID</td>
    <td width="7%" align="center" bgcolor="#CCCCCC">点歌的人</td>
    <td width="7%" align="center" bgcolor="#CCCCCC">送给谁</td>
    <td width="10%" align="center" bgcolor="#CCCCCC">歌曲</td>
    <td width="30%" align="center" bgcolor="#CCCCCC">寄语</td>
    <td width="10%" align="center" bgcolor="#CCCCCC">本人学院年级</td>
    <td width="10%" align="center" bgcolor="#CCCCCC">对方学院年级</td>
    <td width="5%" align="center" bgcolor="#CCCCCC">日期</td>
    <td width="6%" align="center" bgcolor="#CCCCCC">状态</td>
    <td width="10%" align="center" bgcolor="#CCCCCC">操作</td>
  </tr>
  <%
page=clng(request("page"))
Set rs=Server.CreateObject("ADODB.RecordSet") 
sql="select * from orders order by id desc"
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

if rs("checked")=0 then
  stat="未点出"
else
  stat="已点出"
end if
%>
  <tr bgcolor="#FFFFFF"> 
    <td height="22" align="center"><%=rs("id")%></td>
    <td align="center"><%=rs("fromWho")%> </td>
    <td align="center"><%=rs("toWho")%> </td>
    <td align="center"><%=rs("songname")%> </td>
    <td align="center"><%=rs("wish")%> </td>
    <td align="center"><%=rs("fromInfo")%> </td>
    <td align="center"><%=rs("toInfo")%> </td>
    <td align="center"><%=rs("addtime")%></td>
    <td align="center"><%=stat %> </td>
    <td align="center"><a href="admin_orderModi.asp?id=<%=rs("id")%>">点出</a> <a href="admin_orderDel.asp?id=<%=rs("id")%>">删除</a></td>
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
<form method=Post action="admin_info.asp">  
      <td height="30" align="center"> 
    <%if Page<2 then      
    response.write "首页 上一页&nbsp;"
  else
    response.write "<a href=admin_info.asp?page=1>首页</a>&nbsp;"
    response.write "<a href=admin_info.asp?page=" & Page-1 & ">上一页</a>&nbsp;"
  end if
  if rs.pagecount-page<1 then
    response.write "下一页 尾页"
  else
    response.write "<a href=admin_info.asp?page=" & (page+1) & ">"
    response.write "下一页</a> <a href=admin_info.asp?page="&rs.pagecount&">尾页</a>"
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
