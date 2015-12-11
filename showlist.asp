<!--#include file="conn.asp"-->
<!--#include file="function.asp"-->
<% 
  title="节目列表" 
  b_class="active"
%> 
<!--#include file="header.asp"-->


<div class="intro">
    <h2 class="titleword">您现在收听的是 FM85.0 深圳大学广播电台</h2>
    <img src="imgs/line.png" alt="line">
</div>
<div class="container-fluid">
  <div class="row-fluid">

    <h2 class='sub_title'>每日节目 <img src="imgs/music.png" alt="music"></h2>
    <hr>
    <div class="main main_list">
      <ul class="list" id="list1">
        <% 
          'Set rs=conn.Execute("select top 6 * from News order by id desc") 
          Set rs1=conn.Execute("select title,id from programs where class='每日节目' order by id desc")

          if rs1.eof and rs1.bof then
          %>
          <li><h3>~这里空空如也~</h3></li>
          <%
          else

          dim i
          for i=0 to 4
          %>
          <li>
            <a href="program_detail.asp?id=<% =rs1("id")%> "><% =trimtit(rs1("title"),30)%></a>
          </li>
          <%
          rs1.movenext
          next
          rs1.close
          end if
        %>

      </ul>
      <a  class="more" id="more1">加载更多</a>  
      <div id="AbsolutePage1" hidden>2</div>  <!-- 用于记录当前加载页号，不显示。每加载一次会加1 -->

      <div class="clear"></div>
    </div>  <!-- main end -->
    
    <br><br><br>  
    <img src="imgs/line.png" alt="line" class="line">
    <h2 class='sub_title'>荔园观点  <img src="imgs/video.png" alt="video"></h2>
    <hr>
    <div class="main main_list">
      <ul class="list" id="list2">
        <% 
          'Set rs=conn.Execute("select top 6 * from News order by id desc") 
          Set rs2=conn.Execute("select title,id from programs where class='荔园观点' order by id desc")
          if rs2.eof and rs2.bof then
          %>
          <li><h3>~这里空空如也~</h3></li>
          <%
          else
          dim j
          for j=0 to 4
          %>
          <li>
            <a href="program_detail.asp?id=<% =rs2("id")%> "><% =trimtit(rs2("title"),30)%></a>
          </li>
          <%
          rs2.movenext
          next
          rs2.close
          end if
        %>
       </ul>
      
      <a  class="more" id="more2">加载更多</a>  
      <div id="AbsolutePage2" hidden>2</div>  <!-- 用于记录当前加载页号，不显示。每加载一次会加1 -->
      <div class="clear"></div>

    </div>  <!-- main end -->


<!--#include file="footer.asp"-->



<!-- Modal联系方式模态框 -->
<div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel2">联系我们</h4>
      </div>
      <div class="modal-body">
    <h1>联系方式</h1>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!-- Modal end -->