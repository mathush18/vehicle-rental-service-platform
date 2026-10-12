<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Vehicle Rental Service</title>
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
        <h1>Login</h1>
        <p>Welcome back. Sign in to manage your rentals and profile.</p>
        <c:if test="${param.loggedOut != null}">
            <div class="user-alert user-alert-success" role="status"><i class="bi bi-check-circle" aria-hidden="true"></i><span>You have been logged out.</span></div>
        </c:if>
        <c:if test="${param.deleted != null}">
            <div class="user-alert user-alert-success" role="status"><i class="bi bi-check-circle" aria-hidden="true"></i><span>Your account was deleted.</span></div>
        </c:if>
        <%@ include file="userAlerts.jsp" %>
        <section class="card user-form-card">
            <form action="${pageContext.request.contextPath}/login" method="post" class="user-form">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input class="form-control" type="email" id="email" name="email"
                           value="<c:out value='${email}'/>" placeholder="you@example.com" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input class="form-control" type="password" id="password" name="password" required>
                </div>
                <div class="form-actions">
                    <button class="btn btn-primary" type="submit"><i class="bi bi-box-arrow-in-right" aria-hidden="true"></i> Login</button>
                </div>
            </form>
            <p class="small-text user-form-note">New here? <a class="user-link" href="${pageContext.request.contextPath}/register">Create an account</a></p>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>