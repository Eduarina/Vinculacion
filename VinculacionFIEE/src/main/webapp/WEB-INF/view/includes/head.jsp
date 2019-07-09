<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta name="description" content="Responsive Admin Template" />
        <meta name="author" content="SmartUniversity" />
    <title>AdminLTE 2 | Starter</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
        <!-- icons -->
        <link href="${urlPublic}/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="${urlPublic}/fonts/material-design-icons/material-icon.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap -->
        <link href="${urlPublic}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- style -->
        <link rel="stylesheet" href="${urlPublic}/assets/css/pages/extra_pages.css">
        <!-- favicon -->
        <link rel="shortcut icon" href="${urlPublic}/assets/img/logicon.jpg" /> 
         <script src="${urlPublic}/assets/plugins/jquery/jquery.min.js" ></script>
        <script src="${urlPublic}/assets/js/pages/extra_pages/pages.js" ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.min.js"></script>
    <!--<link rel="stylesheet" href="${urlPublic}/plugins/timepicker/bootstrap-timepicker.min.css">
    <link rel="stylesheet" href="${urlPublic}/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${urlPublic}/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${urlPublic}/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${urlPublic}/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="${urlPublic}/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${urlPublic}/dist/css/skins/skin-green-light.min.css">
    <link rel="stylesheet" href="${urlPublic}/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="${urlPublic}/plugins/timepicker/bootstrap-timepicker.min.css">
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>-->
        <link href="${urlPublic}/fonts/material-design-icons/material-icon.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap -->
        <link href="${urlPublic}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- style -->
        <link rel="stylesheet" href="${urlPublic}/assets/css/pages/extra_pages.css">
        <!-- favicon -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="${urlPublic}/assets/img/logicon.jpg" /> 
    <!--<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/css/select2.min.css" rel="stylesheet" />-->
    <!--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">-->
    <link href="${urlPublic}/assets/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${urlPublic}/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="${urlPublic}/fonts/material-design-icons/material-icon.css" rel="stylesheet" type="text/css" />
        <!--bootstrap -->
        <link href="${urlPublic}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${urlPublic}/assets/plugins/summernote/summernote.css" rel="stylesheet">
        <!-- Material Design Lite CSS -->
        <link rel="stylesheet" href="${urlPublic}/assets/plugins/material/material.min.css">
        <link rel="stylesheet" href="${urlPublic}/assets/css/material_style.css">
        <!-- animation -->
        <link href="${urlPublic}/assets/css/pages/animate_page.css" rel="stylesheet">
        <!-- inbox style -->
        <link href="${urlPublic}/assets/css/pages/inbox.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme Styles -->
        <link href="${urlPublic}/assets/css/style.css" rel="stylesheet" type="text/css" />
        <link href="${urlPublic}/assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <link href="${urlPublic}/assets/css/pages/formlayout.css" rel="stylesheet" type="text/css" />
        <link href="${urlPublic}/assets/css/responsive.css" rel="stylesheet" type="text/css" />
	<link href="${urlPublic}/assets/css/theme-color.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="${urlPublic}/assets/plugins/sweet-alert/sweetalert.min.css">


        <!-- Data Tables -->
        <link href="${urlPublic}/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>

        <link href="${urlPublic}/assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <link href="${urlPublic}/assets/css/style.css" rel="stylesheet" type="text/css" />
        <link href="${urlPublic}/assets/css/pages/formlayout.css" rel="stylesheet" type="text/css" />
        <link href="${urlPublic}/assets/css/responsive.css" rel="stylesheet" type="text/css" />
        <link href="${urlPublic}/assets/css/theme-color.css" rel="stylesheet" type="text/css" />
        <!-- Date Time item CSS -->
        <!--<link rel="stylesheet" href="${urlPublic}/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.css" />-->
        <script src="${urlPublic}/assets/plugins/jquery/jquery.min.js" ></script>        
        <script src="${urlPublic}/assets/plugins/popper/popper.min.js" ></script>
        <script src="${urlPublic}/assets/plugins/jquery-blockui/jquery.blockui.min.js" ></script>
        <script src="${urlPublic}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- bootstrap -->
        <script src="${urlPublic}/assets/plugins/bootstrap/js/bootstrap.min.js" ></script>
        <script src="${urlPublic}/assets/plugins/sparkline/jquery.sparkline.min.js" ></script>
        <script src="${urlPublic}/assets/js/pages/sparkline/sparkline-data.js" ></script>
        <script src="${urlPublic}/assets/plugins/bootstrap-inputmask/bootstrap-inputmask.min.js" ></script>
        <script src="${urlPublic}/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"  charset="UTF-8"></script>
        <script src="${urlPublic}/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker-init.js"  charset="UTF-8"></script>

        <script src="${urlPublic}/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"  charset="UTF-8"></script>
        <script src="${urlPublic}/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker-init.js"  charset="UTF-8"></script>
        <!-- Common js-->
        <script src="${urlPublic}/assets/js/app.js" ></script>
        <script src="${urlPublic}/assets/js/layout.js" ></script>
        <script src="${urlPublic}/assets/js/theme-color.js" ></script>
        <!-- material -->
        <script src="${urlPublic}/assets/plugins/material/material.min.js"></script>
        <!-- animation -->
        <script src="${urlPublic}/assets/js/pages/ui/animations.js" ></script>
        <script src="${urlPublic}/assets/js/pages/material_select/getmdl-select.js" ></script>
        <script  src="${urlPublic}/assets/plugins/material-datetimepicker/moment-with-locales.min.js"></script>
	<script  src="${urlPublic}/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js"></script>
	<script  src="${urlPublic}/assets/plugins/material-datetimepicker/datetimepicker.js"></script>

        <!-- chart js -->
        <script src="${urlPublic}/assets/plugins/chart-js/Chart.bundle.js" ></script>
        <script src="${urlPublic}/assets/plugins/chart-js/utils.js" ></script>
        <script src="${urlPublic}/assets/js/pages/chart/chartjs/home-data.js" ></script>
        <!--Alerts-->
        <script src="${urlPublic}/assets/plugins/sweet-alert/sweetalert.min.js" ></script>
        <script src="${urlPublic}/assets/js/pages/sweet-alert/sweet-alert-data.js" ></script>

        
        <!-- summernote -->
        <script src="${urlPublic}/assets/plugins/summernote/summernote.min.js" ></script>
        <script src="${urlPublic}/assets/js/pages/summernote/summernote-data.js" ></script>
        
        
        <!-- data tables -->
        <script src="${urlPublic}/assets/plugins/datatables/jquery.dataTables.min.js"></script>
 	<script src="${urlPublic}/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js" ></script>
        <script src="${urlPublic}/assets/js/pages/table/table_data.js" ></script>
        <!-- dropzone -->
        <script src="${urlPublic}/assets/plugins/dropzone/dropzone.js" ></script>
        <!--tags input-->
        <script src="${urlPublic}/assets/plugins/jquery-tags-input/jquery-tags-input.js" ></script>
        <script src="${urlPublic}/assets/plugins/jquery-tags-input/jquery-tags-input-init.js" ></script>
        <!--select2-->
        <script src="${urlPublic}/assets/plugins/select2/js/select2.js" ></script>
        <script src="${urlPublic}/assets/js/pages/select2/select2-init.js" ></script>
        

        <!-- favicon -->
        <<link rel="shortcut icon" href="${urlPublic}/assets/img/logicon.jpg" /> 
    <!--<script src="https://superal.github.io/canvas2image/canvas2image.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>-->
    
    <!--<style>
        .example-modal .modal {
            position: relative;
            top: auto;
            bottom: auto;
            right: auto;
            left: auto;
            display: block;
            z-index: 1;
        }

        #formatR tbody td{
            border: 1px #000 solid;
            padding-left: 5px;
        }
        
        .formatoR tbody td{
            border: 1px #000 solid;
            padding-left: 5px;
        }
        
        .example-modal .modal {
            background: transparent !important;
        }
    </style>-->
</head>