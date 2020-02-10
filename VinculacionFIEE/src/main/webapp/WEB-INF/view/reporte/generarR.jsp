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
        <body>

            <jsp:include page="../includes/lateral.jsp"></jsp:include>

                <!-- Content Wrapper. Contains page content -->
                <div class="right-panel" id="right-panel">
                    <jsp:include page="../includes/menu.jsp"></jsp:include>
                       <div class="content mt-3">

            <div class="col-sm-12">
                    <!-- Main content -->
                    <div class="card">
                                    <div class="card-header" style="text-align: center;">
                                        <h3 class="box-title">REPORTE DE ACTIVIDADES DE SERVICIO SOCIAL</h3>
                                    </div>
                                    <div class="card-body">
                                    <c:forEach items="${info}" var="info">
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
                                                <c:forEach items="${datos}" var="dependencia">
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
                                                <form method="POST" action="insertarR" modelAttribute="reporte">
                                                    <table width="100%" class="formatoR">
                                                        <tbody>
                                                        <tr>
                                                            <td style="text-align:center; width: 50%; background: #BFBFBF"><b>Actividades</b></td>
                                                            <td style="text-align:center; width: 50%; background: #BFBFBF"><b>Descripción</b></td>
                                                        </tr>
                                                        <tr>
                                                            <input type="hidden" value="1" name="Tipo">
                                                            <input type="hidden" value="${fecha}" name="Fecha">
                                                            <input type="hidden" value="${num}" name="Num_Reporte">
                                                            <input type="hidden" value="${pro}" name="idProyecto">
                                                            <td><textarea name="Actividades" style="width: 100%; border:none;" placeholder="Aquí se redactan las actividades realizadas." rows="10"></textarea></td>
                                                            <td><textarea name="Descripcion" style="width: 100%; border:none;" placeholder="Aquí se redacta la descripción de las actividades." rows="10"></textarea></td>
                                                        </tr>
                                                        </tbody>
                                                        <tfoot>
                                                <tr>
                                                    <td></td>
                                                    <td style="padding-top: 5px; padding-left: 20%;">
                                                        <input type="submit" id="exportar" class="btn btn-success" value="Guardar" />
                                                        <a href="lista" class="btn btn-default">Cancelar</a>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                                    </table>
                                                </form>
                                    </c:forEach>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>
            </div>
        <jsp:include page="../includes/footer.jsp"></jsp:include>

    </body>
</html>
