<%--
    =========================================
    MEMBER 2 - VEHICLE MANAGEMENT
    Page: Vehicle Details
    Responsible for (future work):
    - Vehicle CRUD
    - Vehicle search
    - Vehicle availability
    =========================================
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Details | Vehicle Rental Service</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modules/vehicle.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%@ include file="../common/sidebar.jsp" %>
    <main class="app-main page-content" id="main-content">
        <h1>Vehicle Details</h1>
        <%@ include file="../common/messages.jsp" %>
        <section>
            <h2>Vehicle image area</h2>
            <%-- MEMBER 2: Future vehicle image area placeholder. --%>
        </section>
        <section>
            <h2>Vehicle information area</h2>
            <%-- MEMBER 2: Future vehicle information area placeholder. --%>
        </section>
        <section>
            <h2>Availability area</h2>
            <%-- MEMBER 2: Future availability area placeholder. --%>
        </section>
        <section>
            <h2>Rental controls area</h2>
            <%-- MEMBER 2: Future rental controls area placeholder. --%>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
