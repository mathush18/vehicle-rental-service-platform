<%--
    =========================================
    MEMBER 4 - PAYMENT MANAGEMENT
    Page: Add Payment
    =========================================
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Payment | Vehicle Rental Service</title>
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
        <h1>Add Payment</h1>
        <%@ include file="../common/messages.jsp" %>

        <section class="card mb-4">
            <h2>Rental Reference</h2>
            <p><strong>Rental ID:</strong> ${rental.rentalId}</p>
            <p><strong>Total Amount to Pay:</strong> LKR ${rental.totalCost}</p>
        </section>

        <section class="card mb-4">
            <h2>Payment record form area</h2>
            <form action="${pageContext.request.contextPath}/payments/add" method="post" class="form-grid">
                <input type="hidden" name="rentalId" value="${rental.rentalId}">

                <div class="form-group">
                    <label for="method">Payment Method</label>
                    <select name="method" id="method" class="form-control" onchange="togglePaymentFields()" required>
                        <option value="CARD" ${method == 'CARD' ? 'selected' : ''}>Credit/Debit Card</option>
                        <option value="CASH" ${method == 'CASH' ? 'selected' : ''}>Cash (Bank Deposit/Branch)</option>
                    </select>
                </div>

                <div id="cardFields" class="form-group" style="display: ${method == 'CASH' ? 'none' : 'block'};">
                    <label for="cardNumber">Card Number (16 digits)</label>
                    <input type="text" name="cardNumber" id="cardNumber" class="form-control" placeholder="1234 5678 9101 1121" maxlength="19">
                </div>

                <div id="cashFields" class="form-group" style="display: ${method == 'CASH' ? 'block' : 'none'};">
                    <label for="receiptNumber">Receipt / Reference Number</label>
                    <input type="text" name="receiptNumber" id="receiptNumber" class="form-control" value="${receiptNumber}" placeholder="e.g. DEP-12345">
                </div>

                <section class="mt-4">
                    <h2>Save and cancel controls area</h2>
                    <button type="submit" class="btn btn-primary">Pay Now</button>
                    <a href="${pageContext.request.contextPath}/rentals/mine?userId=${loggedInUser.userId}" class="btn btn-outline-secondary">Cancel</a>
                </section>
            </form>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>

    <script>
        function togglePaymentFields() {
            const method = document.getElementById('method').value;
            const cardFields = document.getElementById('cardFields');
            const cashFields = document.getElementById('cashFields');

            if (method === 'CASH') {
                cardFields.style.display = 'none';
                cashFields.style.display = 'block';
            } else {
                cardFields.style.display = 'block';
                cashFields.style.display = 'none';
            }
        }
    </script>
</body>
</html>