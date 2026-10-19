<%--
    =========================================
    MEMBER 4 - PAYMENT MANAGEMENT
    Page: Payment Details
    =========================================
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Details | Vehicle Rental Service</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%@ include file="../common/sidebar.jsp" %>
    <main class="app-main page-content" id="main-content">
        <h1>Payment Details</h1>
        <%@ include file="../common/messages.jsp" %>

        <section class="card mb-4">
            <h2>Payment Information</h2>
            <table class="table">
                <tr><th>Payment ID:</th><td>${payment.paymentId}</td></tr>
                <tr><th>Amount:</th><td>LKR ${payment.amount}</td></tr>
                <tr><th>Date:</th><td>${payment.paymentDate}</td></tr>
                <tr><th>Status:</th>
                    <td><span class="badge status-${payment.status.toLowerCase()}">${payment.status}</span></td>
                </tr>
                <tr><th>Method:</th>
                    <td>
                        <c:choose>
                            <c:when test="${payment['class'].simpleName == 'CardPayment'}">
                                Card (Ending in ${payment.cardNumber})
                            </c:when>
                            <c:otherwise>
                                Cash (Receipt: ${payment.receiptNumber})
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </table>
        </section>

        <section class="card mb-4">
            <h2>Rental Reference</h2>
            <p><strong>Rental ID:</strong> ${payment.rentalId}</p>
            <p><strong>Customer Name:</strong> ${customer.firstName} ${customer.lastName}</p>
        </section>

        <div class="mt-3">
            <c:if test="${isAdmin}">
                <a href="${pageContext.request.contextPath}/payments/${payment.paymentId}/edit" class="btn btn-warning">Edit Status</a>
                <a href="${pageContext.request.contextPath}/payments" class="btn btn-outline-secondary">Back to List</a>
            </c:if>
            <c:if test="${!isAdmin}">
                <a href="${pageContext.request.contextPath}/payments/history" class="btn btn-outline-secondary">Back to History</a>
            </c:if>
        </div>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>