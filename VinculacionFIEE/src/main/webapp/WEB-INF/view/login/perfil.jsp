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
        <body class="hold-transition skin-green-light sidebar-mini">
            <div class="wrapper">

            <jsp:include page="../includes/menu.jsp"></jsp:include>

            <jsp:include page="../includes/lateral.jsp"></jsp:include>
            <c:if test="${sessionScope.user == null}">response.sendRedirect("/usuarios/lista");</c:if>
            <c:choose>
                <c:when test="${sessionScope.tipo eq 1 || sessionScope.tipo eq 2}">
                    <jsp:include page="includes/admin.jsp"></jsp:include>
                </c:when>
                <c:when test="${sessionScope.tipo eq 3}">
                    <jsp:include page="includes/maestro.jsp"></jsp:include>
                </c:when>
                <c:when test="${sessionScope.tipo eq 4}">
                    <jsp:include page="includes/encargado.jsp"></jsp:include>
                </c:when>
                <c:when test="${sessionScope.tipo eq 5}">
                    <jsp:include page="includes/estudiante.jsp"></jsp:include>
                </c:when>
            </c:choose>
            <jsp:include page="../includes/footer.jsp"></jsp:include>
        </div>
    </body>
</html>
