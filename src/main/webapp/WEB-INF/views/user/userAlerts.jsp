<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- User module: shows error / success messages sent by UserController --%>
<c:if test="${not empty error}">
    <div class="user-alert user-alert-error" role="alert">
        <i class="bi bi-exclamation-circle" aria-hidden="true"></i>
        <span><c:out value="${error}"/></span>
    </div>
</c:if>
<c:if test="${not empty success}">
    <div class="user-alert user-alert-success" role="status">
        <i class="bi bi-check-circle" aria-hidden="true"></i>
        <span><c:out value="${success}"/></span>
    </div>
</c:if>