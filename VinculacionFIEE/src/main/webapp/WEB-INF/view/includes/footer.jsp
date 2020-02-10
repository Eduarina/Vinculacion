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
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/js/select2.min.js"></script>
<script src="${urlPublic}/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${urlPublic}/bower_components/alertify.js/alertify.min.js"></script>
<script src="${urlPublic}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${urlPublic}/dist/js/adminlte.min.js"></script>
<script src="${urlPublic}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${urlPublic}/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${urlPublic}/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${urlPublic}/vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${urlPublic}/assets/js/init-scripts/data-table/datatables-init.js"></script>
<script>
    var table;
    $(document).ready( function(){
        
        table = $('#example1').DataTable({
            'autoWidth': false,
            'lengthChange': false,
            'info': false
            
        });
        $('#example2').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': false,
            'ordering': true,
            
            'info': true,
            'autoWidth': false
        });
    });
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
<script src="${urlPublic}/vendors/jquery/dist/jquery.min.js"></script>
    <script src="${urlPublic}/vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="${urlPublic}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${urlPublic}/assets/js/main.js"></script>


    <script src="${urlPublic}/vendors/chart.js/dist/Chart.bundle.min.js"></script>
    <script src="${urlPublic}/assets/js/dashboard.js"></script>
    <script src="${urlPublic}/assets/js/widgets.js"></script>
    <script src="${urlPublic}/vendors/jqvmap/dist/jquery.vmap.min.js"></script>
    <script src="${urlPublic}/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script>
        (function($) {
            "use strict";

            jQuery('#vmap').vectorMap({
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: ['#1de9b6', '#03a9f5'],
                normalizeFunction: 'polynomial'
            });
        })(jQuery);
    </script>