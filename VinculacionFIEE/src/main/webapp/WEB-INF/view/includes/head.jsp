<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:url value="/resources" var="urlPublic"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="Vinculación FIEE" />
    <title>Vinculación FIEE</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="${urlPublic}/logicon.jpg">

    <link rel="stylesheet" href="${urlPublic}/vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${urlPublic}/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${urlPublic}/vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="${urlPublic}/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${urlPublic}/vendors/selectFX/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${urlPublic}/vendors/jqvmap/dist/jqvmap.min.css">
    <link rel="stylesheet" href="${urlPublic}/vendors/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.min.js"></script>

    <link rel="stylesheet" href="${urlPublic}/assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
</head>