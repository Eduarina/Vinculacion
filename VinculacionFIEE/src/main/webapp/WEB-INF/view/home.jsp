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
<html lang="es">
    <jsp:include page="includes/head.jsp"></jsp:include>
        <!--
        BODY TAG OPTIONS:
        =================
        Apply one or more of the following classes to get the
        desired effect
        |---------------------------------------------------------|
        | SKINS         | skin-blue                               |
        |               | skin-black                              |
        |               | skin-purple                             |
        |               | skin-yellow                             |
        |               | skin-red                                |
        |               | skin-green                              |
        |---------------------------------------------------------|
        |LAYOUT OPTIONS | fixed                                   |
        |               | layout-boxed                            |
        |               | layout-top-nav                          |
        |               | sidebar-collapse                        |
        |               | sidebar-mini                            |
        |---------------------------------------------------------|
        -->
        <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-blue white-sidebar-color logo-white">
            
            <div class="page-wrapper">
                <div class="page-header navbar navbar-fixed-top">
            <jsp:include page="includes/menu.jsp"></jsp:include>
            </div>
            <div class="page-container">
            <jsp:include page="includes/lateral.jsp"></jsp:include>
                <!-- Content Wrapper. Contains page content -->
                <div class="page-content-wrapper">
                    <div class="page-content" style="min-height: 667px">
                        <div id="content">
                            <section class="content container-fluid">

                    <form:form method = "POST" modelAttribute = "fileUpload"
                               enctype = "multipart/form-data">
                        Please select a file to upload : 
                        <input type = "file" name = "file" />
                        <input type = "submit" value = "upload" />
                    </form:form>

                </section>
                            
                        </div>
                    </div>
                    <!-- Content Header (Page header) -->
                    <!--<section class="content-header">
                        <h1>
                            Sistema de Gestión de Servicio Social
                            <!--                        <small>Contenido</small>-->
                        <!--</h1>-->
                        <!--                    <ol class="breadcrumb">
                                                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                                                <li class="active">Inicio</li>
                                            </ol>-->
                    <!--</section>-->

                    <!-- Main content -->
                    
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <jsp:include page="includes/footer.jsp"></jsp:include>


        </div>
            <div class="page-footer">
                <div class="page-footer-inner"> 2018 &copy; Smile Admin Theme By
                    <a href="mailto:redstartheme@gmail.com" target="_top" class="makerCss">RedStar Theme</a>
                </div>
                <div class="scroll-to-top">
                    <i class="icon-arrow-up"></i>
                </div>
            </div>
        </div>
    </body>
</html>
