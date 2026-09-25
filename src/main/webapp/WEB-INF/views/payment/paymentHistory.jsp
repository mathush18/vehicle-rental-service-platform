<%--
    =========================================
    MEMBER 4 - PAYMENT MANAGEMENT
    Page: Payment History
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
    <title>Payment History | Vehicle Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%-- Common sidebar is available for future administration layouts. --%>
    <main id="main-content">
        <h1>Payment History</h1>
        <%@ include file="../common/messages.jsp" %>
        <section>
            <h2>History filter area</h2>
            <%-- MEMBER 4: Future history filter area placeholder. --%>
        </section>
        <section>
            <h2>Payment history list area</h2>
            <%-- MEMBER 4: Future payment history list area placeholder. --%>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
