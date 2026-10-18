<%--
    =========================================
    MEMBER 4 - PAYMENT MANAGEMENT
    Page: Payment History
    =========================================
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment History | Vehicle Rental Service</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modules/payment.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <%@ include file="../common/sidebar.jsp" %>
    <main class="app-main page-content" id="main-content">
        <h1>Payment History</h1>
        <%@ include file="../common/messages.jsp" %>

        <section class="card mb-4">
            <h2>Payment history list area</h2>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Payment ID</th>
                            <th>Rental ID</th>
                            <th>Date</th>
                            <th>Amount (LKR)</th>
                            <th>Method</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pay" items="${payments}">
                            <tr>
                                <td>${pay.paymentId}</td>
                                <td>${pay.rentalId}</td>
                                <td>${pay.paymentDate}</td>
                                <td>${pay.amount}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${pay['class'].simpleName == 'CardPayment'}">CARD</c:when>
                                        <c:otherwise>CASH</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <span class="badge status-${pay.status.toLowerCase()}">${pay.status}</span>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/payments/${pay.paymentId}" class="btn btn-sm btn-outline-primary">View</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty payments}">
                            <tr>
                                <td colspan="7" class="text-center">No payment history found.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>