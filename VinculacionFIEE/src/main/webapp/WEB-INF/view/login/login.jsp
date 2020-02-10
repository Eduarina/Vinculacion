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
<html style="height:100%;">
    <jsp:include page="../includes/head.jsp"></jsp:include>
    <body class="bg-dark" style="height:100%;">
        <div class="col-sm-5" style="background:#18529D; height:100%;"></div>
        <div class="col-sm-7">
            <div class="login-content">
                <div class="login-logo">
                    <a href="index.html">
                        <img class="align-content" src="${urlPublic}/assets/img/Logo-UV.jpg" alt="">
                    </a>
                </div>
                <div class="login-form">
                    <form:form action="login" method="post" modelAttribute="usuario">
                        <div class="form-group">
                            <form:input path="user" type="text" autocomplete="off" required="required" class="form-control" placeholder="Usuario..." />
                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                        </div>
                        <div class="form-group">
                            <form:input path="password" type="password" autocomplete="off" required="required" class="form-control" placeholder="Contraseña..."/>
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary btn-block btn-flat"><i class="fa fa-sign-in"></i> Iniciar Sesión</button>
                        </div
                        <span style="color: red;">${message}</span>
                    </form:form>              
                </div>
            </div>
        </div>
    </div>


    <script src="${urlPublic}/vendors/jquery/dist/jquery.min.js"></script>
    <script src="${urlPublic}/vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="${urlPublic}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${urlPublic}/assets/js/main.js"></script>
    </body>
</html>

