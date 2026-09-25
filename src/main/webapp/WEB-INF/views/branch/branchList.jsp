<%--
    =========================================
    MEMBER 5 - BRANCH MANAGEMENT
    Page: Branches
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
    <title>Branches | Vehicle Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%-- Common sidebar is available for future administration layouts. --%>
    <main id="main-content">
        <h1>Branches</h1>
        <%@ include file="../common/messages.jsp" %>
        <section>
            <h2>Search area</h2>
            <%-- MEMBER 5: Future search area placeholder. --%>
        </section>
        <section>
            <h2>Branch list area</h2>
            <%-- MEMBER 5: Future branch list area placeholder. --%>
        </section>
        <section>
            <h2>Add Branch button area</h2>
            <%-- MEMBER 5: Future add branch button area placeholder. --%>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
