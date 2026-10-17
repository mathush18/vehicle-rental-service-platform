/* Task 1 interactions only. No network requests or persistent storage. */
(() => {
    'use strict';
    if (!document.body.classList.contains('drivehub')) return;
    const $ = (selector, root = document) => root.querySelector(selector);
    const $$ = (selector, root = document) => [...root.querySelectorAll(selector)];
    const data = window.DriveHubDemo;
    const context = document.body.dataset.context || '';
    const role = document.body.dataset.role || 'customer';
    const params = new URLSearchParams(location.search);
    const money = value => Number(value).toLocaleString('en-US');
    const escape = value => String(value).replace(/[&<>"']/g, char => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[char]));
    const text = (selector,value) => $$(selector).forEach(el => { el.textContent = String(value); });
    const vehicle = data.fleet.find(v => v.id === Number(params.get('id'))) || data.fleet[0];
    const statusBadge = status => `<span class="badge badge-${['Paid','Available','Active','Approved'].includes(status)?'success':['Pending','Rented'].includes(status)?'warning':['Completed','Refunded'].includes(status)?'info':'danger'}">${escape(status)}</span>`;
    const photoMarkup = v => `<div class="fleet-photo photo-${v.id}" role="img" aria-label="${escape(v.name)}"></div>`;
    const detailList = pairs => `<dl class="info-list">${pairs.map(([name,value])=>`<div><dt>${escape(name)}</dt><dd>${escape(value)}</dd></div>`).join('')}</dl>`;
    const dialog = $('#action-dialog');
    let dialogAction = null;
    function openDialog(title, content, action, label = 'Confirm Preview') {
        $('#dialog-title').textContent = title;
        $('#dialog-content').innerHTML = content;
        const confirm = $('#dialog-confirm'); confirm.hidden = !action; confirm.textContent = label;
        dialogAction = action || null;
        if (!dialog.open) dialog.showModal();
    }
    $$('[data-close-dialog]').forEach(btn => btn.addEventListener('click', () => dialog.close()));
    $('#dialog-confirm')?.addEventListener('click', () => { if (dialogAction && dialogAction() !== false) dialog.close(); });
    dialog?.addEventListener('click', e => { if (e.target === dialog) { const b = dialog.getBoundingClientRect(); if(e.clientX<b.left||e.clientX>b.right||e.clientY<b.top||e.clientY>b.bottom) dialog.close(); } });
    $$('[data-confirm]').forEach(btn => btn.addEventListener('click', () => openDialog(btn.dataset.confirm,
        '<p>This action is a frontend preview. No records will be changed.</p>',
        () => window.showToast('Preview complete. No records were changed.'))));

    // Password visibility and common entry screens.
    $$('[data-password-toggle]').forEach(btn => btn.addEventListener('click', () => {
        const input = document.getElementById(btn.dataset.passwordToggle); const show = input.type === 'password';
        input.type = show ? 'text' : 'password'; btn.setAttribute('aria-pressed', String(show));
        btn.setAttribute('aria-label', `${show?'Hide':'Show'} password`); $('i',btn).className = `bi bi-eye${show?'-slash':''}`;
    }));
    $('[data-forgot-password]')?.addEventListener('click', () => openDialog('Forgot Password?', '<p>Password recovery will be available when account authentication is connected. For this preview, choose an account type below the login form.</p>'));
    $('[data-terms]')?.addEventListener('click', () => openDialog('Rental Terms Preview', '<p>Provide accurate account details, use a valid driving licence, and return the vehicle at the agreed time and location.</p><p>These are sample terms for the frontend demonstration. No agreement or account is created.</p>'));
    $('#login-form')?.addEventListener('submit', e => {
        e.preventDefault(); if (!e.currentTarget.reportValidity()) return;
        openDialog('Choose Your Account Type', `<p>Open a frontend preview of your DriveHub dashboard.</p><div class="form-actions"><a class="btn btn-primary" href="${context}/customer/dashboard">Customer</a><a class="btn btn-secondary" href="${context}/owner/dashboard">Vehicle Owner</a><a class="btn btn-secondary" href="${context}/admin/dashboard">Admin</a></div>`);
    });
    if ($('#account-type') && params.get('role') === 'owner') $('#account-type').value = 'owner';
    const register = $('#register-form');
    if (register) {
        const confirmation = $('#confirm-password');
        const checkPasswords = () => confirmation.setCustomValidity(confirmation.value && confirmation.value !== $('#register-password').value ? 'Passwords do not match.' : '');
        [$('#register-password'),confirmation].forEach(input => input.addEventListener('input',checkPasswords));
        register.addEventListener('submit', e => {
            e.preventDefault(); checkPasswords(); if (!register.reportValidity()) return;
            openDialog('Registration Preview Complete', '<p>Your form is valid. This frontend preview has not created an account.</p><p><a class="btn btn-primary" href="'+context+'/login">Back to Login</a></p>');
        });
    }

    // Local filtering and sorting reuse the existing vehicle module approach.
    $$('[data-filter-scope]').forEach(scope => {
        const items = $$('[data-filter-item]',scope); const container = $('[data-filter-items]',scope);
        const search = $('[data-filter-search]',scope); const filters = $$('[data-filter]',scope); const sorter = $('[data-sort]',scope);
        const pageSize = Number(scope.dataset.pageSize) || Number.MAX_SAFE_INTEGER;
        let page = 1; let tab = '';
        if (search && params.get('q')) search.value = params.get('q').slice(0,200);
        filters.forEach(control => { const initial = params.get(control.dataset.filter); if (initial && [...control.options].some(o=>o.value===initial)) control.value = initial; });
        function update(reset = false) {
            if (reset) page = 1;
            const term = search?.value.trim().toLowerCase() || '';
            let matching = items.filter(item => (!term || item.textContent.toLowerCase().includes(term)) && (!tab || item.dataset.status === tab) && filters.every(control=>!control.value || item.dataset[control.dataset.filter] === control.value));
            if (sorter && sorter.value !== 'default') matching.sort((a,b)=>(Number(a.dataset.price)-Number(b.dataset.price))*(sorter.value==='asc'?1:-1));
            const pages = Math.max(1,Math.ceil(matching.length/pageSize)); page = Math.min(page,pages);
            items.forEach(item => { item.hidden = true; });
            matching.forEach((item,i) => { item.hidden = i < (page-1)*pageSize || i >= page*pageSize; container.appendChild(item); });
            const empty = $('[data-filter-empty]',scope); if (empty) empty.hidden = matching.length !== 0;
            const count = $('[data-results-count]',scope);
            if(count) count.textContent = matching.length ? `Showing ${(page-1)*pageSize+1} to ${Math.min(page*pageSize,matching.length)} of ${matching.length} ${items[0]?.classList.contains('vehicle-card')?'vehicles':'results'}` : '0 results';
            const label=$('[data-page-label]',scope); if(label) label.textContent=String(page);
            const prev=$('[data-page-prev]',scope), next=$('[data-page-next]',scope);
            if(prev)prev.disabled=page===1; if(next)next.disabled=page===pages;
        }
        search?.addEventListener('input',()=>update(true)); filters.forEach(c=>c.addEventListener('change',()=>update(true))); sorter?.addEventListener('change',()=>update(true));
        $$('[data-tab]',scope).forEach(btn=>btn.addEventListener('click',()=>{
            tab=btn.dataset.tab; $$('[data-tab]',scope).forEach(b=>{ b.classList.toggle('active',b===btn); b.setAttribute('aria-pressed',String(b===btn)); }); update(true);
        }));
        $('[data-page-prev]',scope)?.addEventListener('click',()=>{page--;update();});
        $('[data-page-next]',scope)?.addEventListener('click',()=>{page++;update();});
        $$('[data-reset-filters]',scope).forEach(btn=>btn.addEventListener('click',()=>{
            if(search)search.value=''; filters.forEach(c=>c.value=''); if(sorter)sorter.value='default'; tab='';
            $$('[data-tab]',scope).forEach((b,i)=>{b.classList.toggle('active',i===0);b.setAttribute('aria-pressed',String(i===0));}); update(true); search?.focus();
        }));
        update();
    });

    function hydrateVehicle(v) {
        text('[data-vehicle-name]',v.name); text('[data-vehicle-brand]',v.brand); text('[data-vehicle-model]',v.model);
        text('[data-vehicle-type]',v.type); text('[data-vehicle-price]',money(v.price)); text('[data-vehicle-branch]',`${v.branch} Branch`);
        text('[data-vehicle-rating]',`${v.rating} (${v.reviews} reviews)`); text('[data-vehicle-transmission]',v.type==='Motorcycle'?'Manual':'Automatic');
        text('[data-vehicle-seats]',v.type==='Motorcycle'?'2':v.type==='Van'?'12':v.type==='SUV'?'7':'5');
        text('[data-vehicle-status]',role==='customer'?'Available':v.status);
        text('[data-vehicle-description]',`The ${v.name} offers a comfortable and smooth driving experience. Perfect for ${v.type==='Motorcycle'?'short trips and exploring the city':'city travel and long trips'} with excellent fuel efficiency and reliable performance.`);
        const branch=data.branches.find(b=>b.city===v.branch);
        text('[data-branch-address]',branch.address); text('[data-branch-phone]',branch.phone);
        const map=$('[data-map-link]'); if(map)map.href='https://www.google.com/maps/search/?api=1&query='+encodeURIComponent(branch.address);
        const rent=$('[data-rent-link]'); if(rent)rent.href=`${context}/customer/rentals/create?id=${v.id}`;
        const edit=$('[data-edit-vehicle-link]'); if(edit)edit.href=`${context}/${role}/vehicles/edit?id=${v.id}`;
        const back=$('[data-back-vehicle]'); if(back)back.href=`${context}/customer/vehicles/details?id=${v.id}`;
        const selected=$('[data-selected-photo]'); if(selected)selected.innerHTML=photoMarkup(v);
        const detail=$('[data-vehicle-details]');
        if(detail) {
            $$('[data-main-photo] .fleet-photo, .thumbnail .fleet-photo',detail).forEach(el=>{el.className=`fleet-photo photo-${v.id}`;el.setAttribute('aria-label',v.name);});
            $('[data-status-label]',detail).outerHTML=statusBadge(role==='customer'?'Available':v.status);
        }
    }
    if($('[data-vehicle-details]') || $('#rental-form')) hydrateVehicle(vehicle);
    $$('[data-thumbnail]').forEach(btn=>btn.addEventListener('click',()=>{
        $$('[data-thumbnail]').forEach(b=>{b.classList.toggle('selected',b===btn);b.setAttribute('aria-pressed',String(b===btn));});
        const main=$('[data-main-photo] .fleet-photo'); main.dataset.galleryPhoto=btn.dataset.thumbnail;
    }));

    // Form previews never call the existing CRUD endpoints.
    $$('[data-preview-form]').forEach(form=>form.addEventListener('submit',e=>{
        e.preventDefault(); if (!form.reportValidity()) return;
        window.showToast('Form preview complete. Your changes have not been saved.');
    }));
    const vehicleForm=$('[data-vehicle-form]');
    if(vehicleForm) {
        if(vehicleForm.dataset.edit==='true') {
            for(const [id,value] of Object.entries({brand:vehicle.brand,model:vehicle.model,type:vehicle.type,price:vehicle.price,branch:vehicle.branch+' Branch',availability:vehicle.status})) document.getElementById(id).value=value;
            $$('[data-upload-preview]').forEach(el=>el.innerHTML=photoMarkup(vehicle));
        }
        function updatePreview() {
            text('[data-preview-name]',[$('#brand').value.trim(),$('#model').value.trim()].filter(Boolean).join(' ')||'Vehicle Name');
            text('[data-preview-type]',$('#type').value||'Type'); text('[data-preview-price]',money(Math.max(0,Number($('#price').value)||0)));
            text('[data-preview-branch]',$('#branch').value||'Branch');
            const b=$('.vehicle-preview [data-status-label], .vehicle-preview .badge'); if(b)b.outerHTML=statusBadge($('#availability').value);
        }
        vehicleForm.addEventListener('input',updatePreview); vehicleForm.addEventListener('change',updatePreview); updatePreview();
    }
    let uploadedUrl;
    function previewImage(file,profile=false) {
        if(!file)return;
        const allowed=profile?['image/jpeg','image/png']:['image/jpeg','image/png','image/webp']; const limit=profile?2:10;
        if(!allowed.includes(file.type) || file.size>limit*1024*1024) { window.showToast(`Choose a ${profile?'JPG or PNG':'JPG, PNG or WEBP'} image up to ${limit}MB.`); return; }
        if(uploadedUrl)URL.revokeObjectURL(uploadedUrl); uploadedUrl=URL.createObjectURL(file);
        const targets=profile?$$('[data-profile-photo]'):$$('[data-upload-preview]');
        targets.forEach(el=>{const img=document.createElement('img');img.src=uploadedUrl;img.alt=profile?'Selected profile photo':'Selected vehicle image';el.replaceChildren(img);});
        text('[data-image-feedback]',file.name+' — preview only');
    }
    $('[data-image-input]')?.addEventListener('change',e=>previewImage(e.target.files[0]));
    $('[data-profile-input]')?.addEventListener('change',e=>previewImage(e.target.files[0],true));
    $('[data-remove-image]')?.addEventListener('click',()=>{
        $$('[data-upload-preview]').forEach(el=>el.innerHTML='<div class="vehicle-preview-icon"><i class="bi bi-car-front-fill" aria-hidden="true"></i></div>');
        $('[data-image-input]').value=''; text('[data-image-feedback]','Image removed from preview only.'); if(uploadedUrl)URL.revokeObjectURL(uploadedUrl);
    });
    const drop=$('[data-drop-zone]');
    if(drop) {
        drop.addEventListener('keydown',e=>{if(['Enter',' '].includes(e.key)){e.preventDefault();$('[data-image-input]').click();}});
        ['dragenter','dragover'].forEach(event=>drop.addEventListener(event,e=>{e.preventDefault();drop.classList.add('drag-over');}));
        ['dragleave','drop'].forEach(event=>drop.addEventListener(event,e=>{e.preventDefault();drop.classList.remove('drag-over');}));
        drop.addEventListener('drop',e=>previewImage(e.dataTransfer.files[0]));
    }
    window.addEventListener('pagehide',()=>{if(uploadedUrl)URL.revokeObjectURL(uploadedUrl);});

    const rentalForm=$('#rental-form');
    if(rentalForm) {
        let currentStep=1;
        function totals() {
            const start=Date.parse($('#pickup-date').value+'T'+$('#pickup-time').value);
            const end=Date.parse($('#return-date').value+'T'+$('#return-time').value);
            const days=Number.isFinite(end-start)&&end>start?Math.ceil((end-start)/86400000):0;
            const insurance=$('#insurance').checked?2000:0; return {days,subtotal:days*vehicle.price,insurance,total:days*vehicle.price+insurance};
        }
        function calculate() {
            const t=totals(); text('#rental-days',t.days); text('#rental-subtotal','Rs. '+money(t.subtotal)); text('#insurance-price','Rs. '+money(t.insurance)); text('#rental-total','Rs. '+money(t.total));
            $('#return-date').min=$('#pickup-date').value;
            $('#return-date').setCustomValidity(t.days?'':'Return date and time must be after pick-up.');
            text('#rental-error',t.days?'':'Choose a return date and time after pick-up.');
            if(currentStep===3) showStep(3);
        }
        function showStep(step) {
            currentStep=step;
            $$('[data-booking-step]').forEach(panel=>{
                const active=Number(panel.dataset.bookingStep)===step; panel.hidden=!active;
                $$('input,select,textarea',panel).forEach(input=>input.disabled=!active);
            });
            $$('[data-step-marker]').forEach(marker=>{const active=Number(marker.dataset.stepMarker)===step;marker.classList.toggle('active',active);if(active)marker.setAttribute('aria-current','step');else marker.removeAttribute('aria-current');});
            $('#booking-back').hidden=step===1; $('#booking-next').innerHTML=step===1?'Next: Customer Details <i class="bi bi-arrow-right" aria-hidden="true"></i>':step===2?'Next: Confirmation <i class="bi bi-arrow-right" aria-hidden="true"></i>':'Submit Rental Request';
            if(step===3){const pairs=[['Vehicle',vehicle.name],['Customer',$('#renter-name').value],['Pick-up',$('#pickup-date').value+' '+$('#pickup-time').value],['Return',$('#return-date').value+' '+$('#return-time').value],['Pick-up Location',$('#pickup-location').value],['Total Amount','Rs. '+money(totals().total)]];$('#booking-review').innerHTML=pairs.map(([k,v])=>`<div><dt>${escape(k)}</dt><dd>${escape(v)}</dd></div>`).join('');}
        }
        rentalForm.addEventListener('change',calculate);
        $('#booking-back').addEventListener('click',()=>showStep(currentStep-1));
        rentalForm.addEventListener('submit',e=>{
            e.preventDefault(); calculate(); if(!rentalForm.reportValidity() || totals().days===0)return;
            if(currentStep<3){showStep(currentStep+1);return;}
            const query=new URLSearchParams({id:vehicle.id,pickup:$('#pickup-date').value,pickupTime:$('#pickup-time').value,return:$('#return-date').value,returnTime:$('#return-time').value,insurance:String($('#insurance').checked)});
            location.assign(`${context}/customer/rentals/confirmation?${query}`);
        });
        $('#pickup-location').value=vehicle.branch+' Branch'; calculate(); showStep(1);
    }
    if(document.body.dataset.page==='rentalConfirmation') {
        const validDate = (value,fallback) => /^\d{4}-\d{2}-\d{2}$/.test(value||'') && Number.isFinite(Date.parse(value)) ? value : fallback;
        const validTime = (value) => /^([01]\d|2[0-3]):[0-5]\d$/.test(value||'')?value:'10:00';
        const start=validDate(params.get('pickup'),'2026-10-18'),end=validDate(params.get('return'),'2026-10-21');
        const st=validTime(params.get('pickupTime')),et=validTime(params.get('returnTime'));
        const days=Math.max(1,Math.ceil((Date.parse(end+'T'+et)-Date.parse(start+'T'+st))/86400000));
        const format=(d,t)=>new Date(d+'T'+t).toLocaleString('en-US',{month:'short',day:'numeric',year:'numeric',hour:'numeric',minute:'2-digit'});
        text('[data-confirm-vehicle]',vehicle.name);text('[data-confirm-pickup]',format(start,st));text('[data-confirm-return]',format(end,et));
        text('[data-confirm-total]','Rs. '+money(days*vehicle.price+(params.get('insurance')==='false'?0:2000)));
    }
    if($('[data-customer-rental-details]')) {
        const r=data.myRentals.find(r=>r.id===Number(params.get('id')))||data.myRentals[0]; const v=data.fleet[r.vehicle-1];
        $('[data-rental-photo]').innerHTML=photoMarkup(v);text('[data-rental-vehicle]',v.name);text('[data-rental-branch]',v.branch+' Branch');
        $('[data-rental-status]').innerHTML=statusBadge(r.status);text('[data-rental-id]',`DRH-20261018-00${r.id}`);text('[data-rental-start]',r.start);text('[data-rental-end]',r.end);text('[data-rental-amount]','Rs. '+money(r.amount));
        $('[data-rental-cancel]').hidden=r.status!=='Pending'; const book=$('[data-rental-book-again]');book.hidden=r.status!=='Completed';book.href=`${context}/customer/rentals/create?id=${v.id}`;
    }
    $$('[data-rental-details]').forEach(btn=>btn.addEventListener('click',()=>{
        const r=data.rentals.find(r=>r.id===Number(btn.dataset.rentalDetails));
        openDialog('Rental Request Details',detailList([['Rental ID',`DRH-202610${15-r.id}-00${r.id}`],['Vehicle',data.fleet[r.vehicle-1].name],['Customer',r.name],['Start Date',r.start],['End Date',r.end],['Total','Rs. '+money(r.amount)],['Status',r.status]])+(role==='owner'&&r.status==='Pending'?'<div class="form-actions"><button type="button" class="btn btn-danger-soft" id="reject-rental">Reject</button><button type="button" class="btn btn-primary" id="approve-rental">Approve</button></div>':''));
        ['approve','reject'].forEach(action=>$('#'+action+'-rental')?.addEventListener('click',()=>{dialog.close();window.showToast(`${action==='approve'?'Approval':'Rejection'} preview complete. The request has not been changed.`);}));
    }));
    $$('[data-payment-details]').forEach(btn=>btn.addEventListener('click',()=>{
        const p=data.payments.find(p=>p.id===Number(btn.dataset.paymentDetails));
        openDialog('Payment Details',detailList([['Payment ID',`PAY-20261010-00${p.id}`],['Date',p.date],['Customer',role==='customer'?'Mathushalini.T':p.customer],['Vehicle',data.fleet[p.vehicle-1].name],['Amount','Rs. '+money(p.amount)],['Method',p.method],['Status',p.status]])+'<p class="preview-note">Sample payment record. No payment has been processed.</p>');
    }));

    // Review stars use native radio controls, so keyboard interaction is supported.
    const reviewForm=$('[data-review-form]');
    if(reviewForm) {
        if(reviewForm.dataset.edit==='true') { const r=data.reviewData.find(r=>r.id===Number(params.get('id')))||data.reviewData[0];$('#review-vehicle').value=String(r.vehicle);$('#review-comment').value=r.comment;$(`input[name="rating"][value="${r.rating}"]`).checked=true; }
        function updateStars(){const value=Number($('input[name="rating"]:checked')?.value)||0;$$('.star-input label').forEach((label,i)=>label.classList.toggle('filled',i<value));text('[data-rating-label]',value?`${value} out of 5`:'Choose a rating');}
        $$('input[name="rating"]').forEach(input=>input.addEventListener('change',updateStars));updateStars();
    }
    $$('[data-review-details]').forEach(btn=>btn.addEventListener('click',()=>{
        const r=data.adminReviews[Number(btn.dataset.reviewDetails)];openDialog('Customer Review',detailList([['Customer',r[0]],['Vehicle',data.fleet[r[1]-1].name],['Rating',r[2]+' out of 5'],['Comment',r[3]],['Status',r[4]]]));
    }));
    const branchForm=$('[data-branch-form]'),branchDetails=$('[data-branch-details]');
    if(branchForm?.dataset.edit==='true'||branchDetails){
        const b=data.branches.find(b=>b.id===Number(params.get('id')))||data.branches[0];
        if(branchForm)for(const [id,value] of Object.entries({'branch-name':b.name,'branch-city':b.city,'branch-address':b.address,'branch-phone':b.phone,'branch-status':b.status}))document.getElementById(id).value=value;
        if(branchDetails){for(const key of ['name','city','address','phone','count'])text(`[data-branch-${key}]`,b[key]);$('[data-branch-status]').innerHTML=statusBadge(b.status);$('[data-branch-edit]').href=`${context}/admin/branches/edit?id=${b.id}`;$('[data-branch-vehicles]').href=`${context}/admin/vehicles?branch=${encodeURIComponent(b.name)}`;}
    }
    function userForm(index) {
        const user=index===undefined?['','','Customer','','Active']:data.users[index];
        const input=(label,id,value,type='text')=>`<div class="form-group"><label for="${id}">${label} *</label><input class="form-control" id="${id}" type="${type}" value="${escape(value)}" required></div>`;
        openDialog(index===undefined?'Add User':'Edit User',`<form id="user-preview-form" onsubmit="return false"><div class="form-grid">${input('Full Name','dialog-name',user[0])}${input('Email','dialog-email',user[1],'email')}${input('Phone','dialog-phone',user[3],'tel')}<div class="form-group"><label for="dialog-role">Role</label><select class="form-select" id="dialog-role">${['Customer','Owner','Admin'].map(r=>`<option ${r===user[2]?'selected':''}>${r}</option>`).join('')}</select></div><div class="form-group"><label for="dialog-status">Status</label><select class="form-select" id="dialog-status"><option>Active</option><option ${user[4]==='Inactive'?'selected':''}>Inactive</option></select></div></div></form><p class="preview-note">Frontend preview only. This will not save a user account.</p>`,()=>{if(!$('#user-preview-form').reportValidity())return false;window.showToast('User form preview complete. No account was saved.');},index===undefined?'Save User':'Update User');
    }
    $('[data-user-add]')?.addEventListener('click',()=>userForm());
    $$('[data-user-edit]').forEach(btn=>btn.addEventListener('click',()=>userForm(Number(btn.dataset.userEdit))));
})();
