/*
=========================================
MEMBER 1 - SHARED FRONTEND JAVASCRIPT
UI behavior only. No module business logic.
=========================================
*/

(function () {
    "use strict";

    const body = document.body;
    const sidebarToggle = document.querySelector("[data-sidebar-toggle]");
    const sidebarCloseItems = document.querySelectorAll("[data-sidebar-close]");
    const userMenu = document.querySelector("[data-user-menu]");

    if (sidebarToggle) {
        sidebarToggle.addEventListener("click", function () {
            body.classList.toggle("sidebar-open");
        });
    }

    sidebarCloseItems.forEach(function (item) {
        item.addEventListener("click", function () {
            body.classList.remove("sidebar-open");
        });
    });

    if (userMenu) {
        userMenu.addEventListener("click", function () {
            const expanded = userMenu.getAttribute("aria-expanded") === "true";
            userMenu.setAttribute("aria-expanded", String(!expanded));
            window.showToast("User menu placeholder");
        });
    }

    window.openModal = function (selector) {
        const modal = document.querySelector(selector);
        if (modal) {
            modal.classList.add("is-open");
        }
    };

    window.closeModal = function (selector) {
        const modal = document.querySelector(selector);
        if (modal) {
            modal.classList.remove("is-open");
        }
    };

    window.showToast = function (message) {
        const existingToast = document.querySelector(".toast");
        if (existingToast) {
            existingToast.remove();
        }

        const toast = document.createElement("div");
        toast.className = "toast";
        toast.setAttribute("role", "status");
        toast.textContent = message;
        document.body.appendChild(toast);

        window.setTimeout(function () {
            toast.remove();
        }, 2200);
    };
})();
