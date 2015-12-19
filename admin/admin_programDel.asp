<% Response.Charset="UTF-8" %>  
<!--#include file="adminconn.inc"-->
<%

'查找出文件的存储路径
set rs=server.CreateObject("ADODB.RecordSet")
rs.open "select * from programs where id="&request.QueryString("id"),conn,1,1
dim filepath
filepath=rs("filepath")
set rs=nothing

'删除文件
if filepath<>"empty" then
Set rsf=server.CreateObject("scripting.FileSystemObject")
rsf.DeleteFile(filepath)
Set rsf = nothing
end if 
'删除数据库记录'
set rss=server.CreateObject("ADODB.RecordSet")
rss.open "delete * from programs where id="&request.QueryString("id"),conn,1
set rss=nothing



response.write "<script language='javascript'>" & chr(13)
		response.write "alert('成功删除！');" & Chr(13)
		response.write "window.document.location.href='admin_program.asp';"&Chr(13)
		response.write "</script>" & Chr(13)
Response.End
%>
