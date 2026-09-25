<%--
    =========================================
    MEMBER 5 - BRANCH MANAGEMENT
    Page: Branch Details
    Responsible for (future work):
    - Branch CRUD
    - Branch information
    - Branch vehicle listing
    =========================================
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Branch Details | Vehicle Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%-- Common sidebar is available for future administration layouts. --%>
    <main id="main-content">
        <h1>Branch Details</h1>
        <%@ include file="../common/messages.jsp" %>
        <section>
            <h2>Branch information area</h2>
            <%-- MEMBER 5: Future branch information area placeholder. --%>
        </section>
        <section>
            <h2>Contact and location area</h2>
            <%-- MEMBER 5: Future contact and location area placeholder. --%>
        </section>
        <section>
            <h2>Branch vehicle listing area</h2>
            <%-- MEMBER 5: Future branch vehicle listing area placeholder. --%>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
