<% 
'简单的加密解密函数
function encrypt(ecode) 
  Dim texts 
  dim i 
  for i=1 to len(ecode) 
  texts=texts & chr(asc(mid(ecode,i,1))+i) 
  next 
  encrypt = texts 
end function 

function decrypt(dcode) 
  dim texts 
  dim i 
  for i=1 to len(dcode) 
  texts=texts & chr(asc(mid(dcode,i,1))-i) 
  next 
  decrypt=texts 
end function 
%>