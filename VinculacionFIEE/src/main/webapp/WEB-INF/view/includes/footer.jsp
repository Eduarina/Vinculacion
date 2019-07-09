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
<footer class="page-footer">
    <div class="pull-right hidden-xs">
        Sistema de Gestión de Servicio Social
    </div>

    <strong>Copyright &copy; <%=currentDate%> <a href="#">Company</a>.</strong> All rights reserved.
</footer>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/js/select2.min.js"></script>
<script src="${urlPublic}/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${urlPublic}/bower_components/alertify.js/alrtify.min.js"></script>
<script src="${urlPublic}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${urlPublic}/dist/js/adminlte.min.js"></script>
<script src="${urlPublic}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${urlPublic}/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${urlPublic}/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${urlPublic}/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${urlPublic}/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<script>
    $(function () {
        //Date picker
        $("input[name$='datepicker']").datepicker({
            autoclose: true
        })
        //Date picker
        $("input[name$='datepicker2']").datepicker({
            autoclose: true
        })
        $("input[name$='fechainicio']").datepicker({ autoclose:true }); 
        $("input[name$='fechafin']").datepicker({ autoclose:true }); 
        //Money Euro
        $('[data-mask]').inputmask()
        $('#example1').DataTable()
        $('#example2').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': false,
            'ordering': true,
            'info': true,
            'autoWidth': false
        })
        //Timepicker
        $('.timepicker').timepicker({
            showInputs: false
        })
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