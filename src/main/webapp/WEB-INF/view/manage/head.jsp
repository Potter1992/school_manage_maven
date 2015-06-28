<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>学生异动管理</title>
    <jsp:include page="css_js.jsp"/>
    <script src="../js/auto_hidden.js"></script>
</head>
<body>
<div class="lefter">
    <div class="logo">
        <strong class="text-big">学生异动管理</strong>
    </div>
    <div></div>
</div>
<div class="righter" id="admin-nav">
    <div class="mainer">
        <div class="admin-navbar" style="margin-top: 16px">
				<span class="float-right"> <a
                        class="button button-little bg-yellow" href="unLogin">注销登录</a>
				</span>
            <ul class="nav nav-inline admin-nav">
                <li class="active"><a href="#" class="icon-cog"> 详情</a>
                    <ul>
                        <li id="alert_main">
                            <div class="alert alert-info" style="background-color: #eee">
                                <button type="button" class="close" data-dismiss="alert"
                                        ></button>
                                <h4>提示!</h4>
                                <strong>警告!</strong> 请注意你的个人隐私安全.
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="admin radius">
    <div class="tab">
        <div class="tab-head">
            <ul class="tab-nav" style="margin-top: 10px; margin-left: 10px;">
                <strong>管理员</strong>
                <li id="manage_hidden">
                    <ul id="main_manage">
                        <li class="active"><a href="#tab-approve-detail">审核成员管理</a></li>
                        <li><a href="#tab-change-detail">异动管理</a></li>
                        <li><a href="#tab-role-detail" onclick="getRoleJSP();">角色管理</a></li>
                    </ul>
                </li>
            </ul>
        </div>