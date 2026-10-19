<%--
    =========================================
    MEMBER 4 - PAYMENT MANAGEMENT
    Page: Payment Management (Admin List)
    =========================================
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Management | Vehicle Rental Service</title>
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
        <h1>Payment Management</h1>
        <%@ include file="../common/messages.jsp" %>

        <section class="card mb-4">
            <h2>Search and filter</h2>
            <form action="${pageContext.request.contextPath}/payments" method="get" class="form-inline">
                <input type="text" name="keyword" value="${keyword}" placeholder="Search Payment/Rental ID" class="form-control mr-2">
                <select name="status" class="form-control mr-2">
                    <option value="">All Statuses</option>
                    <option value="Paid" ${status == 'Paid' ? 'selected' : ''}>Paid</option>
                    <option value="Pending" ${status == 'Pending' ? 'selected' : ''}>Pending</option>
                    <option value="Refunded" ${status == 'Refunded' ? 'selected' : ''}>Refunded</option>
                    <option value="Failed" ${status == 'Failed' ? 'selected' : ''}>Failed</option>
                </select>
                <button type="submit" class="btn btn-primary">Filter</button>
            </form>
        </section>

        <section class="card mb-4">
            <h2>All Payments List</h2>
            <div class="table-responsive">
                <table class="table table-striped" style="width: 100%; border-collapse: collapse;">
                    <thead>
                        <tr style="border-bottom: 2px solid #ddd; text-align: left;">
                            <th>ID</th>
                            <th>Rental</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pay" items="${payments}">
                            <tr style="border-bottom: 1px solid #eee;">
                                <td>${pay.paymentId}</td>
                                <td>${pay.rentalId}</td>
                                <td>${pay.amount}</td>
                                <td><span class="badge status-${pay.status.toLowerCase()}">${pay.status}</span></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/payments/${pay.paymentId}" class="btn btn-sm btn-info">View</a>
                                    <a href="${pageContext.request.contextPath}/payments/${pay.paymentId}/edit" class="btn btn-sm btn-warning">Edit</a>
                                    <form action="${pageContext.request.contextPath}/payments/${pay.paymentId}/delete" method="post" style="display:inline;">
                                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this payment?');">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>