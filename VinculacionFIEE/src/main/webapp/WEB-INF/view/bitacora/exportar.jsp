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
        <body class="">
        <jsp:include page="../includes/lateral.jsp"></jsp:include>
            <div class="right-panel" id="right-panel">

            <jsp:include page="../includes/menu.jsp"></jsp:include>
                <div class="content mt-3">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="col-md-12 col-sm-12">
                                <div class="card">

                                    <div class="card-header" style="text-align: center;">
                                        <h3 class="box-title">BITÁCORA DE ACTIVIDADES DE SERVICIO SOCIAL</h3>
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
                                                    <td colspan="2"><b>Carrera: </b><c:out value="${info.carrera}" /></td>
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
                                                    <td><b id="title">Bitácora: <c:out value="${num}" /></b></td>
                                                </tr>
                                                <form:form action="editar" method="POST" modelAttribute="bitacora">
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
                                            </table>
                                            <br>
                                            <table width="100%">
                                                <tbody>
                                                    <tr>
                                                        <td style="width:10%"></td>
                                                        <c:forEach items="${firmaA}" var="firmaA">
                                                            <td style="width:35%; text-align: center;"><img width="140px" height="100px" src="${urlPublic}/estudiantes${firmaA.Firma}" /></td>
                                                            </c:forEach>
                                                        <td style="width:10%"></td>
                                                        <c:forEach items="${firmaM}" var="firmaM">
                                                            <td style="width:35%; text-align: center;"><img width="140px" height="100px" src="${urlPublic}/maestros${firmaM.firma}" /></td>
                                                            </c:forEach>
                                                        <td style="width:10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:10%"></td>
                                                        <c:forEach items="${firmaA}" var="firmaA">
                                                            <td style="width:35%; border-top: 2px solid #000; text-align: center;"><b>${firmaA.Nombre}<b/></td>
                                                        </c:forEach>
                                                        <td style="width:10%"></td>
                                                        <c:forEach items="${firmaM}" var="firmaM">
                                                            <td style="width:35%; border-top: 2px solid #000;  text-align: center;"><b> ${firmaM.Nombre}</b></td>
                                                        </c:forEach>
                                                        <td style="width:10%"></td>
                                                    </tr>
                                                    <tr style="height: 50px;"></tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td><a href="lista" class="btn btn-default">Cancelar</a></td>
                                                        <td>
                                                            <a id="exportar" class="btn btn-success">Exportar</a>
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </form:form>
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
        </div>
        <!-- /.content-wrapper -->

        <jsp:include page="../includes/footer.jsp"></jsp:include>

        <script>
            var getCanvas;
            $(document).ready(function () {
                var div = document.getElementById("reporteA");
                div.style.background = "white";
                html2canvas(div, {
                    onrendered: function (canvas) {
                        getCanvas = canvas;
                    }
                })
            });
            $("#exportar").on("click", function () {
                var w = document.getElementById("reporteA").offsetWidth;
                var h = document.getElementById("reporteA").offsetHeight;
                var title = document.getElementById("title").innerHTML;
                var imageData = getCanvas.toDataURL("image/jpeg", 1.0);
                var newData = imageData.replace(/^data:image\/png/, "data:application/octet-stream");
                var doc = new jsPDF('L', 'px', [w, h]);
                doc.addImage(newData, 'JPEG', 0, 0, w, h);
                doc.save(title + '.pdf');
            });
        </script>

    </body>
</html>
