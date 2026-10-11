<%-- MEMBER 2: Frontend-only Vehicle Management preview. No routes or persistence. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Details | DriveHub</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modules/vehicle.css">
    <script src="${pageContext.request.contextPath}/js/app.js" defer></script>
</head>
<body>
<div class="app-shell">
    <%@ include file="../common/sidebar.jsp" %>
    <%@ include file="../common/navbar.jsp" %>
    <main class="app-main page-content vehicle-module" id="main-content">
        <%@ include file="../common/messages.jsp" %>
        <nav aria-label="Vehicle navigation"><button class="btn btn-outline" type="button" data-demo><i class="bi bi-arrow-left" aria-hidden="true"></i> Back to Vehicles</button></nav>
        <%-- Temporary frontend mock vehicle, including illustrative image. Replace with backend/JSTL data later. --%>
        <header class="page-header"><div><p class="vehicle-eyebrow">VEHICLE DETAILS</p><h1>Toyota Corolla</h1><p>An everyday car for your next journey.</p></div><span class="badge badge-success">Available</span></header>
        <div class="vehicle-details-layout">
            <figure class="content-card vehicle-details-media"><img src="https://images.unsplash.com/photo-1623869675781-80aa31012a5a?auto=format&amp;fit=crop&amp;w=900&amp;q=80" alt="Illustrative vehicle photo for the Toyota Corolla preview" width="900" height="600"><figcaption class="small-text">Toyota Corolla &middot; Illustrative fleet photo</figcaption></figure>
            <section class="content-card vehicle-summary" aria-labelledby="overview-title">
                <span class="badge badge-info">Car</span><h2 id="overview-title">Your next ride</h2><p><i class="bi bi-geo-alt" aria-hidden="true"></i> Colombo branch</p>
                <strong class="vehicle-price vehicle-price-large">Rs. 8,000 <span>/ day</span></strong>
                <p>Daily rental rate. Confirm availability with the branch before planning your trip.</p>
                <div class="vehicle-summary-actions"><button class="btn btn-primary" type="button" data-demo><i class="bi bi-calendar-check" aria-hidden="true"></i> Rent this Vehicle</button></div>
                <p class="small-text">Rental enquiries will be available in a later release.</p>
            </section>
        </div>
        <section class="content-card vehicle-specifications" aria-labelledby="info-title"><h2 id="info-title">Vehicle information</h2>
            <dl class="vehicle-info-grid"><div><dt>Brand</dt><dd>Toyota</dd></div><div><dt>Model</dt><dd>Corolla</dd></div><div><dt>Vehicle Type</dt><dd>Car</dd></div><div><dt>Price Per Day</dt><dd>Rs. 8,000</dd></div><div><dt>Branch</dt><dd>Colombo</dd></div><div><dt>Availability</dt><dd><span class="badge badge-success">Available</span></dd></div></dl>
        </section>
        <section class="content-card vehicle-admin" aria-labelledby="admin-title"><div><h2 id="admin-title">Manage this vehicle</h2><p>Admin controls &middot; Frontend preview only</p></div><div class="vehicle-inline-actions"><button class="btn btn-outline" type="button" data-demo><i class="bi bi-pencil-square" aria-hidden="true"></i> Edit Vehicle</button><button class="btn btn-danger" type="button" data-demo><i class="bi bi-trash3" aria-hidden="true"></i> Delete</button></div></section>
        <p class="vehicle-feedback" id="vehicle-feedback" role="status" aria-live="polite"></p>
    </main>
    <%@ include file="../common/footer.jsp" %>
</div>
<script>
(function () {
    "use strict";
    const root = document.querySelector('.vehicle-module');
    const feedback = document.getElementById('vehicle-feedback');
    root.querySelectorAll('[data-demo]').forEach(function (button) {
        button.addEventListener('click', function () {
            feedback.textContent = button.textContent.trim() + ': frontend preview only. No data has been changed; page navigation and actions will be connected later.';
        });
    });
    const form = root.querySelector('.vehicle-form');
    if (form) form.addEventListener('submit', function (event) {
        event.preventDefault();
        feedback.textContent = 'Form preview complete. Your entries have not been saved.';
    });
})();
</script>

</body>
</html>
