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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6"  style="padding-left: 0;">
                    <div class="row">             
                        <div class="col-md-12" >
                            <img class="img-responsive" src="${urlPublic}/assets/img/loginverdadero.jpg" alt="" style="width: 50%;height: 100%;position: fixed; box-sizing: inherit;">
                        </div>
                    </div>

                </div>
                <div class="col-md-6 ">
                    <div class="row">                    
                        <div class="form-title">
                            <h3 style="color:#18529D;">Universidad Veracruzana</h3>
                            <h3 style="color:#666666;">Sistema Gestor de Vinculación</h3>
                            <h3 style="color:#666666;">Facultad de Ingenier&iacute;a El&eacute;ctrica y Electr&oacute;nica</h3>
                        </div>
                            
                    </div>
                    <!-- Login Form-->
                    <div class="row">                    
                        <div class="login-form text-center">
                            <div>
                            </div>
                            <div class="form formLogin">
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
                            </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- start js include path -->
        <script src="assets/plugins/jquery/jquery.min.js" ></script>
        <script src="assets/js/pages/extra_pages/pages.js" ></script>
        <!-- end js include path -->
    </body>
</html>

