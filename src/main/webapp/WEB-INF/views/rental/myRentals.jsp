<%--
    =========================================
    MEMBER 3 - RENTAL MANAGEMENT
    Page: My Rentals
    Responsible for (future work):
    - Rental / Booking CRUD
    - Booking dates
    - Rental status
    - Rental price calculation
    =========================================
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Rentals | Vehicle Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%-- Common sidebar is available for future administration layouts. --%>
    <main id="main-content">
        <h1>My Rentals</h1>
        <%@ include file="../common/messages.jsp" %>
        <section>
            <h2>Rental filter area</h2>
            <%-- MEMBER 3: Future rental filter area placeholder. --%>
        </section>
        <section>
            <h2>My rental list area</h2>
            <%-- MEMBER 3: Future my rental list area placeholder. --%>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
