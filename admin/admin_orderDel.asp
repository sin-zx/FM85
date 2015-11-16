<% Response.Charset="UTF-8" %> 
<!--#include file="adminconn.inc"-->
<%
set rs=server.CreateObject("ADODB.RecordSet")
rs.open "delete * from orders where id="&request.QueryString("id"),conn,1
set rs=nothing
response.write "<script language='javascript'>" & chr(13)
		response.write "alert('成功删除！');" & Chr(13)
		response.write "window.document.location.href='admin_order.asp';"&Chr(13)
		response.write "</script>" & Chr(13)
Response.End
%>
