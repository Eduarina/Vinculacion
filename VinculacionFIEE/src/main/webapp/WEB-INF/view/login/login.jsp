<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<spring:url value="/resources" var="urlPublic"/>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
    <body class="hold-transition login-page">
        <jsp:include page="../includes/head.jsp"></jsp:include>
        <div class="login-box">
            <div class="login-logo">
                <a href="/VinculacionFIEE/"><b>Vinculación</b>FIEE</a>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Inicio de Sesión</p>

                <form:form action="login" method="post" modelAttribute="usuario">
                    <div class="form-group has-feedback">
                        <form:input path="user" type="text" autocomplete="off" required="required" class="form-control" placeholder="Usuario..." />
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <form:input path="password" type="password" autocomplete="off" required="required" class="form-control" placeholder="Contraseña..."/>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary btn-block btn-flat"><i class="fa fa-sign-in"></i> Iniciar Sesión</button>
                        <!-- /.col -->
                    </div>
                    <span style="color: red;">${message}</span>
                </form:form>
            </div>
            <!-- /.login-box-body -->
        </div>
        <!-- /.login-box -->

        <!-- jQuery 3 -->
        <script src="../../bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- iCheck -->
        <script src="../../plugins/iCheck/icheck.min.js"></script>
        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' /* optional */
                });
            });
        </script>
</html>
