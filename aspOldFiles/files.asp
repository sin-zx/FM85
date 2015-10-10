<!--#include file="conn.asp"-->
<!--#include file="function.asp"-->
<!DOCTYPE html>
<head>
    <title>深大土木力学实验室</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/blocks.css">
    
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery-2.1.3.min.js" type="text/javascript"></script>
    <link href="css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.slideBox.js" type="text/javascript"></script>
    
<script>
jQuery(function($){
  $('#slidebox').slideBox();
});
</script>
</head>
<body>   
<div class="container">
    <!--#include file="head.asp"-->     <!--引入头部文件-->
    <!--#include file="slidebox.asp"-->   <!--图片轮播-->
    <div class="content">                                               <!--资讯列表-->
            <div class="content1 span4">
    
                  <ul class="nav nav-list">
                    <li class="nav-header">
                      <h4><资讯列表></h4>
                    </li>
                    <li>
                      <a><h4>文件下载</h4></a>
                    </li>
                  </ul>
            </div>
            <div class="content2 span8">

                <ul class="list">
                    <%
                        page=clng(request("page"))
                        Set rs=Server.CreateObject("ADODB.RecordSet") 
                        sql="select  * from files order by id desc"
                        rs.Open sql,conn,1,1
                        if rs.eof and rs.bof then
                        response.Write("<h1>没有记录</h1>")
                        else
                        rs.PageSize=6
                        end if
                        if page=0 then page=1 
                        pages=rs.pagecount
                        if page > pages then page=pages
                        rs.AbsolutePage=page  
                            
                        for j=1 to rs.PageSize 
                    %>
                    

                    <li>
                        <a class="ntitle" href="download.asp?id=<% =rs("id")%>"><% =trimtit(rs("title"),15)%></a>
                        <span class="ntime"><% =rs("loadtime")%></span>
                    </li>
                    <%
                      rs.movenext
                      if rs.eof then exit for
                      next    
                    %>
                </ul>
                <br/><br/><br/>
                <div class="分页">
                    <table width="65%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                      <form method=Post action="info.asp">  
                            <td height="30" align="center"> 
                              <%if Page<2 then      
                              response.write "首页 上一页&nbsp;"
                            else
                              response.write "<a href=info.asp?page=1>首页</a>&nbsp;"
                              response.write "<a href=info.asp?page=" & Page-1 & ">上一页</a>&nbsp;"
                            end if
                            if rs.pagecount-page<1 then
                              response.write "下一页 尾页"
                            else
                              response.write "<a href=info.asp?page=" & (page+1) & ">"
                              response.write "下一页</a> <a href=info.asp?page="&rs.pagecount&">尾页</a>"
                            end if
                             response.write "&nbsp;页次：<strong><font color=red>"&Page&"</font>/"&rs.pagecount&"</strong>页 "
                              response.write "&nbsp;共<b><font color='#FF0000'>"&rs.recordcount&"</font></b>条记录 <b>"&rs.pagesize&"</b>条记录/页"
                             response.write " 转到：<input type='text' name='page' size=4 maxlength=10 class=input value="&page&">"
                             response.write " <input class=input type='submit'  value=' Goto '  name='cndok'></span></p>"     
                              %>
                          </td>
                      </form>
                      </tr>
                      </table>
                </div>

            </div>
        </div>


    <!--#include file="footer.asp"-->
</div>
</body>
</html>