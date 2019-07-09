<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
    <jsp:include page="../includes/head.jsp"></jsp:include>
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
            <jsp:include page="../includes/menu.jsp"></jsp:include>
                </div>
                <div class="page-container">
            <jsp:include page="../includes/lateral.jsp"></jsp:include>
            
                <!-- Content Wrapper. Contains page content -->
                <div class="page-content-wrapper">
                    <div class="page-content" style="min-height: 667px" >
                        <div id="content">
                            <div class="profile-content">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="card">
                                            <div class="card-topline-green"></div>
                                            <div class="white-box">
                                                <div class="p-r1-20">
                                                    <ul class="nav customtab nav-tabs" role="tablist">
                                                        <li class="nav-item"><a href="#tab1" class="nav-link active show" data-toggle="tab"><header>Editar Servicio Social
                                                        <small>Usuario de Servicio</small></header></a></li>
                                                    </ul>
                                                </div>
                                                <div class="tab-content">
                                                    <div class="tab-pane fontawesomw-demo active show" id="tab1">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12">

                                                                    <div class="card-body " id="bar-parent2">
                                                                    <!-- text input -->
                                            <form role="form" method="POST">
                                                <div class="card-body " id="bar-parent2">
                                                                                    <div class="row">
                                                                                        <div class="col-md-6 col-sm-6">               
                                        
                                            <div class="form-group ">
                                                <label for="nombre">Nombre del Alumno</label>
                                                <input id="nombre" name="nombre" type="text" class="form-control" placeholder="Nombre del Alumno..." value="${lista[0].nombre}" onkeyup="javascript:this.value = this.value.toUpperCase();">
                                        </div>
                                        <div class="form-group">
                                            <label for="usuario">Usuario</label>
                                            <input id="usuario" name="usuario" type="text" class="form-control" placeholder="Usuario..." value="${lista[0].usuario}">
                                        </div>
                                        <div class="form-group">
                                            <label for="correo">Correo</label>
                                            <input id="correo" name="correo" type="email" class="form-control" placeholder="usuario@gmail.com..." value="${lista[0].correo}">
                                            <!--<input id="emailAddress" type="email" size="64" maxLength="64" required
                                                placeholder="username@beststartupever.com" pattern=".+@beststartupever.com">-->
                                            <!-- /.input group -->
                                        </div>
                                        <div class="form-group">
                                            <label for="matricula">Matricula</label>
                                            <input id="matricula" name="matricula" type="text" class="form-control" placeholder="S13001317..." value="${lista[0].matricula}">
                                        </div>
                                        <div class="form-group">
                                            <label for="creditos">Creditos</label>
                                            <input id="creditos" name="creditos" type="number" class="form-control" min="1" max="400" value="${lista[0].creditos}">
                                        </div>
                                        <div class="form-group">
                                            <label for="semestre">Semestre</label>
                                            <input id="semestre" name="semestre" type="number" class="form-control" min="1" max="12" value="${lista[0].semestre}">
                                        </div>
                                    
                                        </div>
                                        </div>
                                        </div>
                                    
                                        <button type="submit" class="btn btn-success btn-sm m-b-10">Aceptar</button>
                                        <a href="usuariosS" class="btn btn-default btn-sm m-b-10">Cancelar</a>
                                    
                                </form>
                                                                    </div>

                                                            </div>
                                </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Content Header (Page header) -->
                    
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            
</div>
                                            <jsp:include page="../includes/footer.jsp"></jsp:include>

        </div>

    </body>
</html>