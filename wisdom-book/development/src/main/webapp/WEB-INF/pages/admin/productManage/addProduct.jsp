<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
    <title>添加品牌</title>
    <LINK href="${pageContext.request.contextPath}/res/css/style.css" type=text/css rel=stylesheet>
    <script language="javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" ></script>
    <script language="javascript" src="${pageContext.request.contextPath}/js/jquery.form.js" ></script>
    <script type="text/javascript">

        $(function() {
            $("body").find("[reg2]").blur(function () {
                var val = $(this).val();
                var reg = $(this).attr("reg2");
                var tip = $(this).attr("tip");
                var regExp = new RegExp(reg);
                if (!regExp.test($.trim(val)) || val=="") {
                    $(this).next("span").text(tip).css("color", "red");
                } else {
                    $(this).next("span").text("");
                }
            });
        })
        $(function() {
            $("#form111").submit(function(){

                var isSubmit = true;
                $(this).find("[reg2]").each(function(){
                    //获得输入的值
                    var val = $(this).val();
                    //获得正则表达式
                    var reg = $(this).attr("reg2");
                    //获得提示信息
                    var tip = $(this).attr("tip");
                    //创建正则表达式的对象
                    var regExp = new RegExp(reg);
                    if(!regExp.test($.trim(val))){
                        isSubmit = false;
                        $(this).next("span").text(tip).css("color","red");
                        //如果想要终止循环要使用return false 不是break和return;
                        return false;
                    }/*else{

                    var inputName = $(this).attr("name");
                    if(inputName == "name"){
                        var result = validProductName(val);
                        if(result == "yes"){
                            $(this).next("span").text("品牌名称已经存在").css("color","red");
                            isSubmit = false;
                            return false;
                        }else{
                            $(this).next("span").text("");
                        }
                    }
                }*/

                })
                return isSubmit;
            });
        });


        function submitUpload(){
            var option = {
                url:"${pageContext.request.contextPath}/upload/upload.do",
                dateType:"text",
                data:{fileName:"upload"},
                success:function (responseText) {
                    //var jsonObj = $.parseJSON(responseText);
                   // var jsonObj = JSON.parse(responseText);
                    var jsonObj = $.parseJSON(responseText.replace(/<.*?>/ig,""));
                    $("#imgSrc").attr("src",jsonObj.realPath);
                    $("#img").val(jsonObj.relativePath);
                },
                error:function () {
                    alert("系统错误!");
                }
            };
            $("#form111").ajaxSubmit(option);
        }
    </script>
</head>
<body id="main">

<div><div class="content">

    <%--<c:url value="/${system}/item/brand/listBrand.do" var="backurl"/>--%>

    <div class="loc icon"><samp class="t12"></samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<a href="#" title="商品列表">商品列表</a>&nbsp;&raquo;&nbsp;<span class="gray">添加或编辑商品</span>
        <a href="#" title="返回品牌管理" class="inb btn80x20">返回商品列表</a>
    </div>
    <form id="form111" name="form111" action="${path }/product/adminProductAdd.do" method="post"> <%--enctype="multipart/form-data"--%>
        <div class="edit set">
            <p><label><samp>*</samp>商品名称：</label><input type="text" id="name" name="name" class="text state" reg2="^[a-zA-Z0-9\u4e00-\u9fa5]{1,20}$" tip="必须是中英文或数字字符，长度1-20"/>
                <span></span>
            </p>

            <p><label><samp>*</samp>商品类别：</label>
                <select name="category" id="category" reg2="[^ -~]" tip="请选择类别！">
                    <option value="" selected="selected">--选择商品类加--</option>
                    <option value="文学">文学</option>
                    <option value="生活">生活</option>
                    <option value="计算机">计算机</option>
                    <option value="外语">外语</option>
                    <option value="经营">经营</option>
                    <option value="励志">励志</option>
                    <option value="社科">社科</option>
                    <option value="学术">学术</option>
                    <option value="少儿">少儿</option>
                    <option value="艺术">艺术</option>
                    <option value="原版">原版</option>
                    <option value="科技">科技</option>
                    <option value="考试">考试</option>
                    <option value="生活百科">生活百科</option>
                 </select>
                <span class="pos">&nbsp;</span>
            </p>

            <p><label class="alg_t"><samp>*</samp>商品图片：</label><img id="imgSrc" src="" height="100" width="100" />
            </p>
            <p><label></label><input type='file' size='27' id='upload' name='upload' class="file" onchange="submitUpload()" /><span id="submitImgTip" class="pos">请上传图片宽为120px，高为50px，大小不超过100K。</span>
                <input type='hidden' id='img' name='imgUrl' value='' reg2="^.+$" tip="亲！您忘记上传图片了。" /><span></span>
            </p>

            <p><label><samp>*</samp>商品价格：</label><input type="text" name="price" class="text state" maxlength="100"  reg2="^([1-9][\d]{0,7}|0)(\.[\d]{1,2})$" tip="输入错误！"/>
                <span class="pos">&nbsp;</span>
            </p>
            <p><label><samp>*</samp>商品数量：</label><input type="number" name="pnum" class="text state" maxlength="100"  reg2="^\d+(\.\d+)?$" tip="输入错误！"/>
                <span class="pos">&nbsp;</span>
            </p>
            <p><label class="alg_t">商品描述：</label><textarea rows="4" cols="45" name="description" class="are" reg1="^(.|\n){0,300}$" tip="任意字符，长度0-300"></textarea>
                <span class="pos">&nbsp;</span>
            </p>
            <p><label>是否显示：</label>
                <select id="display" name="display">
                    <option value="是">是</option>
                    <option value="否">否</option>
                </select>
            </p>
            <p><label>&nbsp;</label><input type="submit" name="button1" d class="hand btn83x23" value="完成" /><input type="button" class="hand btn83x23b" id="reset1" value='取消' onclick="backList('${backurl}')"/>
            </p>
        </div>
    </form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>

