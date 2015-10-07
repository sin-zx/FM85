<!--#include file="adminconn.inc"-->
<%
set rs=server.CreateObject("ADODB.RecordSet")
rs.open "select * from files where id="&request.QueryString("id"),conn,1,1
dim filepath
filepath=rs("filepath")
set rs=nothing

'删除文件
Set rsf=server.CreateObject("scripting.FileSystemObject")
rsf.DeleteFile(filepath)
Set rsf = nothing

'删除数据库记录'
set rss=server.CreateObject("ADODB.RecordSet")
rss.open "delete * from files where id="&request.QueryString("id"),conn,1
set rss=nothing

		response.write "<script language='javascript'>alert('成功删除！');" & chr(13)
		'response.write "alert('成功删除！');" & Chr(13)
		response.write "window.document.location.href='loadlist.asp';"&Chr(13)
		response.write "</script>" & Chr(13)
Response.End
%>