<%--
=========================================
MEMBER 1 - HOMEPAGE VISUAL REFERENCE
Shared UI direction for the full team.
Placeholder content only. No backend data.
=========================================
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DriveHub | Vehicle Rental Service</title>
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

            <section class="hero" aria-label="Vehicle rental hero">
                <div class="hero-content">
                    <div class="hero-kicker">EXPLORE &middot; RENT &middot; TRAVEL</div>
                    <div>
                        <h1>Your Journey Starts Here</h1>
                        <p>Reliable vehicles. Flexible rentals. Unforgettable journeys.</p>
                    </div>
                    <div class="hero-actions" role="tablist" aria-label="Rental search mode">
                        <button class="btn btn-primary" type="button"><i class="bi bi-car-front" aria-hidden="true"></i> Rent a Vehicle</button>
                        <button class="btn btn-outline" type="button"><i class="bi bi-geo-alt" aria-hidden="true"></i> Find a Branch</button>
                    </div>

                    <form class="rental-search-panel" action="#">
                        <div class="rental-search-grid">
                            <div class="form-group">
                                <label for="pickupLocation">Pickup Location</label>
                                <div class="input-with-icon">
                                    <i class="bi bi-geo-alt" aria-hidden="true"></i>
                                    <input class="form-control" id="pickupLocation" type="text" placeholder="Select location">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pickupDate">Pickup Date</label>
                                <div class="input-with-icon">
                                    <i class="bi bi-calendar3" aria-hidden="true"></i>
                                    <input class="form-control" id="pickupDate" type="text" placeholder="Select date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="returnDate">Return Date</label>
                                <div class="input-with-icon">
                                    <i class="bi bi-calendar3" aria-hidden="true"></i>
                                    <input class="form-control" id="returnDate" type="text" placeholder="Select date">
                                </div>
                            </div>
                            <button class="btn btn-primary search-submit" type="button">Search Vehicles <i class="bi bi-arrow-right" aria-hidden="true"></i></button>
                        </div>
                    </form>

                    <div class="hero-stats" aria-label="Platform statistics">
                        <div class="hero-stat"><strong>100+</strong><span>Vehicles</span></div>
                        <div class="hero-stat"><strong>15+</strong><span>Branches</span></div>
                        <div class="hero-stat"><strong>5K+</strong><span>Happy Customers</span></div>
                    </div>
                </div>
            </section>

            <section class="grid grid-4" aria-label="Benefits">
                <article class="feature-card">
                    <span class="feature-icon" style="background: linear-gradient(135deg, #6366f1, #4f46e5);"><i class="bi bi-car-front-fill" aria-hidden="true"></i></span>
                    <div>
                        <h3>Wide Vehicle Range</h3>
                        <p>Cars, vans, motorcycles and more</p>
                    </div>
                </article>
                <article class="feature-card">
                    <span class="feature-icon" style="background: linear-gradient(135deg, #fbbf24, #f59e0b);"><i class="bi bi-cash-coin" aria-hidden="true"></i></span>
                    <div>
                        <h3>Affordable Rates</h3>
                        <p>Best prices for your journey</p>
                    </div>
                </article>
                <article class="feature-card">
                    <span class="feature-icon" style="background: linear-gradient(135deg, #22c55e, #14b8a6);"><i class="bi bi-shield-check" aria-hidden="true"></i></span>
                    <div>
                        <h3>Safe & Reliable</h3>
                        <p>Well-maintained vehicles</p>
                    </div>
                </article>
                <article class="feature-card">
                    <span class="feature-icon" style="background: linear-gradient(135deg, #fb7185, #f43f5e);"><i class="bi bi-geo-alt-fill" aria-hidden="true"></i></span>
                    <div>
                        <h3>Multiple Locations</h3>
                        <p>Convenient branches across the city</p>
                    </div>
                </article>
            </section>

            <section class="page-content">
                <div class="section-header">
                    <h2><i class="bi bi-car-front-fill section-icon" aria-hidden="true"></i> Browse by Vehicle Type</h2>
                    <a class="btn btn-secondary" href="#">View All <i class="bi bi-arrow-right" aria-hidden="true"></i></a>
                </div>
                <div class="grid grid-4">
                    <article class="category-card" style="background: #eaf6ff;">
                        <div><h3>Cars</h3><p>Comfortable and stylish</p><strong>30+ vehicles</strong></div>
                        <img src="https://images.unsplash.com/photo-1552519507-da3b142c6e3d?auto=format&fit=crop&w=420&q=80" alt="White car">
                    </article>
                    <article class="category-card" style="background: #eefaf1;">
                        <div><h3>Vans</h3><p>Perfect for groups</p><strong>15+ vehicles</strong></div>
                        <img src="https://images.unsplash.com/photo-1543465077-db45d34b88a5?auto=format&fit=crop&w=420&q=80" alt="Van">
                    </article>
                    <article class="category-card" style="background: #fff1e6;">
                        <div><h3>Motorcycles</h3><p>Ride with freedom</p><strong>20+ vehicles</strong></div>
                        <img src="https://images.unsplash.com/photo-1558981806-ec527fa84c39?auto=format&fit=crop&w=420&q=80" alt="Motorcycle">
                    </article>
                    <article class="category-card" style="background: #f1edff;">
                        <div><h3>SUVs</h3><p>For bigger adventures</p><strong>10+ vehicles</strong></div>
                        <img src="https://images.unsplash.com/photo-1519641471654-76ce0107ad1b?auto=format&fit=crop&w=420&q=80" alt="SUV">
                    </article>
                </div>
            </section>

            <section class="page-content">
                <div class="section-header">
                    <h2><i class="bi bi-star-fill section-icon section-icon-warning" aria-hidden="true"></i> Popular Vehicles</h2>
                    <a class="btn btn-secondary" href="#">View All <i class="bi bi-arrow-right" aria-hidden="true"></i></a>
                </div>
                <div class="grid grid-4">
                    <article class="vehicle-card">
                        <div class="vehicle-media"><img src="https://images.unsplash.com/photo-1623869675781-80aa31012a5a?auto=format&fit=crop&w=520&q=80" alt="Toyota Corolla"></div>
                        <div class="vehicle-body"><span class="badge badge-warning">Popular</span><h3>Toyota Corolla</h3><p><i class="bi bi-car-front" aria-hidden="true"></i> Car</p><strong>Rs. 8,000 / day</strong><button class="btn btn-primary" type="button">View Details</button></div>
                    </article>
                    <article class="vehicle-card">
                        <div class="vehicle-media"><img src="https://images.unsplash.com/photo-1609521263047-f8f205293f24?auto=format&fit=crop&w=520&q=80" alt="Toyota Hiace"></div>
                        <div class="vehicle-body"><span class="badge badge-danger">New</span><h3>Toyota Hiace</h3><p><i class="bi bi-car-front" aria-hidden="true"></i> Van</p><strong>Rs. 12,000 / day</strong><button class="btn btn-primary" type="button">View Details</button></div>
                    </article>
                    <article class="vehicle-card">
                        <div class="vehicle-media"><img src="https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?auto=format&fit=crop&w=520&q=80" alt="Yamaha FZ-S"></div>
                        <div class="vehicle-body"><span class="badge badge-info">Ready</span><h3>Yamaha FZ-S</h3><p><i class="bi bi-bicycle" aria-hidden="true"></i> Motorcycle</p><strong>Rs. 3,500 / day</strong><button class="btn btn-primary" type="button">View Details</button></div>
                    </article>
                    <article class="vehicle-card">
                        <div class="vehicle-media"><img src="https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?auto=format&fit=crop&w=520&q=80" alt="Toyota RAV4"></div>
                        <div class="vehicle-body"><span class="badge badge-success">Available</span><h3>Toyota RAV4</h3><p><i class="bi bi-car-front" aria-hidden="true"></i> SUV</p><strong>Rs. 15,000 / day</strong><button class="btn btn-primary" type="button">View Details</button></div>
                    </article>
                </div>
            </section>
        </main>

        <%@ include file="common/footer.jsp" %>
    </div>
</body>
</html>
