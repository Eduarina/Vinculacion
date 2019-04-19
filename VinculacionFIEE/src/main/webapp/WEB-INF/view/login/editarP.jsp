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
                            Perfil
                            <small>
                            <c:if test="${sessionScope.tipo eq 1}">Administrador</c:if>
                            <c:if test="${sessionScope.tipo eq 2}">Vinculación</c:if>
                            <c:if test="${sessionScope.tipo eq 3}">Maestro</c:if>
                            <c:if test="${sessionScope.tipo eq 4}">Servicio</c:if>
                            <c:if test="${sessionScope.tipo eq 5}">Encargado</c:if>
                            </small>
                        </h1>
                        <!--<ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Perfil</li>
                        </ol>-->
                    </section>

                    <!-- Main content -->
                    <section class="content container-fluid">

                        <!--------------------------
                        | Your Page Content Here |
                        -------------------------->

                        <!-- general form elements disabled -->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Editar Datos de Usuario</h3>
                                    </div>
                                    <!-- /.box-header -->

                                    <!-- text input -->
                                <c:choose>
                                    <c:when test="${sessionScope.tipo eq 2}">
                                        <form:form action="editar2" method="POST" modelAttribute="datos">
                                            <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>
                                            <div class="box-body">
                                                <form:hidden path="idvinculacion"/>
                                                <div class="form-group col-md-6">
                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                    <form:label path="correo">Correo</form:label>
                                                    <c:set var="errorband"><form:errors path="correo"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:input path="correo" type="email" cssClass="form-control" placeholder="Correo..."/>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:input path="correo" type="email" cssClass="form-control" placeholder="Correo..."  style="border-color:red;"/>
                                                    </c:if>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <form:label path="carrera">Programa Educativo</form:label>
                                                    <c:set var="errorband"><form:errors path="carrera"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:input path="carrera" type="text" cssClass="form-control" placeholder="Usuario..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:input path="carrera" type="text" cssClass="form-control" style="border-color:red;" placeholder="Usuario..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                                <button type="submit" class="btn btn-success">Aceptar</button>
                                                <a href="perfil" class="btn btn-default">Cancelar</a>
                                            </div>
                                        </form:form>
                                    </c:when>
                                    <c:when test="${sessionScope.tipo eq 3}">
                                        <form:form action="editar3" method="POST" modelAttribute="datos">
                                            <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>
                                            <div class="box-body">
                                                <form:hidden path="idmaestro"/>
                                                <div class="form-group col-md-6">
                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                    <form:label path="correo">Correo</form:label>
                                                    <c:set var="errorband"><form:errors path="correo"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:input path="correo" type="email" cssClass="form-control" placeholder="Correo..."/>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:input path="correo" type="email" cssClass="form-control" placeholder="Correo..."  style="border-color:red;"/>
                                                    </c:if>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <form:label path="carrera">Programa Educativo</form:label>
                                                    <c:set var="errorband"><form:errors path="carrera"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:input path="carrera" type="text" cssClass="form-control" placeholder="Usuario..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:input path="carrera" type="text" cssClass="form-control" style="border-color:red;" placeholder="Usuario..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                                <button type="submit" class="btn btn-success">Aceptar</button>
                                                <a href="perfil" class="btn btn-default">Cancelar</a>
                                            </div>
                                        </form:form>
                                    </c:when>
                                    <c:when test="${sessionScope.tipo eq 4}">
                                        <form:form action="editar4" method="POST" modelAttribute="datos">
                                            <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>
                                            <div class="box-body">
                                                <form:hidden path="idservicio"/>
                                                <div class="form-group col-md-6">
                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                    <form:label path="matricula">Matricula</form:label>
                                                    <c:set var="errorband"><form:errors path="matricula"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:input path="matricula" type="text" cssClass="form-control" placeholder="S19001317..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:input path="matricula" type="text" cssClass="form-control" placeholder="S19001317..."  style="border-color:red;" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <form:label path="creditos">Créditos</form:label>
                                                    <c:set var="errorband"><form:errors path="creditos"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:input path="creditos" type="number" min="300" max="400" cssClass="form-control" placeholder="Créditos..."/>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:input path="creditos" type="number" min="300" max="400" cssClass="form-control" style="border-color:red;" placeholder="Créditos..."/>
                                                    </c:if>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                    <form:label path="correo">Correo</form:label>
                                                    <c:set var="errorband"><form:errors path="correo"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:input path="correo" type="email" cssClass="form-control" placeholder="Correo..."/>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:input path="correo" type="email" cssClass="form-control" placeholder="Correo..."  style="border-color:red;"/>
                                                    </c:if>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                    <form:label path="telefono">Teléfono</form:label>
                                                    <c:set var="errorband"><form:errors path="telefono"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <div class="input-group">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-phone"></i>
                                                            </div>
                                                            <input id="telefono" name="telefono" value="${datos.telefono}" type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask=""/>
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
                                                <div class="form-group col-md-6">
                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                    <form:label path="celular">Celular</form:label>
                                                    <c:set var="errorband"><form:errors path="celular"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <div class="input-group">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-phone"></i>
                                                            </div>
                                                            <input id="celular" name="celular" value="${datos.celular}" type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask=""/>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <div class="input-group">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-phone"></i>
                                                            </div>
                                                            <input id="celular" name="celular" value="${datos.celular}" type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask="" style="border-color:red;"/>
                                                        </div>
                                                    </c:if>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                    <form:label path="carrera">Programa Educativo</form:label>
                                                    <c:set var="errorband"><form:errors path="carrera"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:input path="carrera" type="text" cssClass="form-control" placeholder="Programa Educativo..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:input path="carrera" type="text" cssClass="form-control" placeholder="Programa Educativo..."  style="border-color:red;" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                </div>
                                                    <div class="form-group col-md-12">
                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                    <form:label path="cv">Curriculum vitae o Habilidades</form:label>
                                                    <c:set var="errorband"><form:errors path="cv"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:textarea path="cv" type="text" rows="3" cssClass="form-control" placeholder="Menciona tus habilidades y conocimientos..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:textarea path="cv" type="text" rows="3" cssClass="form-control" placeholder="Menciona tus habilidades y conocimientos..."  style="border-color:red;" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                    <form:label path="semestre">Semestre</form:label>
                                                    <c:set var="errorband"><form:errors path="semestre"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:input path="semestre" type="number" min="1" max="13" cssClass="form-control" />
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:input path="semestre" type="number" min="1" max="13" cssClass="form-control" style="border-color:red;"/>
                                                    </c:if>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                    <form:label path="horario">Horario de la clase</form:label>
                                                    <c:set var="errorband"><form:errors path="horario"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <!-- time Picker -->
                                                        <div class="bootstrap-timepicker">
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <input id="horario" name="horario" value="${datos.horario}" type="text" class="form-control timepicker">

                                                                    <div class="input-group-addon">
                                                                        <i class="fa fa-clock-o"></i>
                                                                    </div>
                                                                </div>
                                                                <!-- /.input group -->
                                                            </div>
                                                            <!-- /.form group -->
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <div class="bootstrap-timepicker">
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <input id="horario" name="horario" value="${datos.horario}" type="text" style="border-color:red;" class="form-control timepicker">

                                                                    <div class="input-group-addon">
                                                                        <i class="fa fa-clock-o"></i>
                                                                    </div>
                                                                </div>
                                                                <!-- /.input group -->
                                                            </div>
                                                            <!-- /.form group -->
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                                <button type="submit" class="btn btn-success">Aceptar</button>
                                                <a href="perfil" class="btn btn-default">Cancelar</a>
                                            </div>
                                        </form:form>
                                    </c:when>
                                    <c:when test="${sessionScope.tipo eq 5}">
                                        <form:form action="editar5" method="POST" modelAttribute="datos">
                                            <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>
                                            <div class="box-body">
                                                <form:hidden path="idencargado"/>
                                                <div class="form-group col-md-6">
                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                    <form:label path="correo">Correo</form:label>
                                                    <c:set var="errorband"><form:errors path="correo"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:input path="correo" type="email" cssClass="form-control" autocomplete="off" placeholder="Correo..."/>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:input path="correo" type="email" cssClass="form-control" autocomplete="off" placeholder="Correo..."  style="border-color:red;"/>
                                                    </c:if>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <form:label path="dependencia">Nombre de la Dependencia</form:label>
                                                    <c:set var="errorband"><form:errors path="dependencia"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:input path="dependencia" type="text" cssClass="form-control" autocomplete="off" placeholder="Nombre de la Dependencia..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:input path="dependencia" type="text" cssClass="form-control" style="border-color:red;" autocomplete="off" placeholder="Nombre de la Dependencia..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <form:label path="direccion">Dirección de la Dependencia</form:label>
                                                    <c:set var="errorband"><form:errors path="direccion"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <form:input path="direccion" type="text" cssClass="form-control" autocomplete="off" placeholder="Dirección de la Dependencia..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                    <c:if test="${not empty errorband}">
                                                        <form:input path="direccion" type="text" cssClass="form-control" style="border-color:red;" autocomplete="off" placeholder="Dirección de la Dependencia..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                    </c:if>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                                    <form:label path="telefono">Teléfono</form:label>
                                                    <c:set var="errorband"><form:errors path="telefono"/></c:set>
                                                    <c:if test="${empty errorband}">
                                                        <div class="input-group">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-phone"></i>
                                                            </div>
                                                            <input id="telefono" name="telefono" value="${datos.telefono}" type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask=""/>
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
                                            </div>
                                            <div class="box-footer">
                                                <button type="submit" class="btn btn-success">Aceptar</button>
                                                <a href="perfil" class="btn btn-default">Cancelar</a>
                                            </div>
                                        </form:form>
                                    </c:when>
                                </c:choose>

                                <!-- general form elements disabled -->
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
