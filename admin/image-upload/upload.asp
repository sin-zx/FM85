
<!--#include file="UpLoad_Class.asp"-->
<!--#include file="adminconn.inc"-->

<%
dim upload
set upload = new AnUpLoad
upload.Exe = "jpg|bmp|jpeg|gif|png"
upload.MaxSize = 10 * 1024 * 1024 		'10M
upload.GetData()
if upload.ErrorID>0 then 
	response.Write upload.Description
else
	dim file,savpath
	savepath = "images"
	set file = upload.files("file1")
	if file.isfile then
		result = file.saveToFile(savepath,0,true)
		if result then
			dim rs
				dim sql
				set rs=server.createobject("adodb.recordset")
				sql="select * from imageWall where id is null"
				rs.open sql,conn,1,3
				
				title=upload.forms("title")
				
				rs.addnew
				rs("title")=title
				rs("loadtime")=date()
				rs("filename")=file.FileName
				rs("localname")=file.localname
				rs("filepath")=server.MapPath(savepath & "/" & file.filename)
				'rs("filetype")=file.extend
				'rs("BigClassName")=BigClassName
				'rs("SmallClassName")=SmallClassName
				rs.update
				rs.close
				set rs=nothing
				conn.close
				set conn=nothing

			
				response.write"<SCRIPT language=JavaScript>alert('上传成功！');"
				response.write"javascript:history.go(-1)</SCRIPT>"

		else
			response.Write file.Exception
		end if
	end if
end if
set upload = nothing
%>