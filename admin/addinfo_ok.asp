﻿<!--#include file="adminconn.inc"-->
<%
title=request.form("title")
BigClassName=request.form("BigClassName")
SmallClassName=request.form("SmallClassName")
	mContent = trim(Request.form("content")) 
	mContent = Replace(mContent,"<script","<sscript") 
	mContent = Replace(mContent,"/script>","/scripts>")
	mContent = Replace(mContent,"/script >","/scripts>")
	'mimageNum = Request.form("imageNum")
	'firstImageName = trim(Request.form("editFirstImageName"))
user=request.form("user")
ok=request.form("ok")

set rs=server.createobject("adodb.recordset")
sql="select * from NEWS where id is null"
rs.open sql,conn,1,3
rs.addnew
rs("title")=title
rs("content")=mcontent
rs("user")=user
rs("BigClassName")=BigClassName
rs("SmallClassName")=SmallClassName
'if ok<>"" then rs("ok") = ok
'if mimageNum<>"" then rs("imageNum") = mimageNum 
'if firstImageName<>"" then rs("firstImageName") = firstImageName
rs.update
rs.close
set rs=nothing
conn.close  
set conn=nothing
response.write "<script language='javascript'>" & chr(13)
		response.write "alert('新闻提交成功！');" & Chr(13)
		response.write "window.document.location.href='admin_info.asp';"&Chr(13)
		response.write "</script>" & Chr(13)
Response.End
%>
