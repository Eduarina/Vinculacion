<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>
<%
    Date dNow = new Date();
    SimpleDateFormat ft
            = new SimpleDateFormat("yyyy");
    String currentDate = ft.format(dNow);
%>
<!-- Main Footer -->
<footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
        Sistema de Gestión de Servicio Social
    </div>

    <!-- Default to the left -->
    <strong>Copyright &copy; <%=currentDate%> <a href="#">Company</a>.</strong> All rights reserved.
</footer>
<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="${urlPublic}/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${urlPublic}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${urlPublic}/dist/js/adminlte.min.js"></script>
<!-- InputMask -->
<script src="${urlPublic}/plugins/input-mask/jquery.inputmask.js"></script>
<!--<script src="${urlPublic}/plugins/input-mask/jquery.inputmask.extensions.js"></script>-->
<!-- bootstrap datepicker -->
<script src="${urlPublic}/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

<script>
    $(function () {
        //Date picker
        $("input[name$='datepicker']").datepicker({
            autoclose: true
        })
        //Money Euro
        $('[data-mask]').inputmask()
    })
    function disableMyText() {
        if (document.getElementById("checkbox").checked == true) {
            document.getElementById("beca").disabled = false;
            document.getElementById("tipo").disabled = false;
        } else {
            document.getElementById("beca").disabled = true;
            document.getElementById("tipo").disabled = true;
        }
    }
</script>
<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->