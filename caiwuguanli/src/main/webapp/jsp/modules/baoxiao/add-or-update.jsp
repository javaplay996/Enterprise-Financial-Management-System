<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑报销信息</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">报销信息管理</li>
                        <li class="breadcrumb-item active">编辑报销信息</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">报销信息信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                                <!-- 级联表的字段 -->
                                <div class="form-group col-md-6 aaaaaa">
                                    <label>用户</label>
                                    <div>
                                        <select id="yonghuSelect" name="yonghuSelect"
                                                class="selectpicker form-control"  data-live-search="true"
                                                title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-md-6 bbbbbb">
                                    <label>姓名</label>
                                    <input id="yonghuName" name="yonghuName" class="form-control"
                                           placeholder="姓名" readonly>
                                </div>
                                <div class="form-group col-md-6 bbbbbb">
                                    <label>手机号</label>
                                    <input id="yonghuPhone" name="yonghuPhone" class="form-control"
                                           placeholder="手机号" readonly>
                                </div>
                                <div class="form-group col-md-6 bbbbbb">
                                    <label>身份证号</label>
                                    <input id="yonghuIdNumber" name="yonghuIdNumber" class="form-control"
                                           placeholder="身份证号" readonly>
                                </div>
                                <div class="form-group col-md-6 bbbbbb">
                                    <label>照片</label>
                                    <img id="yonghuPhotoImg" src="" width="100" height="100">
                                </div>
                                <div class="form-group col-md-6 bbbbbb">
                                    <label>权限类型</label>
                                    <input id="roleValue" name="roleValue" class="form-control"
                                           placeholder="权限类型" readonly>
                                </div>
                                <!-- 当前表的字段 -->
                                <input id="updateId" name="id" type="hidden">
                                <input id="yonghuId" name="yonghuId" type="hidden">
                                <div class="form-group col-md-6">
                                    <label>报销名目</label>
                                    <input id="baoxiaoName" name="baoxiaoName" class="form-control"
                                           placeholder="报销名目">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>报销类型</label>
                                    <select id="baoxiaoTypesSelect" name="baoxiaoTypes" class="form-control">
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>报销金额</label>
                                    <input id="baoxiaoMoney" name="baoxiaoMoney" class="form-control"
                                           onchange="baoxiaoMoneyChickValue(this)" placeholder="报销金额">
                                </div>
                                <div class="form-group  col-md-6">
                                    <label>提交备注</label>
                                    <input id="baoxiaoContentupload" name="file" type="file">
                                    <script id="baoxiaoContentEditor" type="text/plain"
                                            style="width:100%;height:230px;"></script>
                                    <script type = "text/javascript" >
                                    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                    //相见文档配置属于你自己的编译器
                                    var baoxiaoContentUe = UE.getEditor('baoxiaoContentEditor', {
                                        toolbars: [
                                            [
                                                'undo', //撤销
                                                'bold', //加粗
                                                'redo', //重做
                                                'underline', //下划线
                                                'horizontal', //分隔线
                                                'inserttitle', //插入标题
                                                'cleardoc', //清空文档
                                                'fontfamily', //字体
                                                'fontsize', //字号
                                                'paragraph', //段落格式
                                                'inserttable', //插入表格
                                                'justifyleft', //居左对齐
                                                'justifyright', //居右对齐
                                                'justifycenter', //居中对
                                                'justifyjustify', //两端对齐
                                                'forecolor', //字体颜色
                                                'fullscreen', //全屏
                                                'edittip ', //编辑提示
                                                'customstyle', //自定义标题
                                            ]
                                        ]
                                    });
                                    </script>
                                    <input type="hidden" name="baoxiaoContent" id="baoxiaoContent-input">
                                </div>
                                <div class="form-group col-md-6 bbbbbb">
                                    <label>是否上交</label>
                                    <select id="baoxiaoShangjiaoTypesSelect" name="baoxiaoShangjiaoTypes" class="form-control">
                                    </select>
                                </div>
                                <div class="form-group col-md-6 cccccc bbbbbb">
                                    <label>是否批准</label>
                                    <select id="baoxiaoYesnoTypesSelect" name="baoxiaoYesnoTypes" class="form-control">
                                    </select>
                                </div>
                                <div class="form-group col-md-12 mb-3">
                                    <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                    <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "baoxiao";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var baoxiaoTypesOptions = [];
    var baoxiaoShangjiaoTypesOptions = [];
    var baoxiaoYesnoTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var yonghuOptions = [];

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

        $('#baoxiaoContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('baoxiaoContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            // if($("#yonghuId") !=null){
            //     var yonghuId = $("#yonghuId").val();
            //     if(yonghuId == null || yonghuId =='' || yonghuId == 'null'){
            //         alert("申请人不能为空");
            //         return;
            //     }
            // }
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';

            }
            httpJson("baoxiao/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addbaoxiao');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function baoxiaoTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=baoxiao_types", "GET", {}, (res) => {
                if(res.code == 0){
                    baoxiaoTypesOptions = res.data.list;
                }
            });
        }
        function baoxiaoShangjiaoTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=baoxiao_shangjiao_types", "GET", {}, (res) => {
                if(res.code == 0){
                    baoxiaoShangjiaoTypesOptions = res.data.list;
                }
            });
        }
        function baoxiaoYesnoTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=baoxiao_yesno_types", "GET", {}, (res) => {
                if(res.code == 0){
                    baoxiaoYesnoTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
        function yonghuSelect() {
            //填充下拉框选项
            http("yonghu/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    yonghuOptions = res.data.list;
                }
            });
        }

        function yonghuSelectOne(id) {
            http("yonghu/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                yonghuShowImg();
                yonghuShowVideo();
                yonghuDataBind();
            }
        });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationBaoxiaotypesSelect(){
            var baoxiaoTypesSelect = document.getElementById('baoxiaoTypesSelect');
            if(baoxiaoTypesSelect != null && baoxiaoTypesOptions != null  && baoxiaoTypesOptions.length > 0 ){
                for (var i = 0; i < baoxiaoTypesOptions.length; i++) {
                    baoxiaoTypesSelect.add(new Option(baoxiaoTypesOptions[i].indexName,baoxiaoTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationBaoxiaoshangjiaotypesSelect(){
            var baoxiaoShangjiaoTypesSelect = document.getElementById('baoxiaoShangjiaoTypesSelect');
            if(baoxiaoShangjiaoTypesSelect != null && baoxiaoShangjiaoTypesOptions != null  && baoxiaoShangjiaoTypesOptions.length > 0 ){
                for (var i = 0; i < baoxiaoShangjiaoTypesOptions.length; i++) {
                    baoxiaoShangjiaoTypesSelect.add(new Option(baoxiaoShangjiaoTypesOptions[i].indexName,baoxiaoShangjiaoTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationBaoxiaoyesnotypesSelect(){
            var baoxiaoYesnoTypesSelect = document.getElementById('baoxiaoYesnoTypesSelect');
            if(baoxiaoYesnoTypesSelect != null && baoxiaoYesnoTypesOptions != null  && baoxiaoYesnoTypesOptions.length > 0 ){
                for (var i = 0; i < baoxiaoYesnoTypesOptions.length; i++) {
                    baoxiaoYesnoTypesSelect.add(new Option(baoxiaoYesnoTypesOptions[i].indexName,baoxiaoYesnoTypesOptions[i].codeIndex));
                }
            }
        }

        function initializationyonghuSelect() {
            var yonghuSelect = document.getElementById('yonghuSelect');
            if(yonghuSelect != null && yonghuOptions != null  && yonghuOptions.length > 0 ) {
                for (var i = 0; i < yonghuOptions.length; i++) {
                        yonghuSelect.add(new Option(yonghuOptions[i].yonghuName, yonghuOptions[i].id));
                }

                $("#yonghuSelect").change(function(e) {
                        yonghuSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var baoxiaoTypesSelect = document.getElementById("baoxiaoTypesSelect");
        if(baoxiaoTypesSelect != null && baoxiaoTypesOptions != null  && baoxiaoTypesOptions.length > 0 ) {
            for (var i = 0; i < baoxiaoTypesOptions.length; i++) {
                if (baoxiaoTypesOptions[i].codeIndex == ruleForm.baoxiaoTypes) {//下拉框value对比,如果一致就赋值汉字
                        baoxiaoTypesSelect.options[i].selected = true;
                }
            }
        }

        var baoxiaoShangjiaoTypesSelect = document.getElementById("baoxiaoShangjiaoTypesSelect");
        if(baoxiaoShangjiaoTypesSelect != null && baoxiaoShangjiaoTypesOptions != null  && baoxiaoShangjiaoTypesOptions.length > 0 ) {
            for (var i = 0; i < baoxiaoShangjiaoTypesOptions.length; i++) {
                if (baoxiaoShangjiaoTypesOptions[i].codeIndex == ruleForm.baoxiaoShangjiaoTypes) {//下拉框value对比,如果一致就赋值汉字
                        baoxiaoShangjiaoTypesSelect.options[i].selected = true;
                }
            }
        }

        var baoxiaoYesnoTypesSelect = document.getElementById("baoxiaoYesnoTypesSelect");
        if(baoxiaoYesnoTypesSelect != null && baoxiaoYesnoTypesOptions != null  && baoxiaoYesnoTypesOptions.length > 0 ) {
            for (var i = 0; i < baoxiaoYesnoTypesOptions.length; i++) {
                if (baoxiaoYesnoTypesOptions[i].codeIndex == ruleForm.baoxiaoYesnoTypes) {//下拉框value对比,如果一致就赋值汉字
                        baoxiaoYesnoTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var yonghuSelect = document.getElementById("yonghuSelect");
            if(yonghuSelect != null && yonghuOptions != null  && yonghuOptions.length > 0 ) {
                for (var i = 0; i < yonghuOptions.length; i++) {
                    if (yonghuOptions[i].id == ruleForm.yonghuId) {//下拉框value对比,如果一致就赋值汉字
                        yonghuSelect.options[i+1].selected = true;
                        $("#yonghuSelect" ).selectpicker('refresh');
                    }
                }
            }
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
        if (ruleForm.baoxiaoContent != null && ruleForm.baoxiaoContent != 'null' && ruleForm.baoxiaoContent != '' && $("#baoxiaoContentupload").length>0) {

            var baoxiaoContentUeditor = UE.getEditor('baoxiaoContentEditor');
            baoxiaoContentUeditor.ready(function () {
                var mes = '';
                if(ruleForm.baoxiaoContent != null){
                    mes = ''+ ruleForm.baoxiaoContent;
                    mes = mes.replace(/\n/g, "<br>");
                }
                baoxiaoContentUeditor.setContent(mes);
            });
        }
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
        if($("#baoxiaoContentupload").length>0) {
            var baoxiaoContentEditor = UE.getEditor('baoxiaoContentEditor');
            if (baoxiaoContentEditor.hasContents()) {
                $('#baoxiaoContent-input').attr('value', baoxiaoContentEditor.getPlainTxt());
            }
        }
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function baoxiaoMoneyChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[0-9]{0,6}(\.[0-9]{1,2})?$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("只允许输入整数6位,小数2位的数字");
                return false;
            }
        }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addbaoxiao');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                yonghuId: "required",
                baoxiaoName: "required",
                baoxiaoTypes: "required",
                insertTime: "required",
                baoxiaoMoney: "required",
                baoxiaoContent: "required",
                baoxiaoShangjiaoTypes: "required",
                baoxiaoYesnoTypes: "required",
            },
            messages: {
                yonghuId: "申请人不能为空",
                baoxiaoName: "报销名目不能为空",
                baoxiaoTypes: "报销类型不能为空",
                insertTime: "申请时间不能为空",
                baoxiaoMoney: "报销金额不能为空",
                baoxiaoContent: "提交备注不能为空",
                baoxiaoShangjiaoTypes: "是否上交不能为空",
                baoxiaoYesnoTypes: "是否批准不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addbaoxiao = window.sessionStorage.getItem("addbaoxiao");
        if (addbaoxiao != null && addbaoxiao != "" && addbaoxiao != "null") {
            //注册表单验证
            $(validform());
            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("baoxiao/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 设置视频src
                    showVideo();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {
            laydate.render({
                elem: '#insertTime-input'
                ,type: 'datetime'
            });
    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        yonghuDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#yonghuId").val(ruleForm.yonghuId);
        $("#baoxiaoName").val(ruleForm.baoxiaoName);
        $("#insertTime-input").val(ruleForm.insertTime);
        $("#baoxiaoMoney").val(ruleForm.baoxiaoMoney);
        $("#baoxiaoContent").val(ruleForm.baoxiaoContent);

    }
    <!--  级联表的数据回显  -->
    function yonghuDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#yonghuId").val(ruleForm.id);

        $("#yonghuName").val(ruleForm.yonghuName);
        $("#yonghuPhone").val(ruleForm.yonghuPhone);
        $("#yonghuIdNumber").val(ruleForm.yonghuIdNumber);
        $("#roleValue").val(ruleForm.roleValue);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        yonghuShowImg();
    }


    <!--  级联表的图片  -->

    function yonghuShowImg() {
        $("#yonghuPhotoImg").attr("src",ruleForm.yonghuPhoto);
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        yonghuShowVideo();
    }


    <!--  级联表的视频  -->

    function yonghuShowVideo() {
        $("#yonghuPhotoV").attr("src",ruleForm.yonghuPhoto);
    }



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            baoxiaoTypesSelect();
            baoxiaoShangjiaoTypesSelect();
            baoxiaoYesnoTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            yonghuSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationBaoxiaotypesSelect();
            initializationBaoxiaoshangjiaotypesSelect();
            initializationBaoxiaoyesnotypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationyonghuSelect();

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
        window.sessionStorage.removeItem('addbaoxiao');
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') == '管理员') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events: none;');
            $('#baoxiaoName').attr('readonly', 'readonly');
            $('#baoxiaoMoney').attr('readonly', 'readonly');
            $('#baoxiaoTypesSelect').attr('readonly', 'readonly');
            $('#baoxiaoTypesSelect').attr('style', 'pointer-events: none;');
            $('#baoxiaoShangjiaoTypesSelect').attr('readonly', 'readonly');
            $('#baoxiaoShangjiaoTypesSelect').attr('style', 'pointer-events: none;');
            var baoxiaoContentUeditor = UE.getEditor('baoxiaoContentEditor');
            baoxiaoContentUeditor.ready(function () {
                var mes = '' + ruleForm.baoxiaoContent;
                baoxiaoContentUeditor.setContent(mes);
                baoxiaoContentUeditor.setDisabled('fullscreen');
            });
        }else if (window.sessionStorage.getItem('role') == '普通员工') {
            $(".aaaaaa").remove();
            $(".bbbbbb").remove();
            // 报销金额设置不可选
            // $('#baoxiaoMoney').attr('readonly', 'readonly');
        }else if (window.sessionStorage.getItem('role') == '财务经理') {
            $(".aaaaaa").remove();
            $(".cccccc").remove();
            // 报销金额设置不可选
            $('#baoxiaoName').attr('readonly', 'readonly');
            $('#baoxiaoMoney').attr('readonly', 'readonly');
            $('#baoxiaoTypesSelect').attr('readonly', 'readonly');
            $('#baoxiaoTypesSelect').attr('style', 'pointer-events: none;');
            var baoxiaoContentUeditor = UE.getEditor('baoxiaoContentEditor');
            baoxiaoContentUeditor.ready(function () {
                var mes = '' + ruleForm.baoxiaoContent;
                baoxiaoContentUeditor.setContent(mes);
                baoxiaoContentUeditor.setDisabled('fullscreen');
            });
        }else{
            // alert("未知情况.......");
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>