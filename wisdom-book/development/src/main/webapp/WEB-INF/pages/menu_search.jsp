<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/my.js">
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
<script type="text/javascript">

    function search(){
		var div = document.getElementById("content");
		var name = document.getElementById("name");
		var value = name.value;
		var url="${pageContext.request.contextPath }/product/searchByName.do";
		var params = {"name":value};
        /*$.ajax({
            "url":url,
            "data":params,
            "type":"POST",
            "contenttype" :"application/x-www-form-urlencoded;charset=utf-8",
            "success":function(data){
                alert(data);
            },
            "error":function(){
                alert("服务器繁忙，请稍后重试");
            }
        });*/

        $.post(url,params,function(data){
            if(value==""){
                div.style.display = "none";
                return;
            }
            data = data.substring(1, data.length);
            var arr = data.split(",");
            var childDivs = "";
            for(var i=0;i<arr.length;i++){
                childDivs+="<div onclick='fillNameValue(this)' onmouseover='changeBackground_over(this)' onmouseout='changeBackground_out(this)'>"+arr[i].trim()+"</div>";
            }
            div.innerHTML = childDivs;
            div.style.display = "block";
        })
	}; 
	
</script>

<script type="text/javascript">
	function fillNameValue(subDiv) {
		document.getElementById("name").value = subDiv.innerHTML;
		
		document.getElementById("content").style.display="none";
	}
	function changeBackground_over(div){
		div.style.background="gray";
	}
	function changeBackground_out(div){
		div.style.background="white";
	}
</script>

<div id="divmenu">
	<a href="${pageContext.request.contextPath}/product/productList.do?category=文学">文学</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=生活">生活</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=计算机">计算机</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=外语">外语</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=经营">经管</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=励志">励志</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=社科">社科</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=学术">学术</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=少儿">少儿</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=艺术">艺术</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=原版">原版</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=科技">科技</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=考试">考试</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=生活百科">生活百科</a>
	<a href="${pageContext.request.contextPath}/product/productList.do?category=所有书籍"
		style="color:#FFFF00">全部商品目录</a>
</div>
<div id="divsearch">
	<form action="${pageContext.request.contextPath}/product/productList.do"
		method="post">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td style="text-align:right; padding-right:20%;">
				Search <input
					type="text" name="name" class="inputtable" onkeyup="search()"
					id="name" />
					<input type="image" onclick="submitForm()" src="${pageContext.request.contextPath}/images/serchbutton.gif"
					border="0" style="margin-bottom:-6px">
				</td>
			</tr>
		</table>

	</form>
</div>
<div id="content"
	style="background-color:white;width:128px;position:absolute; text-align:left;margin-left:67.9%;color:black;float:left;margin-top: -20px;display: none">
</div>