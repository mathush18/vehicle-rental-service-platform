/* Shared DriveHub UI. Existing modal/toast helpers retained for member pages. */
(() => {
    'use strict';
    const body = document.body;
    const toggle = document.querySelector('[data-sidebar-toggle]');
    function closeSidebar() { body.classList.remove('sidebar-open'); toggle?.setAttribute('aria-expanded', 'false'); }
    toggle?.addEventListener('click', () => {
        if (window.matchMedia('(max-width: 820px)').matches) {
            const open = body.classList.toggle('sidebar-open');
            toggle.setAttribute('aria-expanded', String(open));
            if (open) document.querySelector('.sidebar-link')?.focus();
        } else {
            body.classList.toggle('sidebar-collapsed');
            toggle.setAttribute('aria-expanded', String(!body.classList.contains('sidebar-collapsed')));
        }
    });
    document.querySelectorAll('[data-sidebar-close]').forEach(el => el.addEventListener('click', () => { closeSidebar(); toggle?.focus(); }));
    document.addEventListener('keydown', e => {
        if (e.key === 'Escape' && body.classList.contains('sidebar-open')) { closeSidebar(); toggle?.focus(); }
        if (e.key === 'Tab' && body.classList.contains('sidebar-open')) {
            const items = [...document.querySelectorAll('#appSidebar a, #appSidebar button')].filter(el => el.offsetParent !== null);
            if (e.shiftKey && document.activeElement === items[0]) { e.preventDefault(); items.at(-1)?.focus(); }
            else if (!e.shiftKey && document.activeElement === items.at(-1)) { e.preventDefault(); items[0]?.focus(); }
        }
    });
    window.matchMedia('(max-width: 820px)').addEventListener('change', closeSidebar);
    let toastTimer;
    window.showToast = message => {
        document.querySelector('.toast')?.remove(); clearTimeout(toastTimer);
        const toast = document.createElement('div');
        toast.className = 'toast'; toast.setAttribute('role', 'status'); toast.textContent = message;
        document.body.appendChild(toast); toastTimer = window.setTimeout(() => toast.remove(), 5200);
    };
    window.openModal = selector => document.querySelector(selector)?.classList.add('is-open');
    window.closeModal = selector => document.querySelector(selector)?.classList.remove('is-open');
    const dropdownButtons = [...document.querySelectorAll('[data-dropdown]')];
    function closeDropdowns(except) {
        dropdownButtons.forEach(btn => {
            if (btn === except) return;
            document.getElementById(btn.dataset.dropdown).hidden = true; btn.setAttribute('aria-expanded', 'false');
        });
    }
    dropdownButtons.forEach(btn => btn.addEventListener('click', () => {
        const panel = document.getElementById(btn.dataset.dropdown); const open = panel.hidden;
        closeDropdowns(btn); panel.hidden = !open; btn.setAttribute('aria-expanded', String(open));
    }));
    document.addEventListener('click', e => { if (!e.target.closest('.dropdown')) closeDropdowns(); });
    document.addEventListener('keydown', e => { if (e.key === 'Escape') { dropdownButtons.find(b => b.getAttribute('aria-expanded') === 'true')?.focus(); closeDropdowns(); } });
})();
