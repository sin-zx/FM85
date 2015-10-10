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
                      <a href="?funo=1"><h4>学术动态</h4></a>
                    </li>
                    <li>
                      <a href="?funo=2"><h4>实验室相关</h4></a>
                    </li>
                  </ul>
            </div>
            <div class="content2 span8">

                <ul class="list">
                    <%
                        funo=request("funo")
                        if funo="" then funo=1
                        page=clng(request("page"))
                        Set rs=Server.CreateObject("ADODB.RecordSet") 
                        if funo=1 then
                        sql="select  * from News where BigClassName='资讯' and  SmallClassName='学术动态' order by id desc"
                        elseif funo=2 then
                        sql="select  * from News where BigClassName='资讯' and  SmallClassName='实验室相关' order by id desc"
                        end if

                        rs.Open sql,conn,1,1
                        if rs.eof and rs.bof then
                        response.Write("<h1>没有记录</h1>")
                        else
                        rs.PageSize=8
                        end if
                        if page=0 then page=1 
                        pages=rs.pagecount
                        if page > pages then page=pages
                        rs.AbsolutePage=page  
                            
                        for j=1 to rs.PageSize 
                    %>
                    

                    <li>
                        <a class="ntitle" href="content.asp?id=<% =rs("id")%>"><% =trimtit(rs("title"),15)%></a>
                        <span class="ntime"><% =rs("infotime")%></span>
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


    <!--
    <div class="span8">
      <ul>
        <li>
          新闻资讯撒发达阿斯顿 撒旦阿德的亲卫队
        </li>
        <li>
          体育竞技晚点亲卫队亲卫队趣闻去1111111
        </li>
        <li>
          娱乐八卦434444444个如果额发
        </li>
        <li>
          前沿科技撒旦阿三222222222222222222222
        </li>
        <li>
          环球财经烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦
        </li>
        <li>
          天气预报威威威威威威威威威威威威威威
        </li>
        <li>
          房产家居威威威威威威威威威威威威威威威威威威威威威威
        </li>
        <li>
          网络游戏嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡
        </li>
      </ul>
      <div class="pagination pagination-centered">
        <ul>
          <li>
            <a href="#">上一页</a>
          </li>
          <li>
            <a href="#">1</a>
          </li>
          <li>
            <a href="#">2</a>
          </li>
          <li>
            <a href="#">3</a>
          </li>
          <li>
            <a href="#">4</a>
          </li>
          <li>
            <a href="#">5</a>
          </li>
          <li>
            <a href="#">下一页</a>
          </li>
        </ul>
      </div>
    </div>
 
-->