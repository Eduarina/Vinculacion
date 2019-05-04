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

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Editar Reporte Mensual
                            <small></small>
                        </h1>
                        <!--                        <ol class="breadcrumb">
                                                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                                                    <li class="active">Inicio</li>
                                                </ol>-->
                    </section>

                    <!-- Main content -->
                    <section class="content container-fluid">

                        <!--------------------------
                        | Your Page Content Here |
                        -------------------------->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Reporte ${reporte[0].numero}</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <form:form action="editar" method="POST" modelAttribute="datos">
                                    <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>

                                    <form:hidden path="idreporte"/>
                                    <form:hidden path="idservicio"/>
                                    <div class="box-body">
                                        <div class="form-group col-md-6">
                                            <label for="nombre">Nombre del Alumno:</label>
                                            <input id="nombre" name="nombre" type="text" class="form-control" value="${usuario[0].nombre}" disabled="true" placeholder="Nombre del Alumno..." onkeyup="javascript:this.value = this.value.toUpperCase();">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="carrera">Programa Educativo:</label>
                                            <input id="carrera" name="carrera" type="text" value="${servicio[0].carrera}" disabled="true" class="form-control" placeholder="Carrera...">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="correo">Correo:</label>
                                            <input id="correo" name="correo" type="email" class="form-control" value="${servicio[0].correo}" disabled="true" placeholder="usuario@gmail.com...">
                                            <!--<input id="emailAddress" type="email" size="64" maxLength="64" required
                                                placeholder="username@beststartupever.com" pattern=".+@beststartupever.com">-->
                                            <!-- /.input group -->
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="telefono">Teléfono:</label>
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-phone"></i>
                                                </div>
                                                <input id="telefono" name="telefono" type="text" class="form-control" value="${servicio[0].telefono}" disabled="true" data-inputmask='"mask": "(999) 999-9999"' data-mask>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="celular">Celular:</label>
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-phone"></i>
                                                </div>
                                                <input id="celular" name="celular" type="text" class="form-control" value="${servicio[0].celular}" disabled="true" data-inputmask='"mask": "(999) 999-9999"' data-mask>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="matricula">Matricula:</label>
                                            <input id="matricula" name="matricula" type="text" value="${servicio[0].matricula}" disabled="true" class="form-control" placeholder="S13001317...">
                                        </div>
                                        <div class="form-group col-md-2">
                                            <form:label path="numero">Reporte:</form:label>
                                            <form:input path="numero" type="text" disabled="true" value="${reporte[0].numero}" cssClass="form-control"/>
                                        </div>
                                        <!--Date--> 
                                        <div class="form-group col-md-2">
                                            <label for="datepicker">Fecha de Reporte:</label>
                                            <c:set var="errorband"><form:errors path="datepicker"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <c:if test="${empty datos.datepicker}">
                                                        <input id="datepicker" name="datepicker" type="text" value="${reporte[0].fecha}" class="form-control pull-right-container">
                                                    </c:if>
                                                    <c:if test="${not empty datos.datepicker}">
                                                        <input id="datepicker" name="datepicker" type="text" value="${datos.datepicker}" class="form-control pull-right-container">
                                                    </c:if>
                                                </div>
                                                <!--/.input group--> 
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input id="datepicker" name="datepicker" type="text" style="border-color:red;" class="form-control pull-right-container">
                                                </div>
                                                <!--/.input group--> 
                                            </c:if>
                                        </div>
                                        <!--Date--> 
                                        <div class="form-group col-md-2">
                                            <label path="datepicker2">Fecha de Vencimiento:</label>

                                            <div class="input-group date">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input id="datepicker2" name="datepicker2" type="text" value="${reporte[0].fechalim}" class="form-control pull-right-container" disabled="true">
                                            </div>
                                            <!--/.input group--> 
                                        </div>
                                        <div class="form-group col-md-6">
                                            <form:label path="dependencia">Dependencia:</form:label>
                                            <c:set var="errorband"><form:errors path="dependencia"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:input path="dependencia" type="text" cssClass="form-control" placeholder="Dependencia..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:input path="dependencia" type="text" cssClass="form-control" placeholder="Dependencia..." autocomplete="off" style="border-color:red;" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                            <form:label path="telefono">Teléfono de la Dependencia:</form:label>
                                            <c:set var="errorband"><form:errors path="telefono"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-phone"></i>
                                                    </div>
                                                    <c:if test="${empty datos.telefono}">
                                                        <input id="telefono" name="telefono" value="${reporte[0].telefono}" type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask=""/>
                                                    </c:if>
                                                    <c:if test="${not empty datos.telefono}">
                                                        <input id="telefono" name="telefono" value="${datos.telefono}" type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask=""/>
                                                    </c:if>
                                                </div>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-phone"></i>
                                                    </div>
                                                    <input id="telefono" name="telefono" value="${datos.telefono}" type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask="" style="border-color:red;"/>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <form:label path="horario">Horario de Servicio:</form:label>
                                            <c:set var="errorband"><form:errors path="horario"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:input path="horario" type="text" cssClass="form-control" placeholder="Lun - Vie 10:00 - 16:00..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:input path="horario" type="text" cssClass="form-control" placeholder="Lun - Vie 10:00 - 16:00..." autocomplete="off" style="border-color:red;" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <form:label path="proyecto">Nombre del Proyecto:</form:label>
                                            <c:set var="errorband"><form:errors path="proyecto"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:input path="proyecto" type="text" cssClass="form-control" placeholder="Nombre del proyecto..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:input path="proyecto" type="text" cssClass="form-control" placeholder="Nombre del proyecto..." autocomplete="off" style="border-color:red;" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                        </div>
                                        <!-- textarea -->
                                        <div class="form-group col-md-6">
                                            <form:label path="actividades">Actividades Generales:</form:label>
                                            <c:set var="errorband"><form:errors path="actividades"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:textarea path="actividades" cssClass="form-control" rows="3" placeholder="Actividades Generales..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:textarea path="actividades" cssClass="form-control" rows="3" placeholder="Actividades Generales..." autocomplete="off" style="border-color:red;" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                        </div>
                                        <!-- textarea -->
                                        <div class="form-group col-md-6">
                                            <form:label path="descripcion">Descripción de Actividades:</form:label>
                                            <c:set var="errorband"><form:errors path="descripcion"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <form:textarea path="descripcion" cssClass="form-control" rows="3" placeholder="Descripción de Actividades..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <form:textarea path="descripcion" cssClass="form-control" rows="3" placeholder="Descripción de Actividades..." autocomplete="off" style="border-color:red;" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                            </c:if>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <form:label path="observaciones">Observaciones:</form:label>
                                            <form:textarea path="observaciones" cssClass="form-control" rows="3" placeholder="Observaciones sobre la bitácora..." autocomplete="off" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-success">Aceptar</button>
                                        <a href="lista" class="btn btn-default">Cancelar</a>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <jsp:include page="../includes/footer.jsp"></jsp:include>


        </div>

    </body>
</html>
