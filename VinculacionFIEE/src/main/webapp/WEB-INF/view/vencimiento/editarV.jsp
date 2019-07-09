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
                                                        <li class="nav-item"><a href="#tab1" class="nav-link active show" data-toggle="tab"><header>Vencimiento
                                                        <small>Editar Fecha de Vencimiento</small></header></a></li>
                                                    </ul>
                                                </div>
                                                <div class="tab-content">
                                                    <div class="tab-pane fontawesomw-demo active show" id="tab1">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12">

                                                                    <div class="card-body " id="bar-parent2">
                                                                    <!-- text input -->
                                            <form:form action="editar" method="POST" modelAttribute="datos">
                                                <div class="card-body " id="bar-parent2">
                                                                                    <div class="row">
                                                                                        <div class="col-md-6 col-sm-6">               
                                    <form:errors path="*" element="div" cssClass="alert alert-danger alert-dismissible"/>

                                    <%--  <spring:bind path="*">
                                        <c:forEach items="${status.errorMessages}" var="error">
                                            <div class="alert alert-danger alert-dismissible">
                                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                <h4><i class="icon fa fa-info"></i> Error!</h4>
                                                ${error}
                                            </div>
                                        </c:forEach>      
                                    </spring:bind>
                                    <spring:bind path="*">
                                        <c:forEach items="${status.errorMessages}" var="error">
                                            <div class="callout callout-danger">
                                                <h4>I am a danger callout!</h4>
                                                ${error}
                                            </div>
                                        </c:forEach>      
</spring:bind> --%>
                                    <div class="box-body">
                                        <form:hidden path="idvencimiento"/>
                                        <div class="form-group">
                                            <label path="descripcion">Documento:</label><br>
                                            <input path="descripcion" type="text" class="form-control" placeholder="documento..." disabled="true"/>
                                        </div>
                                        <div class="form-group">
                                            <%--<form:errors path="nombre" cssClass="alert alert-danger col-md-6" />--%>
                                            <label path="datepicker">Fecha:</label>
                                            <c:set var="errorband"><form:errors path="datepicker"/></c:set>
                                            <c:if test="${empty errorband}">
                                                <!--Date--> 
                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input id="datepicker" value="${datos.datepicker}" autocomplete="off" name="datepicker" type="text" class="form-control pull-right-container">
                                                </div>
                                                <!--/.input group--> 
                                            </c:if>
                                            <c:if test="${not empty errorband}">
                                                <!--Date--> 
                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input id="datepicker" value="${datos.datepicker}" autocomplete="off" name="datepicker" type="text" class="form-control pull-right-container">
                                                </div>
                                                <!--/.input group--> 
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