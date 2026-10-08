<%--
=========================================
MEMBER 1 - DASHBOARD SHELL
Shared dashboard layout only.
Dynamic data and module logic will be added later.
=========================================
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Vehicle Rental Service</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
    <div class="app-shell">
        <%@ include file="common/sidebar.jsp" %>
        <%@ include file="common/navbar.jsp" %>

        <main class="app-main page-content" id="main-content">
            <%@ include file="common/messages.jsp" %>

            <header class="page-header">
                <div>
                    <h1 class="page-title">Dashboard</h1>
                    <p>Shared overview shell for the vehicle rental platform.</p>
                </div>
            </header>

                        <section class="grid grid-4" aria-label="Dashboard statistics">
                <article class="stat-card"><span class="stat-icon" style="background: #4f46e5;"><i class="bi bi-people" aria-hidden="true"></i></span><div><h3>Total Users</h3><p><strong>245</strong></p><small class="small-text">Future dynamic value</small></div></article>
                <article class="stat-card"><span class="stat-icon" style="background: #2563eb;"><i class="bi bi-car-front" aria-hidden="true"></i></span><div><h3>Total Vehicles</h3><p><strong>100</strong></p><small class="small-text">Future dynamic value</small></div></article>
                <article class="stat-card"><span class="stat-icon" style="background: #16a34a;"><i class="bi bi-check2-circle" aria-hidden="true"></i></span><div><h3>Available Vehicles</h3><p><strong>78</strong></p><small class="small-text">Future dynamic value</small></div></article>
                <article class="stat-card"><span class="stat-icon" style="background: #f59e0b;"><i class="bi bi-calendar-check" aria-hidden="true"></i></span><div><h3>Active Rentals</h3><p><strong>22</strong></p><small class="small-text">Future dynamic value</small></div></article>
                <article class="stat-card"><span class="stat-icon" style="background: #0ea5e9;"><i class="bi bi-credit-card" aria-hidden="true"></i></span><div><h3>Payments</h3><p><strong>Rs. 850K</strong></p><small class="small-text">Future dynamic value</small></div></article>
                <article class="stat-card"><span class="stat-icon" style="background: #7c3aed;"><i class="bi bi-geo-alt" aria-hidden="true"></i></span><div><h3>Branches</h3><p><strong>15</strong></p><small class="small-text">Future dynamic value</small></div></article>
                <article class="stat-card"><span class="stat-icon" style="background: #f43f5e;"><i class="bi bi-star" aria-hidden="true"></i></span><div><h3>Reviews</h3><p><strong>1.2K</strong></p><small class="small-text">Future dynamic value</small></div></article>
            </section>

            <section class="grid grid-2">
                <article class="content-card">
                    <div class="section-header"><h2>Recent Rentals</h2><span class="badge badge-info">Placeholder</span></div>
                    <div class="empty-state"><%-- Dynamic recent rentals will be displayed here later. --%>Recent rental activity will appear here.</div>
                </article>
                <article class="content-card">
                    <div class="section-header"><h2>Vehicle Availability</h2><span class="badge badge-success">Placeholder</span></div>
                    <div class="empty-state"><%-- Dynamic vehicle availability data will be displayed here later. --%>Vehicle availability summary will appear here.</div>
                </article>
                <article class="content-card">
                    <div class="section-header"><h2>Recent Payments</h2><span class="badge badge-warning">Placeholder</span></div>
                    <div class="empty-state"><%-- Dynamic payment data will be displayed here later. --%>Recent payment records will appear here.</div>
                </article>
                <article class="content-card">
                    <div class="section-header"><h2>Latest Reviews</h2><span class="badge badge-danger">Placeholder</span></div>
                    <div class="empty-state"><%-- Dynamic review data will be displayed here later. --%>Latest customer reviews will appear here.</div>
                </article>
            </section>
        </main>

        <%@ include file="common/footer.jsp" %>
    </div>
</body>
</html>
