<!--#include file="conn.asp"-->
<%
key=request("key")
otype=request("otype")
if key="" then
   response.write "<script>alert('�����ַ�������Ϊ�գ�');history.back();</Script>"
   response.end
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="css.css" type="text/css">
<title>��ŵ�������ŷ�������ϵͳ</title>
</head>
<body topmargin="0"><!--#include file="top.asp"-->
<table width="756" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="170" height="300" valign="top" bgcolor="efefef"> 
      <!--#include file="left.asp"-->
    </td>
    <td width="600" align="center" valign="top" bgcolor="#FFFFFF"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#EEEEEE">
        <% 
Set rs= Server.CreateObject("ADODB.Recordset")
if otype="title" then
sql="select * from NEWS where title Like '%"& key &"%' order by id desc"
elseif otype="msg" then
sql="select * from NEWS where content Like '%"& key &"%' order by id desc"
else
end if
rs.open sql,conn,1,1
if rs.eof and rs.bof then
response.write "<p align='center'>�Բ���û���ҵ��������</p>"
else
%>
        <tr bgcolor="#CC6600"> 
          <td width="9%" height="25" align="center"><font color="#FFFFFF">ID</font></td>
          <td width="55%" align="center"><font color="#FFFFFF">���ű���</font></td>
          <td width="15%" align="center"><font color="#FFFFFF">������</font></td>
          <td width="21%" align="center"><font color="#FFFFFF">��������</font></td>
        </tr>
        <%
i=0
do while not rs.eof
%>
        <tr bgcolor="#FFFFFF"> 
          <td height="22" align="center"><%=rs("id")%></td>
          <td>��<a href="funonews.asp?id=<%=rs("id")%>"  target="_blank"><%=rs("title")%></a></td>
          <td align="center"><%=left(rs("user"),5)%></td>
          <td align="center"><%=rs("infotime")%></td>
        </tr>
        <%
rs.movenext
i=i+1                                                         
loop
%>
        <tr bgcolor="#FFFFFF"> 
          <td height="24" colspan="4"> <div align="center">�ؼ���<font color="#FF0000"><strong><%=key%></strong></font>����Ϊ���ҵ�<font color="#FF0000"><%=i%></font>������</div></td>
        </tr>
        <% 
end if
rs.close
set rs=nothing
%>
      </table> 
    </td>
  </tr>
</table><!--#include file="bottom.asp"-->
</body>
</html>
