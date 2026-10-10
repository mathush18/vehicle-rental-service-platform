<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List | Vehicle Rental Service</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modules/user.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%@ include file="../common/sidebar.jsp" %>
    <main class="app-main page-content user-module" id="main-content">
        <h1>Users</h1>
        <p>Administrator view: search and remove user accounts.</p>
        <%@ include file="userAlerts.jsp" %>
        <section class="card">
            <form action="${pageContext.request.contextPath}/users" method="get" class="user-search">
                <div class="input-with-icon">
                    <i class="bi bi-search" aria-hidden="true"></i>
                    <input class="form-control" type="search" name="keyword" value="<c:out value='${keyword}'/>"
                           placeholder="Search by ID, name or email">
                </div>
                <button class="btn btn-primary" type="submit">Search</button>
                <a class="btn btn-outline" href="${pageContext.request.contextPath}/users">Reset</a>
            </form>
        </section>
        <c:choose>
            <c:when test="${empty users}">
                <div class="empty-state">No users found.</div>
            </c:when>
            <c:otherwise>
                <div class="table-wrapper">
                    <table class="data-table">
                        <thead>
                            <tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Role</th><th>Licence / Dept.</th><th>Action</th></tr>
                        </thead>
                        <tbody>
                        <c:forEach var="u" items="${users}">
                            <tr>
                                <td><c:out value="${u.userId}"/></td>
                                <td><c:out value="${u.name}"/></td>
                                <td><c:out value="${u.email}"/></td>
                                <td><c:out value="${u.phone}"/></td>
                                <td><span class="badge ${u.userRole == 'ADMIN' ? 'badge-info' : 'badge-success'}"><c:out value="${u.userRole}"/></span></td>
                                <td><c:out value="${u.userRole == 'ADMIN' ? u.department : u.licenseNumber}"/></td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/users/${u.userId}/delete" method="post"
                                          onsubmit="return confirm('Delete user ${u.userId}?');">
                                        <button class="btn btn-danger user-small-btn" type="submit"><i class="bi bi-trash" aria-hidden="true"></i> Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>