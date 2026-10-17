<%@ page pageEncoding="UTF-8" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="theme-color" content="#2864ff">
<title><c:out value="${pageTitle}"/> | DriveHub</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/drivehub.svg" type="image/svg+xml">
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap-icons/bootstrap-icons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modules/frontend.css">
<c:if test="${not empty uiRole}"><link rel="stylesheet" href="${pageContext.request.contextPath}/css/modules/${uiRole}.css"></c:if>
<script src="${pageContext.request.contextPath}/js/demo-data.js" defer></script>
<script src="${pageContext.request.contextPath}/js/app.js" defer></script>
<script src="${pageContext.request.contextPath}/js/frontend.js" defer></script>
