<%--
    =========================================
    MEMBER 4 - PAYMENT MANAGEMENT
    Page: Payment Details
    Responsible for (future work):
    - Payment CRUD
    - Payment records
    - Payment status
    =========================================
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Details | Vehicle Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%-- Common sidebar is available for future administration layouts. --%>
    <main id="main-content">
        <h1>Payment Details</h1>
        <%@ include file="../common/messages.jsp" %>
        <section>
            <h2>Payment information area</h2>
            <%-- MEMBER 4: Future payment information area placeholder. --%>
        </section>
        <section>
            <h2>Rental reference area</h2>
            <%-- MEMBER 4: Future rental reference area placeholder. --%>
        </section>
        <section>
            <h2>Payment status area</h2>
            <%-- MEMBER 4: Future payment status area placeholder. --%>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
