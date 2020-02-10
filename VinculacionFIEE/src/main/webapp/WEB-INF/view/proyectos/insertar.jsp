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
                <div id="right-panel" class="right-panel">
                <jsp:include page="../includes/menu.jsp"></jsp:include>


                    <!-- Content Wrapper. Contains page content -->
                    <div class="content mt-3">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="col-md-12 col-sm-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <header>Proyectos
                                                <small>Lista de Proyectos</small></header></a></li>
                                            </ul>
                                        </div>
                                        <div class="card-body " id="bar-parent2">
                                            <!-- text form:input -->
                                            <form:form method="POST" style="font-size:16px;" action="insertar" modelAttribute="proyecto">
                                                <div class="row form-group"><div class="col col-sm-1"></div><div class="col col-sm-2">
                                                    <form:label path="titulo">Titulo: </form:label></div><div class="col col-sm-8">
                                                    <form:input path="titulo" class="form-control" placeholder="Titulo del proyecto" />
                                                    </div>
                                                </div>
                                                <div class="row form-group"><div class="col col-sm-1"></div><div class="col col-sm-2">
                                                    <form:label path="dependencia">Dependencia: </form:label></div><div class="col col-sm-8">
                                                    <form:input path="dependencia" class="form-control" placeholder="Dependencia" />
                                                    </div>
                                                </div> 
                                                <div class="row form-group"><div class="col col-sm-1"></div><div class="col col-sm-2">
                                                    <form:label path="ubicacion">Ubicacion: </form:label></div><div class="col col-sm-8">
                                                    <form:input path="ubicacion" class="form-control" placeholder="Dependencia" />
                                                    </div>
                                                </div> 
                                                <div class="row form-group"><div class="col col-sm-1"></div><div class="col col-sm-2">
                                                    <form:label path="horario">Horario: </form:label></div><div class="col col-sm-8">
                                                    <form:input path="horario" class="form-control" placeholder="Horario servicio" />
                                                    </div>
                                                </div>
                                                <div class="row form-group"><div class="col col-sm-1"></div><div class="col col-sm-2">
                                                    <form:label path="fechainicio">Fecha Inicio: </form:label></div><div class="col col-sm-8">
                                                    <form:input path="fechainicio" type="date" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="row form-group"><div class="col col-sm-1"></div><div class="col col-sm-2">
                                                    <form:label path="fechafin">Fecha Fin: </form:label></div><div class="col col-sm-8">
                                                    <form:input path="fechafin" type="date" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="row form-group"><div class="col col-sm-1"></div><div class="col col-sm-2">
                                                    <form:label path="objetivo">Objetivo: </form:label></div><div class="col col-sm-8">
                                                    <form:input path="objetivo" class="form-control" placeholder="Objetivo" />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-sm-1"></div>
                                                    <div class="col col-sm-2">
                                                    <form:label path="actividades">Actividades a desarrollar: </form:label>
                                                    </div>
                                                    <div class="col col-sm-8">
                                                        <form:textarea path="actividades" rows="5" class="form-control" placeholder="Actividades" ></form:textarea>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-sm-1"></div>
                                                    <div class="col col-sm-2">
                                                    <form:label path="habilidades">Habilidades requeridas: </form:label>
                                                    </div>
                                                    <div class="col col-sm-8">
                                                        <form:textarea path="habilidades" rows="8" class="form-control" placeholder="Habilidades" ></form:textarea>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-sm-1"></div>
                                                    <div class="col col-sm-2">
                                                    <form:label path="tipo">Tipo: </form:label>
                                                    </div>
                                                    <div class="col col-sm-8">
                                                    <form:select path="tipo" class="form-control">
                                                        <option value="0">Tipo de proyecto</option>
                                                        <option value="1">Servicio Social</option>
                                                        <option value="2">Practicas Profesionales</option>
                                                    </form:select>

                                                    </div>
                                                </div>
                                        </div>
                                        <div class="modal-footer">
                                        <button type="submit" class="btn btn-success">Aceptar</button>
                                        <a href="lista" class="btn btn-secondary">Cancelar</a>

                                        </form:form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.content-wrapper -->

            <jsp:include page="../includes/footer.jsp"></jsp:include>
        </body>
    </html>
