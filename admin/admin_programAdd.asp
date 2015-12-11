<!--#include file="adminconn.inc"-->
<%
  if session("aleave")="" then
      response.redirect "adminlogin.asp"
	  response.end
  end if
%>
<%
dim rs
dim sql
dim count
set rs=server.createobject("adodb.recordset")
sql = "select * from SmallClass order by SmallClassID asc"
rs.open sql,conn,1,3
%>
<script language = "JavaScript">


function CheckForm()
{
     //document.addNEWS.content.value = document.frames.cnEditBox.getHTML(true);     
     //document.addNEWS.imageNum.value = document.frames.cnEditBox.document.all("editImageNum").value;
     //document.addNEWS.editFirstImageName.value = document.frames.cnEditBox.document.all("editFirstImageName").value;

	if (document.addNEWS.title.value.length == 0) {
		alert("标题没有填写.");
		document.addNEWS.title.focus();
		return false;
	}
	if (document.addNEWS.user.value.length == 0) {
		alert("新闻发布人没有填写");
		document.addNEWS.user.focus();
		return false;
	}
	return true;
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="../css/form.css">
    <link href="umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="umeditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="umeditor/umeditor.min.js"></script>
<title>添加新闻</title>
</head>
<body leftmargin="0" topmargin="0" bgcolor="#F7F7F7">
<form name="addNEWS" method="post" action="admin_programSave.asp"  enctype="multipart/form-data"  class="basic-grey" onSubmit="return CheckForm();">
  <label>
  <span>标题：</span>
  <input name="title" type="text" class="input" size="30">
  </label>
  <!-- 
  <label>
    <span>文件名（含后缀）：</span>
    <input name="filename" type="text" class="input" size="30">
  </label>
   -->
  <label>
  <span>在线链接：</span>
  <input name="url" type="text" class="input" size="30">
  </label>
  <label>
  <span>节目类型：</span>
    <select name="class" id="">
      <option value="每日节目" selected>每日节目</option>
      <option value="荔园观点">荔园观点</option>
    </select>
  </label>
      <label>
        <span>节目介绍：</span><br/><br/><br/>
                <!--<textarea name="content">在这里输入内容</textarea>-->
        <!-- 加载编辑器的容器 -->
        <span>&nbsp;</span>
        <span>&nbsp;</span>
        <!--编辑器在这里-->
        <script id="container" name="content" type="text/plain" style="width:450px;height:230px;"> </script>
      </label>
      <br/><br/>
      <label>
        <span>选择文件：</span>
        <input type="file" name="file1"/>
        <b>注：文件大小限制为20M</b> 
      </label>
      <br>
      <label>
        <span>发布者：</span>
        <input name="user" type="text" value="电台君">
      </label>
      <br/>
      <label>
        <span>&nbsp;</span>
        <span>&nbsp;</span>
        <input type="submit" class="button" value="SEND" />
        <input type="reset" class="button" name="Submit2" value="RESET" > 
      </label>
</form>   

   <script type="text/javascript">
    //实例化编辑器
    var um = UM.getEditor('container');
    um.addListener('blur',function(){
        $('#focush2').html('编辑器失去焦点了')
    });
    um.addListener('focus',function(){
        $('#focush2').html('')
    });
    //按钮的操作
    function insertHtml() {
        var value = prompt('插入html代码', '');
        um.execCommand('insertHtml', value)
    }
    function isFocus(){
        alert(um.isFocus())
    }
    function doBlur(){
        um.blur()
    }
    function createEditor() {
        enableBtn();
        um = UM.getEditor('myEditor');
    }
    function getAllHtml() {
        alert(UM.getEditor('myEditor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UM.getEditor('myEditor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UM.getEditor('myEditor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用umeditor')方法可以设置编辑器的内容");
        UM.getEditor('myEditor').setContent('欢迎使用umeditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UM.getEditor('myEditor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UM.getEditor('myEditor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UM.getEditor('myEditor').selection.getRange();
        range.select();
        var txt = UM.getEditor('myEditor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UM.getEditor('myEditor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UM.getEditor('myEditor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UM.getEditor('myEditor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UM.getEditor('myEditor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            domUtils.removeAttributes(btn, ["disabled"]);
        }
    }
    //实例化结束
</script>
</body>
</html>
