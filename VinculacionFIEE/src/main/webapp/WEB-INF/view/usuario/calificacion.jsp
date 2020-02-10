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
       <body>
        <jsp:include page="../includes/lateral.jsp"></jsp:include>
            <div id="right-panel" class="right-panel">
            <jsp:include page="../includes/menu.jsp"></jsp:include>


                <!-- Content Wrapper. Contains page content -->
                <div class="content mt-3">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="modal-title" id="mediumModalLabel">Calificar Alumno</h5>
                                </div>
                                <div class="card-body">
                                <form:form>
                                <div class="row">
                                    <c:if test="${sessionScope.tipo = 2 or sessionScope.tipo = 4}">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-5"><label>Bitacoras entregadas</label></div>
                                        <div class="col-sm-5"><label>4</label></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-5"><label>Reportes entregados</label></div>
                                        <div class="col-sm-5"><label>2</label></div>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.tipo = 3}">
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-5"><label>Calificación de vinculación</label></div>
                                    <div class="col-sm-5"><label>3</label></div>
                            <div class="row">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-5"><label>Calificación de empleador</label></div>
                                <div class="col-sm-5"><label>4</label></div>
                            </div>
                        </c:if>
                        <div class="row">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-2">
                                <label>Calificación: </label>
                            </div>
                            <div class="col-sm-8">
                                <c:if test="${sessionScope.tipo = 3}">
                                    <input type="number" class="form-control" name="calificaM"/>
                                </c:if>
                                <c:if test="${sessionScope.tipo = 2}">
                                    <input type="number" class="form-control" name="calificaV"/>
                                </c:if>
                                <c:if test="${sessionScope.tipo = 4}">
                                    <input type="number" class="form-control" name="calificaE"/>
                                </c:if>
                            </div>
                        </div>                        
                        </form:form>
                            </div>
                        </div>
                    </div>
                </div>
                    
                <div tabindex="-1" class="modal fade" id="mediumModal" role="dialog" aria-hidden="true" aria-labelledby="mediumModalLabel" style="display: none;">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="mediumModalLabel">Calificar Alumno</h5>
                            <button class="close" aria-label="Close" type="button" data-dismiss="modal">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form:form>
                                <div class="row">
                                    <c:if test="${sessionScope.tipo = 2 or sessionScope.tipo = 4}">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-5"><label>Bitacoras entregadas</label></div>
                                        <div class="col-sm-5"><label>4</label></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-5"><label>Reportes entregados</label></div>
                                        <div class="col-sm-5"><label>2</label></div>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.tipo = 3}">
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-5"><label>Calificación de vinculación</label></div>
                                    <div class="col-sm-5"><label>3</label></div>
                            <div class="row">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-5"><label>Calificación de empleador</label></div>
                                <div class="col-sm-5"><label>4</label></div>
                            </div>
                        </c:if>
                        <div class="row">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-2">
                                <label>Calificación: </label>
                            </div>
                            <div class="col-sm-8">
                                <c:if test="${sessionScope.tipo = 3}">
                                    <input type="number" class="form-control" name="calificaM"/>
                                </c:if>
                                <c:if test="${sessionScope.tipo = 2}">
                                    <input type="number" class="form-control" name="calificaV"/>
                                </c:if>
                                <c:if test="${sessionScope.tipo = 4}">
                                    <input type="number" class="form-control" name="calificaE"/>
                                </c:if>
                            </div>
                        </div>                        
                        </form:form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <button class="btn btn-primary" type="button">Confirm</button>
                    </div>
                </div>
            </div>    
            </div>

            
        </div>
        <!-- Content Header (Page header) -->
</div>
        <!-- /.content -->
        <!-- /.content-wrapper -->
        <jsp:include page="../includes/footer.jsp"></jsp:include>
        
    </body>
</html>
