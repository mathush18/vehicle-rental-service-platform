<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile | Vehicle Rental Service</title>
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
        <h1>Edit Profile</h1>
        <%@ include file="userAlerts.jsp" %>
        <section class="card user-form-card">
            <form action="${pageContext.request.contextPath}/profile/edit" method="post" class="user-form">
                <div class="form-group">
                    <label for="name">Full name</label>
                    <input class="form-control" type="text" id="name" name="name" value="<c:out value='${profile.name}'/>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input class="form-control" type="email" id="email" name="email" value="<c:out value='${profile.email}'/>" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone (digits only)</label>
                    <input class="form-control" type="tel" id="phone" name="phone" value="<c:out value='${profile.phone}'/>"
                           pattern="\d{9,12}" title="9 to 12 digits" required>
                </div>
                <c:choose>
                    <c:when test="${profile.userRole == 'ADMIN'}">
                        <div class="form-group">
                            <label for="extra">Department</label>
                            <input class="form-control" type="text" id="extra" name="extra" value="<c:out value='${profile.department}'/>" required>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="form-group">
                            <label for="extra">Driving licence number</label>
                            <input class="form-control" type="text" id="extra" name="extra" value="<c:out value='${profile.licenseNumber}'/>" required>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="form-group">
                    <label for="newPassword">New password (leave blank to keep the current one)</label>
                    <input class="form-control" type="password" id="newPassword" name="newPassword" minlength="6">
                </div>
                <div class="form-actions">
                    <a class="btn btn-outline" href="${pageContext.request.contextPath}/profile">Cancel</a>
                    <button class="btn btn-primary" type="submit"><i class="bi bi-check2" aria-hidden="true"></i> Save changes</button>
                </div>
            </form>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>