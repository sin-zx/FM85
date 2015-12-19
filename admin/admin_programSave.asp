<% Response.Charset="UTF-8" %>  
<!--#include file="upload/UpLoad_Class.asp"-->
<!--#include file="adminconn.inc"-->
<%
dim upload
set upload = new AnUpLoad
upload.Exe = "*"
upload.MaxSize = 20 * 1024 * 1024 		'20M
upload.Charset = "utf-8"
upload.GetData()
if upload.ErrorID>0 then 
	response.Write upload.Description
else
	dim file,savpath

	classD=upload.forms("class")
	'选择存储路径
	If classD = "每日节目" Then
		savepath = "../programs/audio"
	Else
		savepath = "../programs/video"
	End  If   

title=upload.forms("title")
url=upload.forms("url")
user=upload.forms("user")
mContent = trim(upload.forms("content")) 
if mContent="" then mContent="无" end if
	mContent = Replace(mContent,"<script","<sscript") 
	mContent = Replace(mContent,"/script>","/scripts>")
	mContent = Replace(mContent,"/script >","/scripts>")
if title ="" then title ="无" end if
if url="" then url="blank" end if
if user="" then user="电台君" end if


	
	set file = upload.files("file1")
	if file.isfile then	'如果有上传文件
		result = file.saveToFile(savepath,0,true)
		if result then
				set rs=server.createobject("adodb.recordset")
				sql="select * from programs where id is null"
				rs.open sql,conn,1,3
				rs.addnew
				rs("title")=title
				rs("content")=mcontent
				rs("user")=user	
				rs("class")=classD
				
					rs("filename")=file.filename 	'存储的文件名
					rs("localname")=file.localname 	'原本的文件名
					rs("filepath")=Server.MapPath(savepath & "/" & file.filename) 	'完整存储路径，方便删除文件
			
				rs("url")=url
				rs.update
				rs.close
				set rs=nothing
				conn.close
				set conn=nothing
				
				response.write "<script language='javascript'>" & chr(13)
				response.write "alert('添加成功！');" & Chr(13)
				response.write "window.document.location.href='admin_program.asp';"&Chr(13)
				response.write "</script>" & Chr(13)
				Response.End
		else
			response.write "<script language='javascript'>" & chr(13)
			response.write "alert('添加失败！请重试或联系管理员');" & Chr(13)
			response.write "window.document.location.href='admin_program.asp';"&Chr(13)
			response.write "</script>" & Chr(13)
			Response.End	
		end if

	else '无上传文件
		set rs=server.createobject("adodb.recordset")
		sql="select * from programs where id is null"
		rs.open sql,conn,1,3
		rs.addnew
		rs("title")=title
		rs("content")=mcontent
		rs("user")=user	
		rs("class")=classD
		rs("filename")="empty"
		rs("localname")="empty"
		rs("filepath")="empty"
		rs("url")=url
		rs.update
		rs.close
		set rs=nothing
		conn.close
		set conn=nothing
		
		response.write "<script language='javascript'>" & chr(13)
		response.write "alert('添加成功！');" & Chr(13)
		response.write "window.document.location.href='admin_program.asp';"&Chr(13)
		response.write "</script>" & Chr(13)
		Response.End		
		


	end if
end if
set upload = nothing
%>
