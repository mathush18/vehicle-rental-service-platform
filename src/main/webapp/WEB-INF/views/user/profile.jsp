<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile | Vehicle Rental Service</title>
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
        <h1>My Profile</h1>
        <%@ include file="userAlerts.jsp" %>
        <section class="card user-form-card">
            <div class="user-profile-head">
                <span class="user-avatar"><i class="bi bi-person-circle" aria-hidden="true"></i></span>
                <div>
                    <h2><c:out value="${profile.name}"/></h2>
                    <span class="badge ${profile.userRole == 'ADMIN' ? 'badge-info' : 'badge-success'}"><c:out value="${profile.userRole}"/></span>
                </div>
            </div>
            <dl class="user-details">
                <dt>User ID</dt><dd><c:out value="${profile.userId}"/></dd>
                <dt>Email</dt><dd><c:out value="${profile.email}"/></dd>
                <dt>Phone</dt><dd><c:out value="${profile.phone}"/></dd>
                <c:if test="${profile.userRole == 'CUSTOMER'}">
                    <dt>Licence number</dt><dd><c:out value="${profile.licenseNumber}"/></dd>
                </c:if>
                <c:if test="${profile.userRole == 'ADMIN'}">
                    <dt>Department</dt><dd><c:out value="${profile.department}"/></dd>
                </c:if>
            </dl>
            <div class="form-actions user-profile-actions">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/profile/edit"><i class="bi bi-pencil" aria-hidden="true"></i> Edit profile</a>
                <c:if test="${profile.userRole == 'ADMIN'}">
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/users"><i class="bi bi-people" aria-hidden="true"></i> Manage users</a>
                </c:if>
                <a class="btn btn-outline" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right" aria-hidden="true"></i> Logout</a>
                <form action="${pageContext.request.contextPath}/profile/delete" method="post"
                      onsubmit="return confirm('Delete your account permanently? This cannot be undone.');">
                    <button class="btn btn-danger" type="submit"><i class="bi bi-trash" aria-hidden="true"></i> Delete account</button>
                </form>
            </div>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>