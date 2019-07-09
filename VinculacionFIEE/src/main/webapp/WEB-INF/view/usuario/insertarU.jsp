<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
        <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-blue white-sidebar-color logo-white">
            <div class="page-wrapper">
                <div class="page-header navbar navbar-fixed-top">
            <jsp:include page="../includes/menu.jsp"></jsp:include>
                </div>
                <div class="page-container">
            <jsp:include page="../includes/lateral.jsp"></jsp:include>
            
                <!-- Content Wrapper. Contains page content -->
                <div class="page-content-wrapper">
                    <div class="page-content" style="min-height: 667px" >
                        <div id="content">
                            <div class="profile-content">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="card">
                                            <div class="card-topline-green"></div>
                                            <div class="white-box">
                                                <div class="p-r1-20">
                                                    <ul class="nav customtab nav-tabs" role="tablist">
                                                        <li class="nav-item"><a href="#tab1" class="nav-link active show" data-toggle="tab"><header>Usuarios
                                                        <small>Registrar Usuario</small></header></a></li>
                                                    </ul>
                                                </div>
                                                <div class="tab-content">
                                                    <div class="tab-pane fontawesome-demo active show" id="tab1">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12">

                                                                    <div class="card-body " id="bar-parent2">
                                                                    <!-- text input -->
                                                                        <form:form method="POST" style="font-size:16px;" action="/VinculacionFIEE/alumnos/insertar" modelAttribute="datos">
                                                                            <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>
                                                                            <div class="form-group">
                                                                                
                                                                                    <label path="matricula">Matricula: </label>
                                                                                    
                                                                                    
                                                                                    <c:set var="errorband"><form:errors path="matricula"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <input path="matricula" class="form-control" autocomplete="off" placeholder="Matricula" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <input path="matricula" class="form-control" autocomplete="off" placeholder="Matricula" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>
                                                                                
                                                                                <br>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                
                                                                                    <label path="nombre">Nombre: </label>
                                                                                    
                                                                                    <c:set var="errorband"><form:errors path="nombre"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <input path="nombre" class="form-control" autocomplete="off" placeholder="Nombre" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <input path="nombre" class="form-control" autocomplete="off" placeholder="Nombre" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>
                                                                                
                                                                                <br>
                                                                            </div> 
                                                                            <div class="form-group">
                                                                                
                                                                                    <label path="carrera">Carrera:</label>
                                                                                    
                                                                                    
                                                                                    <c:set var="errorband"><form:errors path="carrera"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <select path="carrera" class="form-control">
                                                                                            <option value="0">Seleccion...</option>
                                                                                            <c:forEach items="${carrera}" var="dato">
                                                                                                <option value="${dato.idCarrera}">${dato.descripcion}</option>    
                                                                                            </c:forEach>
                                                                                        </select>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <select path="carrera" class="form-control" >
                                                                                            <option value="0">Seleccion...</option>
                                                                                            <c:forEach items="${carrera}" var="dato">
                                                                                                <option value="${dato.idCarrera}">${dato.descripcion}</option>    
                                                                                            </c:forEach>
                                                                                        </select>
                                                                                    </c:if>
                                                                                
                                                                                <br>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                
                                                                                    <label path="semestre">Semestre: </label>
                                                                                    
                                                                                    
                                                                                    <c:set var="errorband"><form:errors path="semestre"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <input path="semestre" class="form-control" autocomplete="off" placeholder="Semestre" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <input path="semestre" class="form-control" autocomplete="off" placeholder="Semestre" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>
                                                                                
                                                                                <br>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                
                                                                                    <label path="correo">Correo: </label>
                                                                                    
                                                                                    
                                                                                    <c:set var="errorband"><form:errors path="correo"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <input path="correo" type="email" class="form-control" autocomplete="off" placeholder="Correo" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <input path="correo" type="email" class="form-control" autocomplete="off" placeholder="Correo" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>

                                                                                <br>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                
                                                                                    <label path="telefono">Telefono: </label>
                                                                                    
                                                                                    <c:set var="errorband"><form:errors path="telefono"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <input path="telefono" class="form-control" autocomplete="off" placeholder="Telefono..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <input path="telefono" class="form-control" autocomplete="off" placeholder="Telefono..." onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>

                                                                                <br>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                
                                                                                    <label path="celular">Celular: </label>
                                                                                    
                                                                                    <c:set var="errorband"><form:errors path="celular"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <input path="celular" class="form-control" autocomplete="off" placeholder="Celular" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <input path="celular" class="form-control" autocomplete="off" placeholder="Celular" onkeydown="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>
                                                                                
                                                                                <br>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                
                                                                                    <label path="user">Usuario:</label>
                                                                                    
                                                                                    
                                                                                    <c:set var="errorband"><form:errors path="user"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <input path="user" class="form-control" autocomplete="off" placeholder="Usuario" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <input path="user" class="form-control" autocomplete="off" placeholder="Usuario" onkeyup="javascript:this.value = this.value.toUpperCase();"/>
                                                                                    </c:if>
                                                                                
                                                                                <br>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                
                                                                                    <label path="password">Contraseña: </label>
                                                                                    
                                                                                    
                                                                                    <c:set var="errorband"><form:errors path="password"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <input path="password" type="password" autocomplete="off" required="required" class="form-control" placeholder="Contraseña"/>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <input path="password" type="password" autocomplete="off" required="required" class="form-control" placeholder="Contraseña"/>
                                                                                    </c:if>
                                                                                
                                                                                <br>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                
                                                                                    <label path="password2">Repetir contraseña: </label>
                                                                                    
                                                                                    
                                                                                    <c:set var="errorband"><form:errors path="password2"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <input path="password2" type="password" autocomplete="off" required="required" class="form-control" placeholder="Contraseña"/>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <input path="password2" type="password" autocomplete="off" required="required" class="form-control" placeholder="Contraseña"/>
                                                                                    </c:if>
                                                                                
                                                                            </div>
                                                                                    <br>
                                                                            <div class="form-group">
                                                                                
                                                                                    <label path="sexo">Sexo: </label>
                                                                                    
                                                                                    
                                                                                    <c:set var="errorband"><form:errors path="sexo"/></c:set>
                                                                                    <c:if test="${empty errorband}">
                                                                                        <select path="sexo" class="form-control">
                                                                                            <option value="0">Seleccion...</option>
                                                                                            <option value="H">Hombre</option>
                                                                                            <option value="M">Mujer</option>
                                                                                        </select>
                                                                                    </c:if>
                                                                                    <c:if test="${not empty errorband}">
                                                                                        <select path="sexo" class="form-control">
                                                                                            <option value="0">Seleccion...</option>
                                                                                            <option value="H">Hombre</option>
                                                                                            <option value="M">Mujer</option>
                                                                                        </select>
                                                                                    </c:if>
                                                                                
                                                                                <br>
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Content Header (Page header) -->
                    
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            
</div>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</div>
</body>
</html>