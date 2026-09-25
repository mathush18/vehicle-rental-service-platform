<%--
    =========================================
    MEMBER 6 - REVIEW MANAGEMENT
    Page: Vehicle Reviews
    Responsible for (future work):
    - Review CRUD
    - Ratings
    - Review moderation
    =========================================
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Reviews | Vehicle Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%-- Common sidebar is available for future administration layouts. --%>
    <main id="main-content">
        <h1>Vehicle Reviews</h1>
        <%@ include file="../common/messages.jsp" %>
        <section>
            <h2>Vehicle reference area</h2>
            <%-- MEMBER 6: Future vehicle reference area placeholder. --%>
        </section>
        <section>
            <h2>Rating summary area</h2>
            <%-- MEMBER 6: Future rating summary area placeholder. --%>
        </section>
        <section>
            <h2>Vehicle review list area</h2>
            <%-- MEMBER 6: Future vehicle review list area placeholder. --%>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
