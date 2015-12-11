<!--#include file="conn.asp"-->
<!--#include file="function.asp"-->

<% 
  title="FM85.0" 
  a_class="active"
%> 
<!--#include file="header.asp"-->

<!-- 图片轮播 -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="imgs/bg1.jpg" alt="...">
      <div class="carousel-caption">
        <h2>图片介绍</h2>
        <p>write something here</p>
      </div>
    </div>
    <div class="item">
      <img src="imgs/bg2.jpg" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    <div class="item">
      <img src="imgs/bg3.jpg" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div class="intro">
		<h2 class="titleword">您现在收听的是 FM85.0 深圳大学广播电台</h2>
		<img src="imgs/line.png" alt="line" class="line">
		<a href="order.asp" class="btn btn-lg btn-success">我要点歌</a>
</div>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="row">
		  <div class="col-md-7">
		  	<h2 class='sub_title'>近期节目</h2>
			<hr>
			<div class="main">
				<ul class="list">
			        <% 
			          'Set rs1=conn.Execute("select top 4 * from programs where class='每日节目' order by id desc")
						Set rs1=server.createobject("adodb.recordset")
						sql="select top 4 * from programs where class='每日节目' order by id desc"
						rs1.open sql,conn,1,3

			          if rs1.eof and rs1.bof then
			          %>
			          <li><h3>~这里空空如也~</h3></li>
			          <%
			          else
			          rs1.movefirst 	'(将指针移到第一条记录)
						
						'控制循环次数，只显示4条
			          if rs1.RecordCount<4 then
			          	k=rs1.RecordCount-1
			          else
			          	k=3
			          end if

			          '循环开始
			          dim i
			          for i=0 to k
			          %>
			          <li>
			            <a class="tit"><% =trimtit(rs1("title"),30)%></a>
			            <div class="operateBtn">
							<a href='<% =rs1("url") %>' target="_blank"><button type="button" class="btn btn-success">在线收听</button></a>
							<a href="program_detail.asp?id=<% =rs1("id")%>"><button type="button" class="btn btn-info">查看详情</button></a>
						</div>
			          </li>
			          <%
			          rs1.movenext 	'(将指针移动到下一条记录)
			          next	'继续循环

					  rs1.close
					  
					  set rs1=nothing

			          end if
			        %>

			        
			    </ul>
				<a href="showlist.asp" class="more">往期节目</a>  
				<div class="clear"></div>
			</div>	

			<h2 class='sub_title'>点点传情</h2>
			<hr>
			<div class="main">
				
			</div>

		</div>

			<div class="col-md-5">
				<h2 class='sub_title'>公告栏</h2>
				<hr>
				<div class="main">
					<ul class="list">

					<% Set rs2=conn.Execute("select top 5 *from News order by id desc")
					if rs2.eof then
					%>
					<li><h3>~这里空空如也~</h3></li>
					<%
					else
					dim j
					for j=0 to 4
					%>
					<li>
						<a class="ntitle" href="news_detail.asp?id=<% =rs2("id")%> "><% =trimtit(rs2("title"),20)%></a>
					</li>
					<%
					rs2.movenext
					next

					rs2.close
					conn.close 
					set conn=nothing
					end if
					%>
					</ul>
				</div>
			</div>
		</div>				
	</div>
</div>

<!--#include file="footer.asp"-->