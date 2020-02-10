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
    <body>
    <jsp:include page="../includes/lateral.jsp"></jsp:include>

    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
            <jsp:include page="../includes/menu.jsp"></jsp:include>
        <!-- Header-->
    </div><!-- /#right-panel -->

    <!-- Right Panel -->
    <jsp:include page="../includes/footer.jsp"></jsp:include>
    
    </body>
</html>
