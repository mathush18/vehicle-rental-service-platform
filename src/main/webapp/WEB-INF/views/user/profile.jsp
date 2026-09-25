<%--
    =========================================
    MEMBER 1 - USER MANAGEMENT
    Page: User Profile
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
    <title>User Profile | Vehicle Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%-- Common sidebar is available for future administration layouts. --%>
    <main id="main-content">
        <h1>User Profile</h1>
        <%@ include file="../common/messages.jsp" %>
        <section>
            <h2>User information area</h2>
            <%-- MEMBER 1: Future user information area placeholder. --%>
        </section>
        <section>
            <h2>Edit profile controls area</h2>
            <%-- MEMBER 1: Future edit profile controls area placeholder. --%>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
