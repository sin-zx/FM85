<% Response.Charset="UTF-8" %> 
<!--#include file="adminconn.inc"-->
<%

Set rs=Server.Createobject("adodb.recordset")
sql="select checked from orders where id="&request.QueryString("id")
rs.open sql,conn,1,3
rs("checked")=1
rs.update
rs.close
set rs=nothing
conn.close  
set conn=nothing


response.write "<script language='javascript'>" & chr(13)
        response.write "alert('点出成功！');" & Chr(13)
        response.write "window.document.location.href='admin_order.asp';"&Chr(13)
        response.write "</script>" & Chr(13)
Response.End
%>
