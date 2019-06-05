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
        <body class="hold-transition skin-green-light sidebar-mini">
            <div class="wrapper">

            <jsp:include page="../includes/menu.jsp"></jsp:include>

            <jsp:include page="../includes/lateral.jsp"></jsp:include>
            <c:if test="${empty sessionScope['user']}">
                <c:redirect url="/bitacora/lista" />
            </c:if>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Proyectos
                        <small>Lista de Proyectos</small>
                    </h1>
                </section>

                <!-- Main content -->
                <section class="content container-fluid">

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Nuevo Proyecto</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <div class="box-body">
                                        <form:form method="POST" style="font-size:16px;" action="insertar" modelAttribute="proyecto">
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="titulo">Titulo: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="titulo" class="form-control" placeholder="Titulo del proyecto" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <br>
                                        </div>
                                            <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="dependencia">Dependencia: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="dependencia" class="form-control" placeholder="Dependencia" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <br>
                                        </div> 
                                            <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="ubicacion">Ubicacion: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="ubicacion" class="form-control" placeholder="Dependencia" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <br>
                                        </div> 
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="horario">Horario: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="horario" class="form-control" placeholder="Horario servicio" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="fechainicio">Fecha Inicio: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="fechainicio" type="text" class="form-control" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="fechafin">Fecha Fin: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="fechafin" type="text" class="form-control" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <br>
                                        </div>
                                            <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="objetivo">Objetivo: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:input path="objetivo" class="form-control" placeholder="Objetivo" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <br>
                                        </div>
                                            <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="actividades">Actividades: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                                <form:textarea path="actividades" class="form-control" placeholder="Actividades" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                            </div>
                                            <br><br>
                                        </div>
                                             <div class="form-group">
                                            <div class="col-sm-2" >
                                                <form:label path="tipo">Tipo: </form:label>
                                            </div>
                                            <div class="col-sm-8" >
                                            <form:select path="tipo" cssClass="form-control">
                                                <form:option value="0">Tipo de proyecto</form:option>
                                                <form:option value="1">Servicio Social</form:option>
                                                <form:option value="2">Practicas Profesionales</form:option>
                                            </form:select>
                                            </div>
                                            <br>
                                        </div>
                                    </div>
                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-success">Aceptar</button>
                                            <a href="lista" class="btn btn-default">Cancelar</a>
                                        </div>
                                    </form:form>
                                    </div>
                            </div>
                            <!-- /.box -->
                        </div>
                    </div>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
        </div>
        <jsp:include page="../includes/footer.jsp"></jsp:include>

    </div>

</body>
</html>
