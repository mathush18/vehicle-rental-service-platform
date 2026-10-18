<%--
    =========================================
    MEMBER 4 - PAYMENT MANAGEMENT
    Page: Edit Payment
    =========================================
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Payment | Vehicle Rental Service</title>
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
        <h1>Edit Payment: ${payment.paymentId}</h1>
        <%@ include file="../common/messages.jsp" %>

        <section class="card mb-4">
            <form action="${pageContext.request.contextPath}/payments/${payment.paymentId}/edit" method="post" class="form-grid">

                <div class="form-group">
                    <label>Payment Method</label>
                    <c:set var="isCard" value="${payment['class'].simpleName == 'CardPayment'}" />
                    <select name="method" class="form-control" required>
                        <option value="CARD" ${isCard ? 'selected' : ''}>Card</option>
                        <option value="CASH" ${!isCard ? 'selected' : ''}>Cash</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Payment Details (Card Last 4 Digits / Receipt No)</label>
                    <input type="text" name="detail" class="form-control" value="${isCard ? payment.cardNumber : payment.receiptNumber}" required>
                </div>

                <div class="form-group">
                    <label>Payment Status</label>
                    <select name="status" class="form-control" required>
                        <option value="Pending" ${payment.status == 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="Paid" ${payment.status == 'Paid' ? 'selected' : ''}>Paid</option>
                        <option value="Failed" ${payment.status == 'Failed' ? 'selected' : ''}>Failed</option>
                        <option value="Refunded" ${payment.status == 'Refunded' ? 'selected' : ''}>Refunded</option>
                    </select>
                </div>

                <div class="mt-4">
                    <button type="submit" class="btn btn-primary">Update Payment</button>
                    <a href="${pageContext.request.contextPath}/payments" class="btn btn-outline-secondary">Cancel</a>
                </div>
            </form>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>