<%--
    =========================================
    MEMBER 6 - SHARED FRONTEND / UI
    Shared component used by all members.
    Coordinate with the full team before
    making major visual changes.
    =========================================
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Vehicle Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="common/navbar.jsp" %>
    <%@ include file="common/sidebar.jsp" %>
    <main id="main-content">
        <h1>Dashboard</h1>
        <%@ include file="common/messages.jsp" %>
        <section>
            <h2>Dashboard cards</h2>
            <article>
                <h3>Total Users</h3>
                <%-- Future dashboard value. --%>
            </article>
            <article>
                <h3>Total Vehicles</h3>
                <%-- Future dashboard value. --%>
            </article>
            <article>
                <h3>Available Vehicles</h3>
                <%-- Future dashboard value. --%>
            </article>
            <article>
                <h3>Active Rentals</h3>
                <%-- Future dashboard value. --%>
            </article>
            <article>
                <h3>Payments</h3>
                <%-- Future dashboard value. --%>
            </article>
            <article>
                <h3>Branches</h3>
                <%-- Future dashboard value. --%>
            </article>
            <article>
                <h3>Reviews</h3>
                <%-- Future dashboard value. --%>
            </article>
        </section>
        <section>
            <h2>Recent Rentals</h2>
            <%-- MEMBER 6: Future recent rentals placeholder. --%>
        </section>
        <section>
            <h2>Recent Payments</h2>
            <%-- MEMBER 6: Future recent payments placeholder. --%>
        </section>
        <section>
            <h2>Recent Reviews</h2>
            <%-- MEMBER 6: Future recent reviews placeholder. --%>
        </section>
    </main>
    <%@ include file="common/footer.jsp" %>
</body>
</html>
