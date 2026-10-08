<%--
=========================================
MEMBER 1 - SHARED SIDEBAR
Shared navigation shell for all members.
No backend permissions or role logic yet.
=========================================
--%>
<aside class="app-sidebar" id="appSidebar" aria-label="Main sidebar">
    <a class="sidebar-brand" href="${pageContext.request.contextPath}/">
        <span class="brand-mark"><i class="bi bi-car-front-fill" aria-hidden="true"></i></span>
        <span class="brand-copy">
            <span class="brand-title">Drive<span>Hub</span></span>
            <span class="brand-subtitle">Vehicle Rental Service</span>
        </span>
    </a>

    <nav class="sidebar-nav" aria-label="Administration navigation">
        <a class="sidebar-link is-active" href="${pageContext.request.contextPath}/dashboard">
            <span class="sidebar-icon"><i class="bi bi-grid" aria-hidden="true"></i></span>
            <span class="sidebar-label">Dashboard</span>
        </a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/vehicles">
            <span class="sidebar-icon"><i class="bi bi-car-front" aria-hidden="true"></i></span>
            <span class="sidebar-label">Vehicles</span>
        </a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/rentals">
            <span class="sidebar-icon"><i class="bi bi-calendar-check" aria-hidden="true"></i></span>
            <span class="sidebar-label">Rentals</span>
        </a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/payments">
            <span class="sidebar-icon"><i class="bi bi-credit-card" aria-hidden="true"></i></span>
            <span class="sidebar-label">Payments</span>
        </a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/branches">
            <span class="sidebar-icon"><i class="bi bi-geo-alt" aria-hidden="true"></i></span>
            <span class="sidebar-label">Branches</span>
        </a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/reviews">
            <span class="sidebar-icon"><i class="bi bi-star" aria-hidden="true"></i></span>
            <span class="sidebar-label">Reviews</span>
        </a>
        <a class="sidebar-link" href="${pageContext.request.contextPath}/users">
            <span class="sidebar-icon"><i class="bi bi-people" aria-hidden="true"></i></span>
            <span class="sidebar-label">Users</span>
        </a>
    </nav>

    <section class="sidebar-promo" aria-label="Travel promotion">
        <div>
            <h3>Life is Better on the Road</h3>
            <p>Explore new places with the vehicles you love.</p>
        </div>
    </section>
</aside>
<div class="sidebar-overlay" data-sidebar-close></div>
