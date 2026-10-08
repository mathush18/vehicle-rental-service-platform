<%--
=========================================
MEMBER 1 - SHARED TOP NAVBAR
Placeholder UI only. Authentication comes later.
=========================================
--%>
<header class="top-navbar">
    <div class="navbar-left">
        <button class="btn btn-outline btn-icon menu-toggle" type="button" data-sidebar-toggle aria-label="Open navigation">
            <i class="bi bi-list" aria-hidden="true"></i>
        </button>
        <form class="search-box" action="#" role="search">
            <i class="bi bi-search search-icon" aria-hidden="true"></i>
            <label class="sr-only" for="globalSearch">Search</label>
            <input class="form-control" id="globalSearch" type="search" placeholder="Search vehicles, locations...">
        </form>
    </div>

    <div class="navbar-right">
        <button class="btn btn-outline btn-icon notification-button" type="button" aria-label="Notifications">
            <i class="bi bi-bell" aria-hidden="true"></i>
            <span class="notification-badge">3</span>
        </button>
        <button class="navbar-user" type="button" data-user-menu aria-expanded="false">
            <span class="avatar"><i class="bi bi-person-circle" aria-hidden="true"></i></span>
            <span class="navbar-user-copy">
                <span class="user-name">Mathushalini</span>
                <span class="user-role">Customer</span>
            </span>
            <i class="bi bi-chevron-down" aria-hidden="true"></i>
        </button>
    </div>
</header>
