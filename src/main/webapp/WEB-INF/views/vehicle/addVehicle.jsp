<%-- MEMBER 2: Frontend-only Vehicle Management preview. No routes or persistence. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle | DriveHub</title>
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
        <header class="page-header"><div><p class="vehicle-eyebrow">FLEET MANAGEMENT</p><h1>Add Vehicle</h1><p>Add the essential details for a new vehicle in your fleet.</p></div></header>
        <%-- Frontend-only form. Edit values and branch choices are temporary mock UI, not a backend data contract. No form data is submitted or saved. --%>
        <div class="vehicle-form-layout">
        <form class="content-card vehicle-form" aria-label="Add Vehicle" onsubmit="event.preventDefault()">
            <p class="small-text">Fields marked <span class="vehicle-required">*</span> are required.</p>
            <fieldset class="vehicle-form-section"><legend><i class="bi bi-car-front" aria-hidden="true"></i> Vehicle basics</legend><p>Start with the brand, model and category.</p>
                <div class="form-row">
                    <div class="form-group"><label for="brand">Brand <span class="vehicle-required" aria-hidden="true">*</span></label><input class="form-control" id="brand" name="brand" type="text" placeholder="e.g. Toyota"  required></div>
                    <div class="form-group"><label for="model">Model <span class="vehicle-required" aria-hidden="true">*</span></label><input class="form-control" id="model" name="model" type="text" placeholder="e.g. Corolla"  required></div>
                    <div class="form-group"><label for="type">Vehicle Type <span class="vehicle-required" aria-hidden="true">*</span></label><select class="form-select" id="type" name="type" required><option value="">Select vehicle type</option><option >Car</option><option>Van</option><option>Motorcycle</option><option>SUV</option></select></div>
                </div>
            </fieldset>
            <fieldset class="vehicle-form-section"><legend><i class="bi bi-geo-alt" aria-hidden="true"></i> Rate &amp; availability</legend><p>Set the daily rate and the branch where the vehicle is based.</p>
                <div class="form-row">
                    <div class="form-group"><label for="price">Price Per Day (Rs.) <span class="vehicle-required" aria-hidden="true">*</span></label><input class="form-control" id="price" name="pricePerDay" type="number" min="0.01" step="0.01" placeholder="e.g. 8000"  aria-describedby="price-help" required><small class="small-text" id="price-help">Enter a positive daily rate in Sri Lankan Rupees.</small></div>
                    <div class="form-group"><label for="branch">Branch <span class="vehicle-required" aria-hidden="true">*</span></label><select class="form-select" id="branch" name="branch" required><option value="">Select a branch</option><option >Colombo</option><option>Kandy</option><option>Galle</option><option>Negombo</option></select></div>
                    <div class="form-group"><label for="availability">Availability <span class="vehicle-required" aria-hidden="true">*</span></label><select class="form-select" id="availability" name="availability" required><option value="">Select availability</option><option >Available</option><option>Unavailable</option></select></div>
                </div>
            </fieldset>
            <fieldset class="vehicle-form-section"><legend><i class="bi bi-image" aria-hidden="true"></i> Vehicle image</legend><p>Provide an image reference to help customers recognise the vehicle.</p>
                <div class="form-group"><label for="image">Image URL or path <span class="vehicle-required" aria-hidden="true">*</span></label><input class="form-control" id="image" name="image" type="text" placeholder="https://example.com/vehicle.jpg or images/vehicle.jpg"  aria-describedby="image-help" required><small class="small-text" id="image-help">Use a URL or an existing image path. Image upload is not available in this preview.</small></div>
            </fieldset>
            <div class="form-actions"><button class="btn btn-outline" type="button" data-demo><i class="bi bi-x-lg" aria-hidden="true"></i> Cancel</button><button class="btn btn-primary" type="submit"><i class="bi bi-check2" aria-hidden="true"></i> Save Vehicle</button></div>
        </form>
        <aside class="content-card vehicle-preview" aria-labelledby="preview-title"><span class="badge badge-info">Before you save</span><h2 id="preview-title">Ready for the road</h2>
            <span class="vehicle-preview-icon"><i class="bi bi-car-front" aria-hidden="true"></i></span><p>Keep the brand and model clear, check the daily rate, and choose the correct branch.</p><p class="small-text">An accurate image reference helps customers identify their next ride.</p>
            <p class="vehicle-preview-note">Frontend preview &middot; Saving will be connected in a later release.</p>
        </aside>
        </div>
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
