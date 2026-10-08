<%--
    =========================================
    MEMBER 3 - RENTAL MANAGEMENT
    Page: Rental Details
    Responsible for (future work):
    - Rental / Booking CRUD
    - Booking dates
    - Rental status
    - Rental price calculation
    =========================================
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rental Details | Vehicle Rental Service</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modules/rental.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%@ include file="../common/sidebar.jsp" %>
    <main class="app-main page-content" id="main-content">
        <h1>Rental Details</h1>
        <%@ include file="../common/messages.jsp" %>
        <section>
            <h2>Booking information area</h2>
            <%-- MEMBER 3: Future booking information area placeholder. --%>
        </section>
        <section>
            <h2>Booking dates area</h2>
            <%-- MEMBER 3: Future booking dates area placeholder. --%>
        </section>
        <section>
            <h2>Rental status area</h2>
            <%-- MEMBER 3: Future rental status area placeholder. --%>
        </section>
        <section>
            <h2>Price summary area</h2>
            <%-- MEMBER 3: Future price summary area placeholder. --%>
        </section>
        <section>
            <h2>Cancel and return controls area</h2>
            <%-- MEMBER 3: Future cancel and return controls area placeholder. --%>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
