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
        <jsp:include page="../includes/lateral.jsp"></jsp:include>

            <div class="right-panel" id="right-panel">
            <jsp:include page="../includes/menu.jsp"></jsp:include>

                <div class="content mt-3">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="col-md-12 col-sm-12">
                                <div class="card">
                                    <div class="card">
                                        <div class="card-header">
                                            <h1>
                                                Detalles de Bitácora
                                            </h1>
                                            <form action="comentar" method="POST">
                                                <div class="col-md-12">
                                                    <label for="obse">Observaciones</label><br>
                                                    <input type="hidden" name="idR" value="${idR}">
                                                <textarea name="obse" style="width:100%"></textarea> <br><br>
                                                <input class="btn btn-primary" type="submit" value="Enviar Comentarios">
                                                <a class="btn btn-success" href="autoriza?id=${idR}" >Autorizar bitácora</a>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-body">
                                        <c:forEach items="${infoE}" var="info">
                                            <table width="100%" id="formatR">
                                                <tbody>
                                                    <tr>
                                                        <td><b>Alumno: </b><c:out value="${info.Nombre}" /></td>
                                                        <td><b>Matricula: </b><c:out value="${info.Matricula}" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"><b>Carrera: </b><c:out value="${info.Carrera}" /></td>
                                                    </tr>
                                                    <c:forEach items="${infoP}" var="pro">
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
                                                    <form:form action="editar" method="POST" modelAttribute="reporte">
                                                        <tr>
                                                            <td colspan="2">
                                                                <form:hidden path="idReporte" />
                                                                <label for="Actividades">Actividades generales: </label> <br>
                                                                <form:textarea path="Actividades" rows="7" style="width: 100%; border:none;" placeholder="Aquí se redactan las actividades realizadas." />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <label for="Descripcion">Descripción de las actividades: </label> <br>
                                                                <form:textarea path="Descripcion" rows="7" style="width: 100%; border:none;" placeholder="Aquí se redactan la descripción de actividades."/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <label for="Problemas">Problemas encontrados: </label> <br>
                                                                <form:textarea path="Problemas" rows="7" style="width: 100%; border:none;" placeholder="Aquí se redactan los problemas que se hayan presentado." />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <label for="Soluciones">Soluciones empleadas: </label> <br>
                                                                <form:textarea path="Soluciones" rows="7" style="width: 100%; border:none;" placeholder="Aquí se redactan las soluciones que se implementaron." />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </form:form>
                                            </table>
                                        </c:forEach>
                                    </div>
                                    <div class="box-footer" style="border-top:1px solid #000">
                                        
                                        <form action="comentar" method="POST">
                                            <div class="col-md-12">
                                                <label for="obse">Observaciones</label><br>
                                                <input type="hidden" name="idR" value="${idR}">
                                                <textarea name="obse" style="width:100%"></textarea> <br><br>
                                                <input class="btn btn-primary" type="submit" value="Enviar Comentarios">
                                                <a class="btn btn-success" href="autoriza?id=${idR}" >Autorizar bitácora</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <jsp:include page="../includes/footer.jsp"></jsp:include>


        </div>

    </body>
</html>
