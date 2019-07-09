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
                <c:if test="${empty sessionScope['user']}">
                <c:redirect url="/bitacora/lista" />
                </c:if>
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
                                                        <li class="nav-item"><a href="#tab1" class="nav-link active show" data-toggle="tab"><header>Proyectos
                                                        <small>Lista de Proyectos</small></header></a></li>
                                                    </ul>
                                                </div>
                                                <div class="tab-content">
                                                    <div class="tab-pane fontawesome-demo active show" id="tab1">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12">

                                                                    <div class="card-body " id="bar-parent2">
                                                                    <!-- text input -->
                                                                        <form:form method="POST" style="font-size:16px;" action="insertar" modelAttribute="proyecto">
                                                                            <div class="form-group">
                                                                                <label path="titulo">Titulo: </label>
                                                                                <input path="titulo" class="form-control" placeholder="Titulo del proyecto" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                                                                <br>
                                                                            </div>
                                                                                <div class="form-group">
                                                                                <label path="dependencia">Dependencia: </label>
                                                                                <input path="dependencia" class="form-control" placeholder="Dependencia" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                                                                <br>
                                                                            </div> 
                                                                                <div class="form-group">
                                                                                <label path="ubicacion">Ubicacion: </label>
                                                                                <input path="ubicacion" class="form-control" placeholder="Dependencia" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                                                                <br>
                                                                            </div> 
                                                                            <div class="form-group">
                                                                                <label path="horario">Horario: </label>
                                                                                <input path="horario" class="form-control" placeholder="Horario servicio" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                                                                <br>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label path="fechainicio">Fecha Inicio: </label>
                                                                                <input path="fechainicio" type="text" class="form-control" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                                                                <br>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label path="fechafin">Fecha Fin: </label>
                                                                                <input path="fechafin" type="text" class="form-control" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                                                                <br>
                                                                            </div>
                                                                                <div class="form-group">
                                                                                <label path="objetivo">Objetivo: </label>
                                                                                <input path="objetivo" class="form-control" placeholder="Objetivo" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                                                                <br>
                                                                            </div>
                                                                                <div class="form-group">
                                                                                <label path="actividades">Actividades: </label>
                                                                                
                                                                                
                                                                                    <form:textarea path="actividades" class="form-control" placeholder="Actividades" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                                                                
                                                                                <br><br>
                                                                            </div>
                                                                                 <div class="form-group">
                                                                                
                                                                                    <form:label path="tipo">Tipo: </form:label>
                                                                                
                                                                                
                                                                                <select path="tipo" cssClass="form-control">
                                                                                    <option value="0">Tipo de proyecto</option>
                                                                                    <option value="1">Servicio Social</option>
                                                                                    <option value="2">Practicas Profesionales</option>
                                                                                </select>
                                                                                
                                                                                <br>
                                                                            </div>
                                                                        </div>
                                                                            
                                                                                <button type="submit" class="btn btn-success">Aceptar</button>
                                                                                <a href="lista" class="btn btn-default">Cancelar</a>
                                                                            
                                    </form:form>
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
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</div>
</body>
</html>
