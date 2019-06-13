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
        <body class="hold-transition skin-green-light sidebar-mini">
            <div class="wrapper">

            <jsp:include page="../includes/menu.jsp"></jsp:include>

            <jsp:include page="../includes/lateral.jsp"></jsp:include>

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Bitácoras
                            <small>Documentos</small>
                        </h1>
                        <!--<ol class="breadcrumb">
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
                            <div class="col-md-10">
                                <div class="box box-primary" id="reporte">
                                    <div class="box-header" style="text-align: center;">
                                        <h3 class="box-title">BITÁCORA DE ACTIVIDADES DE SERVICIO SOCIAL</h3>
                                    </div>
                                    <div class="box-body">
                                    <c:forEach items="${info}" var="info">
                                        <table width="100%" id="formatR">
                                            <tbody>
                                            <tr>
                                                <td><b>Alumno: </b><c:out value="${info.Nombre}" /></td>
                                                <td><b>Matricula: </b><c:out value="${info.Matricula}" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><b>Carrera: </b><c:out value="${info.carrera}" /></td>
                                            </tr>
                                            <c:forEach items="${datos}" var="pro">
                                                <tr>
                                                    <td colspan="2"><b>Dependencia: </b><c:out value="${pro.Dependencia}" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><b>Ubicación: </b><c:out value="${pro.Ubicacion}" /></td>
                                                </tr>    
                                            </c:forEach>
                                            <tr>
                                                <td><b>Fecha: </b><c:out value="${fecha}" /></td>
                                                <td id="title"><b>Bitácora: </b><c:out value="${num}" /></td>
                                            </tr>
                                            <form action="generar" method="POST" modelAttribute="bitacora">
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="hidden" value="1" name="Tipo">
                                                            <input type="hidden" value="${fecha}" name="Fecha">
                                                            <input type="hidden" value="${num}" name="Num_Reporte">
                                                            <input type="hidden" value="${pro}" name="idProyecto">
                                                            <label for="Actividades">Actividades generales: </label> <br>
                                                            <textarea name="Actividades" rows="7" style="width: 100%; border:none;" placeholder="Aquí se redactan las actividades realizadas."></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <label for="Descripcion">Descripción de las actividades: </label> <br>
                                                            <textarea name="Descripcion" rows="7" style="width: 100%; border:none;" placeholder="Aquí se redactan la descripción de actividades."></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <label for="Problemas">Problemas encontrados: </label> <br>
                                                            <textarea name="Problemas" rows="7" style="width: 100%; border:none;" placeholder="Aquí se redactan los problemas que se hayan presentado."></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <label for="Soluciones">Soluciones empleadas: </label> <br>
                                                            <textarea name="Soluciones" rows="7" style="width: 100%; border:none;" placeholder="Aquí se redactan las soluciones que se implementaron."></textarea>
                                                        </td>
                                                    </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr style="height: 20px;">
                                                <tr>
                                                    <td></td>
                                                    <td style="padding-top: 5px;">
                                                        <a href="lista" class="btn btn-default">Cancelar</a>
                                                        <input type="submit" id="exportar" class="btn btn-success" value="Guardar" />
                                                    </td>
                                                </tr>
                                            </tfoot>
                                            </form>
                                        </table>
                                    </c:forEach>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>
            </div>

            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <jsp:include page="../includes/footer.jsp"></jsp:include>

    </body>
</html>
