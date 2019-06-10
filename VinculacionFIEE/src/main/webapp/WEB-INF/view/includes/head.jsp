<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Starter</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
    <link rel="stylesheet" href="${urlPublic}/plugins/timepicker/bootstrap-timepicker.min.css">
    <link rel="stylesheet" href="${urlPublic}/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${urlPublic}/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${urlPublic}/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${urlPublic}/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="${urlPublic}/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${urlPublic}/dist/css/skins/skin-green-light.min.css">
    <link rel="stylesheet" href="${urlPublic}/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="${urlPublic}/plugins/timepicker/bootstrap-timepicker.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <script src="https://superal.github.io/canvas2image/canvas2image.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    
    <style>
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
    </style>
</head>