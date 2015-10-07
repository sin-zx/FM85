<% 
'判断文件名是否存在
if Request("Filename")="" then 
response.write "<h1>Error:</h1>Filename is empty!<p>" 
end if

' 下面是不希望下载的文件
FileExt = Mid(Filename, InStrRev(Filename, ".") + 1)

Select Case UCase(FileExt)

    Case "ASP", "ASA", "ASPX", "ASAX", "MDB","html"

        Response.Write "受保护文件,无法下载."
        Response.End
End Select
 
call downloadFile(replace(replace(Request("Filename"),"\",""),"/",""))

'定义函数
Function downloadFile(strFile) 
' make sure you are on the latest MDAC version for this to work 
' get full path of specified file 

strFilename = server.MapPath("admin/upload/files" & "/" & strFile) 

' clear the buffer 
Response.Buffer = True 
Response.Clear 

' create stream 
Set s = Server.CreateObject("ADODB.Stream") 
s.Open 

' Set as binary 
s.Type = 1 

' load in the file 
on error resume next 

' check the file exists 
Set fso = Server.CreateObject("Scripting.FileSystemObject") 
if not fso.FileExists(strFilename) then 
Response.Write("<h1>Error:</h1>"&strFilename&"does not exists!<p>") 
Response.End 
end if 
' get length of file 
Set f = fso.GetFile(strFilename) 
intFilelength = f.size 

s.LoadFromFile(strFilename) 
if err then 
Response.Write("<h1>Error: </h1>Unknown Error!<p>") 
Response.End 
end if 
' send the headers to the users Browse 
Response.AddHeader "Content-Disposition","attachment; filename="&f.name 
Response.AddHeader "Content-Length",intFilelength 
Response.CharSet = "UTF-8" 
Response.ContentType = "application/octet-stream" 
' output the file to the browser 
Response.BinaryWrite s.Read 
Response.Flush 
' tidy up 
s.Close 
Set s = Nothing 
End Function 
%>