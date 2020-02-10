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

        <body>

            <jsp:include page="../includes/lateral.jsp"></jsp:include>
            <div class="right-panel" id="right-panel">
            <jsp:include page="../includes/menu.jsp"></jsp:include>
            

                <div class="content mt-3">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="col-md-12 col-sm-12">
                                <!-- Content Wrapper. Contains page content -->
                                <div class="card">
                                    <!-- Content Header (Page header) -->
                                    <div class="card-header">
                                        <h1>
                                            Reportes
                                            <small>Documentos</small>
                                        </h1>
                                        <form action="comentar" method="POST">
                                            <div class="col-md-12">
                                                <label for="obse">Observaciones</label><br>
                                                <input type="hidden" name="idR" value="${idR}">
                                            <textarea name="obse" style="width:100%"></textarea> <br><br>
                                            <input class="btn btn-primary" type="submit" value="Enviar Comentarios">
                                            <a class="btn btn-success" href="autoriza?id=${idR}" >Autorizar reporte</a>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <c:forEach items="${infoE}" var="info">
                                        <table width="100%" class="formatoR">
                                            <tbody>
                                                <tr>
                                                    <td colspan="2" rowspan="6" style="width: 30%; padding-left: 7%;"><img align="center" width="150px" src="${urlPublic}/dist/img/logoUV.jpg"></td>
                                                    <td colspan="9" style="text-align: center;"><b>Universidad Veracruzana</b></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="9" style="text-align:center;"><b>Facultad de Ingeniería Eléctrica y Electrónica</b></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="9" style="text-align:center;"><b>Coordinación de Vinculación y Servicio Social</b></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="9" style="text-align:center; background: #D9D9D9"><b>REPORTE MENSUAL</b></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="9" style="text-align:center; background: #BFBFBF"><b>Datos del Alumno</b></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="9" ><b>Nombre: </b><c:out value="${info.Nombre}" /> </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5" ><b>Carrera: </b><c:out value="${info.Carrera}" /> </td>
                                                    <td colspan="5" ><b>Correo: </b><c:out value="${info.Correo}" /> </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" ><b>Telefono: </b><c:out value="${info.Telefono}" /> </td>
                                                    <td colspan="4" ><b>Celular: </b><c:out value="${info.Celular}" /> </td>
                                                    <td colspan="3" ><b>Matricula: </b><c:out value="${info.Matricula}" /> </td>
                                                </tr>
                                                <tr></tr>
                                        </table>
                                        <br>
                                        <table width="100%" class="formatoR">
                                            <tr><td colspan="3" style="text-align:center; background: #BFBFBF"><b>Datos de la Dependencia</b></td></tr>
                                            <tr>
                                                <td><b>Reporte: </b><c:out value="${num}" /></td>
                                                <td colspan="2"><b>Fecha: </b><c:out value="${fecha}" /></td>
                                            </tr>
                                            <c:forEach items="${infoP}" var="dependencia">
                                                <tr>
                                                    <td colspan="2"><b>Dependencia: </b><c:out value="${dependencia.Dependencia}" /></td>
                                                    <td><b>Teléfono de la Dependencia: </b></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3"><b>Titulo del proyecto: </b><c:out value="${dependencia.Titulo}" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3"><b>Horario en el que se realiza <c:out value="${dependencia.Tipo}" />: </b><c:out value="${dependencia.Horario}" /></td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                        <br>
                                        <form:form method="POST" action="editar" modelAttribute="reporte">
                                            <table width="100%" class="formatoR">
                                                <tbody>
                                                    <tr>
                                                        <td style="text-align:center; width: 50%; background: #BFBFBF"><b>Actividades</b></td>
                                                        <td style="text-align:center; width: 50%; background: #BFBFBF"><b>Descripción</b></td>
                                                    </tr>
                                                    <tr>
                                                        <form:hidden path="idReporte" /> 
                                                        <td><form:textarea path="Actividades" style="width: 100%; border:none;" placeholder="Aquí se redactan las actividades realizadas." rows="10" /></td>
                                                        <td><form:textarea path="Descripcion" style="width: 100%; border:none;" placeholder="Aquí se redacta la descripción de las actividades." rows="10" /></td>
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td></td>
                                                        <td style="padding-top: 5px; padding-left: 20%;">
                                                            <input type="submit" id="exportar" class="btn btn-success" value="Editar" />
                                                            <a href="lista" class="btn btn-default">Cancelar</a>
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </form:form>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="box-footer">
                                <form action="comentar" method="POST">
                                    <div class="col-md-12">
                                        <label for="obse">Observaciones</label><br>
                                        <input type="hidden" name="idR" value="${idR}">
                                        <textarea name="obse" style="width:100%"></textarea> <br><br>
                                        <input class="btn btn-primary" type="submit" value="Enviar Comentarios">
                                        <a class="btn btn-success" href="autoriza?id=${idR}" >Autorizar reporte</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <jsp:include page="../includes/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
