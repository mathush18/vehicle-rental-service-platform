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
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Details | Vehicle Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%-- Common sidebar is available for future administration layouts. --%>
    <main id="main-content">
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
