<%--
    =========================================
    MEMBER 1 - USER MANAGEMENT
    Page: Login
    Responsible for (future work):
    - User registration
    - Login
    - User profile
    - User CRUD functionality
    =========================================
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Vehicle Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%-- Common sidebar is available for future administration layouts. --%>
    <main id="main-content">
        <h1>Login</h1>
        <%@ include file="../common/messages.jsp" %>
        <section>
            <h2>Login form area</h2>
            <%-- MEMBER 1: Future login form area placeholder. --%>
        </section>
        <section>
            <h2>Registration link area</h2>
            <%-- MEMBER 1: Future registration link area placeholder. --%>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
