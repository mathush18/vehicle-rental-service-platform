<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Vehicle Rental Service</title>
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
        <h1>Register</h1>
        <p>Create a customer account to book vehicles.</p>
        <%@ include file="userAlerts.jsp" %>
        <section class="card user-form-card">
            <form action="${pageContext.request.contextPath}/register" method="post" class="user-form">
                <div class="form-group">
                    <label for="name">Full name</label>
                    <input class="form-control" type="text" id="name" name="name" value="<c:out value='${name}'/>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input class="form-control" type="email" id="email" name="email" value="<c:out value='${email}'/>" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone (digits only)</label>
                    <input class="form-control" type="tel" id="phone" name="phone" value="<c:out value='${phone}'/>"
                           pattern="\d{9,12}" title="9 to 12 digits" required>
                </div>
                <div class="form-group">
                    <label for="licenseNumber">Driving licence number</label>
                    <input class="form-control" type="text" id="licenseNumber" name="licenseNumber"
                           value="<c:out value='${licenseNumber}'/>" required>
                </div>
                <div class="form-group">
                    <label for="password">Password (min 6 characters)</label>
                    <input class="form-control" type="password" id="password" name="password" minlength="6" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm password</label>
                    <input class="form-control" type="password" id="confirmPassword" name="confirmPassword" minlength="6" required>
                </div>
                <div class="form-actions">
                    <button class="btn btn-primary" type="submit"><i class="bi bi-person-plus" aria-hidden="true"></i> Create account</button>
                </div>
            </form>
            <p class="small-text user-form-note">Already registered? <a class="user-link" href="${pageContext.request.contextPath}/login">Login</a></p>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>