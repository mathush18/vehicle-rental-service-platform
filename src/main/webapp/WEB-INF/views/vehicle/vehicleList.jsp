<%--
    =========================================
    MEMBER 2 - VEHICLE MANAGEMENT
    Page: Vehicle Management
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
    <title>Vehicle Management | Vehicle Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%-- Common sidebar is available for future administration layouts. --%>
    <main id="main-content">
        <h1>Vehicle Management</h1>
        <%@ include file="../common/messages.jsp" %>
        <section>
            <h2>Search area</h2>
            <%-- MEMBER 2: Future search area placeholder. --%>
        </section>
        <section>
            <h2>Filter area</h2>
            <%-- MEMBER 2: Future filter area placeholder. --%>
        </section>
        <section>
            <h2>Vehicle list area</h2>
            <%-- MEMBER 2: Future vehicle list area placeholder. --%>
        </section>
        <section>
            <h2>Add Vehicle button area</h2>
            <%-- MEMBER 2: Future add vehicle button area placeholder. --%>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
