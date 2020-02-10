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
            <div class="right-panel">
            <jsp:include page="../includes/menu.jsp"></jsp:include>
                <div id="content mt-3">
                        <div class="col-md-12 col-sm-12">
                            <div class="card">
                                <div class="card-header"><header>Usuarios
                                        <small>Editar Usuario</small></header>
                                </div>
                                <div class="card-body " id="bar-parent2">
                                    <!-- text form:input -->
                                <form:form action="editar" method="POST" modelAttribute="datos">
                                    <div class="card-body " id="bar-parent2">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-6">               
                                                <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>
                                                <div class="box-body">
                                                    <form:hidden path="idestudiante"/>
                                                    <form:hidden path="password"/>
                                                    <form:hidden path="password2"/>
                                                    <div class="form-group">
                                                        <form:label path="matricula">Matricula:</form:label>
                                                        <c:set var="errorband"><form:errors path="matricula"/></c:set>
                                                        <c:if test="${empty errorband}">
                                                            <form:input path="matricula" autocomplete="off" type="text" class="form-control" placeholder="Matricula..."  />
                                                        </c:if>
                                                        <c:if test="${not empty errorband}">
                                                            <form:input path="matricula" autocomplete="off" type="text" class="form-control" placeholder="Matricula..." />
                                                        </c:if>
                                                    </div>
                                                    <div class="form-group">
                                                        <form:label path="nombre">Nombre:</form:label>
                                                        <c:set var="errorband"><form:errors path="nombre"/></c:set>
                                                        <c:if test="${empty errorband}">
                                                            <form:input path="nombre" autocomplete="off" type="text" class="form-control" placeholder="Nombre..."  />
                                                        </c:if>
                                                        <c:if test="${not empty errorband}">
                                                            <form:input path="nombre" autocomplete="off" type="text" class="form-control" placeholder="Nombre..." />
                                                        </c:if>
                                                    </div>
                                                    <div class="form-group">
                                                        <form:label path="carrera">Carrera:</form:label>
                                                        <c:set var="errorband"><form:errors path="carrera"/></c:set>
                                                        <c:if test="${empty errorband}">
                                                            <form:select path="carrera" class="form-control">
                                                                <option value="0">Seleccion...</option>
                                                                <c:forEach items="${carrera}" var="dato">
                                                                    <option value="${dato.idCarrera}">${dato.descripcion}</option>    
                                                                </c:forEach>
                                                            </form:select>
                                                        </c:if>
                                                        <c:if test="${not empty errorband}">
                                                            <form:select path="carrera" class="form-control">
                                                                <option value="0">Seleccion...</option>
                                                                <c:forEach items="${carrera}" var="dato">
                                                                    <option value="${dato.idCarrera}">${dato.descripcion}</option>    
                                                                </c:forEach>
                                                            </form:select>
                                                        </c:if>

                                                    </div>
                                                    <div class="form-group">
                                                        <form:label path="semestre">Semestre: </form:label>
                                                        <c:set var="errorband"><form:errors path="semestre"/></c:set>
                                                        <c:if test="${empty errorband}">
                                                            <form:input path="semestre" autocomplete="off" type="text" class="form-control" placeholder="semestre..."  />
                                                        </c:if>
                                                        <c:if test="${not empty errorband}">
                                                            <form:input path="semestre" autocomplete="off" type="text" class="form-control" placeholder="semestre..." />
                                                        </c:if>
                                                    </div>
                                                    <div class="form-group">
                                                        <form:label path="correo">Correo: </form:label>
                                                        <c:set var="errorband"><form:errors path="correo"/></c:set>
                                                        <c:if test="${empty errorband}">
                                                            <form:input path="correo" type="email" autocomplete="off" class="form-control" placeholder="Correo..." />
                                                        </c:if>
                                                        <c:if test="${not empty errorband}">
                                                            <form:input path="correo" type="email" autocomplete="off" class="form-control" placeholder="Correo..." />
                                                        </c:if>
                                                    </div>
                                                    <div class="form-group">
                                                        <form:label path="telefono">Telefono: </form:label>
                                                        <c:set var="errorband"><form:errors path="telefono"/></c:set>
                                                        <c:if test="${empty errorband}">
                                                            <form:input path="telefono" autocomplete="off" type="text" class="form-control" placeholder="telefono..."  />
                                                        </c:if>
                                                        <c:if test="${not empty errorband}">
                                                            <form:input path="telefono" autocomplete="off" type="text" class="form-control" placeholder="telefono..."  />
                                                        </c:if>
                                                    </div>
                                                    <div class="form-group">
                                                        <form:label path="celular">Celular:</form:label>
                                                        <c:set var="errorband"><form:errors path="celular"/></c:set>
                                                        <c:if test="${empty errorband}">
                                                            <form:input path="celular" autocomplete="off" type="text" class="form-control" placeholder="celular..."  />
                                                        </c:if>
                                                        <c:if test="${not empty errorband}">
                                                            <form:input path="celular" autocomplete="off" type="text" class="form-control" placeholder="celular..." />
                                                        </c:if>
                                                    </div>
                                                    <div class="form-group">
                                                        <form:label path="user">Usuario:</form:label>
                                                        <c:set var="errorband"><form:errors path="user"/></c:set>
                                                        <c:if test="${empty errorband}">
                                                            <form:input path="user" autocomplete="off" type="text" class="form-control" placeholder="Usuario..." />
                                                        </c:if>
                                                        <c:if test="${not empty errorband}">
                                                            <form:input path="user" autocomplete="off" type="text" class="form-control" placeholder="Usuario..." />
                                                        </c:if>
                                                    </div>
                                                    <div class="form-group">
                                                        <form:label path="sexo">Sexo: </form:label>

                                                        <c:set var="errorband"><form:errors path="sexo"/></c:set>
                                                        <c:if test="${empty errorband}">
                                                            <form:select path="sexo" class="form-control">
                                                                <option value="0">Seleccion...</option>
                                                                <option value="H">Hombre</option>
                                                                <option value="M">Mujer</option>
                                                            </form:select>
                                                        </c:if>
                                                        <c:if test="${not empty errorband}">
                                                            <form:select path="sexo" class="form-control">
                                                                <option value="0">Seleccion...</option>
                                                                <option value="H">Hombre</option>
                                                                <option value="M">Mujer</option>
                                                            </form:select>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <button type="submit" class="btn btn-success btn-sm m-b-10">Aceptar</button>
                                    <a href="lista" class="btn btn-default btn-sm m-b-10">Cancelar</a>

                                </form:form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../includes/footer.jsp"></jsp:include>
    </body>
</html>