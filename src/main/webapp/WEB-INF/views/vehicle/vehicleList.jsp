<%-- MEMBER 2: Frontend-only Vehicle Management preview. No routes or persistence. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicles | DriveHub</title>
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
        <header class="page-header"><div><p class="vehicle-eyebrow">THE DRIVEHUB FLEET</p><h1>Vehicles</h1><p>Find your next ride, or manage the vehicles that make it happen.</p></div><button class="btn btn-primary" type="button" data-demo><i class="bi bi-plus-lg" aria-hidden="true"></i> Add Vehicle</button></header>
        <section class="content-card vehicle-toolbar" aria-labelledby="filter-title">
            <div class="section-header"><h2 id="filter-title">Find a vehicle</h2><button class="btn btn-secondary" type="button" id="clear-filters"><i class="bi bi-arrow-counterclockwise" aria-hidden="true"></i> Clear Filters</button></div>
            <div class="vehicle-filter-grid">
                <div class="form-group"><label for="vehicle-search">Search by brand or model</label><div class="input-with-icon"><i class="bi bi-search" aria-hidden="true"></i><input class="form-control" id="vehicle-search" type="search" placeholder="Search by brand or model"></div></div>
                <div class="form-group"><label for="vehicle-type">Vehicle Type</label><select class="form-select" id="vehicle-type"><option value="">All Vehicles</option><option>Car</option><option>Van</option><option>Motorcycle</option><option>SUV</option></select></div>
                <div class="form-group"><label for="vehicle-availability">Availability</label><select class="form-select" id="vehicle-availability"><option value="">All</option><option>Available</option><option>Unavailable</option></select></div>
                <div class="form-group"><label for="vehicle-sort">Sort by</label><select class="form-select" id="vehicle-sort"><option value="default">Featured order</option><option value="asc">Price: Low to High</option><option value="desc">Price: High to Low</option></select></div>
            </div>
        </section>
        <section class="page-content" aria-labelledby="results-title">
            <div class="section-header vehicle-results-header"><h2 id="results-title">Explore the fleet</h2><p id="vehicle-count" role="status" aria-live="polite">Showing 8 vehicles</p></div>
            <p class="small-text">Sample fleet preview &middot; Photos are illustrative.</p>
            <%-- Temporary frontend mock cards only. Replace with backend/JSTL data when integration begins. --%>
            <div class="grid grid-4 vehicle-grid" id="vehicle-grid">
            <article class="vehicle-card" data-name="Toyota Corolla" data-type="Car" data-price="8000" data-availability="Available">
                <div class="vehicle-media"><img src="https://images.unsplash.com/photo-1623869675781-80aa31012a5a?auto=format&amp;fit=crop&amp;w=520&amp;q=80" alt="Illustrative car photo for Toyota Corolla" loading="lazy" width="520" height="300"></div>
                <div class="vehicle-body">
                    <span class="badge badge-success">Available</span>
                    <h3>Toyota Corolla</h3>
                    <p class="vehicle-meta"><i class="bi bi-car-front" aria-hidden="true"></i> Car <span><i class="bi bi-geo-alt" aria-hidden="true"></i> Colombo</span></p>
                    <strong class="vehicle-price">Rs. 8,000 <span>/ day</span></strong>
                    <div class="vehicle-card-actions">
                        <button class="btn btn-primary vehicle-view" type="button" data-demo aria-label="View details for Toyota Corolla">View Details <i class="bi bi-arrow-right" aria-hidden="true"></i></button>
                        <button class="btn btn-outline" type="button" data-demo aria-label="Edit Toyota Corolla"><i class="bi bi-pencil-square" aria-hidden="true"></i> Edit</button>
                        <button class="btn btn-danger" type="button" data-demo aria-label="Delete Toyota Corolla"><i class="bi bi-trash3" aria-hidden="true"></i> Delete</button>
                    </div>
                </div>
            </article>
            <article class="vehicle-card" data-name="Toyota Hiace" data-type="Van" data-price="12000" data-availability="Available">
                <div class="vehicle-media"><img src="https://images.unsplash.com/photo-1609521263047-f8f205293f24?auto=format&amp;fit=crop&amp;w=520&amp;q=80" alt="Illustrative van photo for Toyota Hiace" loading="lazy" width="520" height="300"></div>
                <div class="vehicle-body">
                    <span class="badge badge-success">Available</span>
                    <h3>Toyota Hiace</h3>
                    <p class="vehicle-meta"><i class="bi bi-car-front" aria-hidden="true"></i> Van <span><i class="bi bi-geo-alt" aria-hidden="true"></i> Kandy</span></p>
                    <strong class="vehicle-price">Rs. 12,000 <span>/ day</span></strong>
                    <div class="vehicle-card-actions">
                        <button class="btn btn-primary vehicle-view" type="button" data-demo aria-label="View details for Toyota Hiace">View Details <i class="bi bi-arrow-right" aria-hidden="true"></i></button>
                        <button class="btn btn-outline" type="button" data-demo aria-label="Edit Toyota Hiace"><i class="bi bi-pencil-square" aria-hidden="true"></i> Edit</button>
                        <button class="btn btn-danger" type="button" data-demo aria-label="Delete Toyota Hiace"><i class="bi bi-trash3" aria-hidden="true"></i> Delete</button>
                    </div>
                </div>
            </article>
            <article class="vehicle-card" data-name="Yamaha FZ-S" data-type="Motorcycle" data-price="3500" data-availability="Available">
                <div class="vehicle-media"><img src="https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?auto=format&amp;fit=crop&amp;w=520&amp;q=80" alt="Illustrative motorcycle photo for Yamaha FZ-S" loading="lazy" width="520" height="300"></div>
                <div class="vehicle-body">
                    <span class="badge badge-success">Available</span>
                    <h3>Yamaha FZ-S</h3>
                    <p class="vehicle-meta"><i class="bi bi-bicycle" aria-hidden="true"></i> Motorcycle <span><i class="bi bi-geo-alt" aria-hidden="true"></i> Galle</span></p>
                    <strong class="vehicle-price">Rs. 3,500 <span>/ day</span></strong>
                    <div class="vehicle-card-actions">
                        <button class="btn btn-primary vehicle-view" type="button" data-demo aria-label="View details for Yamaha FZ-S">View Details <i class="bi bi-arrow-right" aria-hidden="true"></i></button>
                        <button class="btn btn-outline" type="button" data-demo aria-label="Edit Yamaha FZ-S"><i class="bi bi-pencil-square" aria-hidden="true"></i> Edit</button>
                        <button class="btn btn-danger" type="button" data-demo aria-label="Delete Yamaha FZ-S"><i class="bi bi-trash3" aria-hidden="true"></i> Delete</button>
                    </div>
                </div>
            </article>
            <article class="vehicle-card" data-name="Toyota RAV4" data-type="SUV" data-price="15000" data-availability="Unavailable">
                <div class="vehicle-media"><img src="https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?auto=format&amp;fit=crop&amp;w=520&amp;q=80" alt="Illustrative suv photo for Toyota RAV4" loading="lazy" width="520" height="300"></div>
                <div class="vehicle-body">
                    <span class="badge badge-warning">Unavailable</span>
                    <h3>Toyota RAV4</h3>
                    <p class="vehicle-meta"><i class="bi bi-car-front" aria-hidden="true"></i> SUV <span><i class="bi bi-geo-alt" aria-hidden="true"></i> Colombo</span></p>
                    <strong class="vehicle-price">Rs. 15,000 <span>/ day</span></strong>
                    <div class="vehicle-card-actions">
                        <button class="btn btn-primary vehicle-view" type="button" data-demo aria-label="View details for Toyota RAV4">View Details <i class="bi bi-arrow-right" aria-hidden="true"></i></button>
                        <button class="btn btn-outline" type="button" data-demo aria-label="Edit Toyota RAV4"><i class="bi bi-pencil-square" aria-hidden="true"></i> Edit</button>
                        <button class="btn btn-danger" type="button" data-demo aria-label="Delete Toyota RAV4"><i class="bi bi-trash3" aria-hidden="true"></i> Delete</button>
                    </div>
                </div>
            </article>
            <article class="vehicle-card" data-name="Honda Civic" data-type="Car" data-price="9500" data-availability="Available">
                <div class="vehicle-media"><img src="https://images.unsplash.com/photo-1552519507-da3b142c6e3d?auto=format&amp;fit=crop&amp;w=520&amp;q=80" alt="Illustrative car photo for Honda Civic" loading="lazy" width="520" height="300"></div>
                <div class="vehicle-body">
                    <span class="badge badge-success">Available</span>
                    <h3>Honda Civic</h3>
                    <p class="vehicle-meta"><i class="bi bi-car-front" aria-hidden="true"></i> Car <span><i class="bi bi-geo-alt" aria-hidden="true"></i> Negombo</span></p>
                    <strong class="vehicle-price">Rs. 9,500 <span>/ day</span></strong>
                    <div class="vehicle-card-actions">
                        <button class="btn btn-primary vehicle-view" type="button" data-demo aria-label="View details for Honda Civic">View Details <i class="bi bi-arrow-right" aria-hidden="true"></i></button>
                        <button class="btn btn-outline" type="button" data-demo aria-label="Edit Honda Civic"><i class="bi bi-pencil-square" aria-hidden="true"></i> Edit</button>
                        <button class="btn btn-danger" type="button" data-demo aria-label="Delete Honda Civic"><i class="bi bi-trash3" aria-hidden="true"></i> Delete</button>
                    </div>
                </div>
            </article>
            <article class="vehicle-card" data-name="Nissan Caravan" data-type="Van" data-price="11500" data-availability="Unavailable">
                <div class="vehicle-media"><img src="https://images.unsplash.com/photo-1543465077-db45d34b88a5?auto=format&amp;fit=crop&amp;w=520&amp;q=80" alt="Illustrative van photo for Nissan Caravan" loading="lazy" width="520" height="300"></div>
                <div class="vehicle-body">
                    <span class="badge badge-warning">Unavailable</span>
                    <h3>Nissan Caravan</h3>
                    <p class="vehicle-meta"><i class="bi bi-car-front" aria-hidden="true"></i> Van <span><i class="bi bi-geo-alt" aria-hidden="true"></i> Galle</span></p>
                    <strong class="vehicle-price">Rs. 11,500 <span>/ day</span></strong>
                    <div class="vehicle-card-actions">
                        <button class="btn btn-primary vehicle-view" type="button" data-demo aria-label="View details for Nissan Caravan">View Details <i class="bi bi-arrow-right" aria-hidden="true"></i></button>
                        <button class="btn btn-outline" type="button" data-demo aria-label="Edit Nissan Caravan"><i class="bi bi-pencil-square" aria-hidden="true"></i> Edit</button>
                        <button class="btn btn-danger" type="button" data-demo aria-label="Delete Nissan Caravan"><i class="bi bi-trash3" aria-hidden="true"></i> Delete</button>
                    </div>
                </div>
            </article>
            <article class="vehicle-card" data-name="Honda CB Hornet" data-type="Motorcycle" data-price="4000" data-availability="Available">
                <div class="vehicle-media"><img src="https://images.unsplash.com/photo-1558981806-ec527fa84c39?auto=format&amp;fit=crop&amp;w=520&amp;q=80" alt="Illustrative motorcycle photo for Honda CB Hornet" loading="lazy" width="520" height="300"></div>
                <div class="vehicle-body">
                    <span class="badge badge-success">Available</span>
                    <h3>Honda CB Hornet</h3>
                    <p class="vehicle-meta"><i class="bi bi-bicycle" aria-hidden="true"></i> Motorcycle <span><i class="bi bi-geo-alt" aria-hidden="true"></i> Kandy</span></p>
                    <strong class="vehicle-price">Rs. 4,000 <span>/ day</span></strong>
                    <div class="vehicle-card-actions">
                        <button class="btn btn-primary vehicle-view" type="button" data-demo aria-label="View details for Honda CB Hornet">View Details <i class="bi bi-arrow-right" aria-hidden="true"></i></button>
                        <button class="btn btn-outline" type="button" data-demo aria-label="Edit Honda CB Hornet"><i class="bi bi-pencil-square" aria-hidden="true"></i> Edit</button>
                        <button class="btn btn-danger" type="button" data-demo aria-label="Delete Honda CB Hornet"><i class="bi bi-trash3" aria-hidden="true"></i> Delete</button>
                    </div>
                </div>
            </article>
            <article class="vehicle-card" data-name="Honda CR-V" data-type="SUV" data-price="14500" data-availability="Available">
                <div class="vehicle-media"><img src="https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?auto=format&amp;fit=crop&amp;w=520&amp;q=80" alt="Illustrative suv photo for Honda CR-V" loading="lazy" width="520" height="300"></div>
                <div class="vehicle-body">
                    <span class="badge badge-success">Available</span>
                    <h3>Honda CR-V</h3>
                    <p class="vehicle-meta"><i class="bi bi-car-front" aria-hidden="true"></i> SUV <span><i class="bi bi-geo-alt" aria-hidden="true"></i> Negombo</span></p>
                    <strong class="vehicle-price">Rs. 14,500 <span>/ day</span></strong>
                    <div class="vehicle-card-actions">
                        <button class="btn btn-primary vehicle-view" type="button" data-demo aria-label="View details for Honda CR-V">View Details <i class="bi bi-arrow-right" aria-hidden="true"></i></button>
                        <button class="btn btn-outline" type="button" data-demo aria-label="Edit Honda CR-V"><i class="bi bi-pencil-square" aria-hidden="true"></i> Edit</button>
                        <button class="btn btn-danger" type="button" data-demo aria-label="Delete Honda CR-V"><i class="bi bi-trash3" aria-hidden="true"></i> Delete</button>
                    </div>
                </div>
            </article>
            </div>
            <div class="empty-state vehicle-empty" id="vehicle-empty" hidden>
                <i class="bi bi-search" aria-hidden="true"></i><h3>No vehicles found</h3><p>Try another brand or model, or clear your filters.</p><button class="btn btn-secondary" type="button" id="empty-clear">Clear Filters</button>
            </div>
        </section>
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
<script>
(function () {
    "use strict";
    const grid = document.getElementById('vehicle-grid');
    const cards = Array.from(grid.children);
    const search = document.getElementById('vehicle-search');
    const type = document.getElementById('vehicle-type');
    const availability = document.getElementById('vehicle-availability');
    const sort = document.getElementById('vehicle-sort');
    function update() {
        const query = search.value.trim().toLowerCase();
        let count = 0;
        const ordered = cards.slice();
        if (sort.value !== 'default') ordered.sort(function (a, b) {
            return (Number(a.dataset.price) - Number(b.dataset.price)) * (sort.value === 'asc' ? 1 : -1);
        });
        ordered.forEach(function (card) {
            card.hidden = !(card.dataset.name.toLowerCase().includes(query) && (!type.value || card.dataset.type === type.value) && (!availability.value || card.dataset.availability === availability.value));
            if (!card.hidden) count++;
            grid.appendChild(card);
        });
        document.getElementById('vehicle-count').textContent = 'Showing ' + count + (count === 1 ? ' vehicle' : ' vehicles');
        document.getElementById('vehicle-empty').hidden = count !== 0;
        grid.hidden = count === 0;
    }
    function clear() { search.value = ''; type.value = ''; availability.value = ''; sort.value = 'default'; update(); search.focus(); }
    search.addEventListener('input', update);
    [type, availability, sort].forEach(function (control) { control.addEventListener('change', update); });
    document.getElementById('clear-filters').addEventListener('click', clear);
    document.getElementById('empty-clear').addEventListener('click', clear);
})();
</script>
</body>
</html>
