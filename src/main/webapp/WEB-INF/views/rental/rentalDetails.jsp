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
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rental Details | Vehicle Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%-- Common sidebar is available for future administration layouts. --%>
    <main id="main-content">
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
