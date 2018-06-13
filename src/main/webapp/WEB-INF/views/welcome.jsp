<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>后台管理系统</title>
	<link href="${ctx}/static/bootstrap/css/bootstrap.css?v=3.3.7" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/AdminLTE.min.css" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/font-awesome.min.css" rel="stylesheet" />
	<link href="${ctx}/static/adminlte/css/skins/skin-blue-light.min.css" rel="stylesheet">
	<link href="${ctx}/static/consumer/css/content.css" rel="stylesheet">
	
	<script src="${ctx}/static/jquery/js/jquery-3.3.1.min.js"></script>
	<script src="${ctx}/static/bootstrap/js/bootstrap.min.js?v=3.3.7"></script>
	<script src="${ctx}/static/adminlte/js/adminlte.min.js"></script>
	<script src="${ctx}/static/adminlte/js/jquery.slimscroll.min.js"></script>
</head>
<body class="">
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Welcome!
        <small><shiro:principal/></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="${ctx }/welcome"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Welcome</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

    </section>
</div>
</body>
</html>