# DriveHub — Task 1 frontend handoff

Task 1 is complete. The common, Customer, Vehicle Owner and Admin frontend pages use the existing Spring Boot/JSP/WAR stack. Task 2 has not been started.

## Pages and routes

40 JSP pages were created: 3 common, 13 Customer, 9 Vehicle Owner and 15 Admin. The root URL also displays Login. All primary demo account names are **Mathushalini.T**.

### Common

| Page | GET route | JSP under WEB-INF/views |
| --- | --- | --- |
| Login | `/login` | `auth/login.jsp` |
| Register | `/register` | `auth/register.jsp` |
| User Guide | `/instructions` | `auth/instructions.jsp` |

### Customer

| Page | GET route | JSP under WEB-INF/views |
| --- | --- | --- |
| Dashboard | `/customer/dashboard` | `customer/dashboard.jsp` |
| Browse Vehicles | `/customer/vehicles` | `customer/vehicles.jsp` |
| Vehicle Details | `/customer/vehicles/details` | `customer/vehicleDetails.jsp` |
| Create Rental | `/customer/rentals/create` | `customer/createRental.jsp` |
| Rental Confirmation | `/customer/rentals/confirmation` | `customer/rentalConfirmation.jsp` |
| My Rentals | `/customer/rentals` | `customer/myRentals.jsp` |
| Rental Details | `/customer/rentals/details` | `customer/rentalDetails.jsp` |
| Payments | `/customer/payments` | `customer/payments.jsp` |
| My Reviews | `/customer/reviews` | `customer/reviews.jsp` |
| Add Review | `/customer/reviews/add` | `customer/addReview.jsp` |
| Edit Review | `/customer/reviews/edit` | `customer/editReview.jsp` |
| Our Branches | `/customer/branches` | `customer/branches.jsp` |
| Profile Settings | `/customer/profile` | `customer/profile.jsp` |

### Vehicle Owner

| Page | GET route | JSP under WEB-INF/views |
| --- | --- | --- |
| Dashboard | `/owner/dashboard` | `owner/dashboard.jsp` |
| My Vehicles | `/owner/vehicles` | `owner/myVehicles.jsp` |
| Vehicle Details | `/owner/vehicles/details` | `owner/vehicleDetails.jsp` |
| Add New Vehicle | `/owner/vehicles/add` | `owner/addVehicle.jsp` |
| Edit Vehicle | `/owner/vehicles/edit` | `owner/editVehicle.jsp` |
| Rental Requests | `/owner/rental-requests` | `owner/rentalRequests.jsp` |
| Payments | `/owner/payments` | `owner/payments.jsp` |
| Earnings & Payments | `/owner/earnings` | `owner/earnings.jsp` |
| Profile Settings | `/owner/profile` | `owner/profile.jsp` |

### Admin

| Page | GET route | JSP under WEB-INF/views |
| --- | --- | --- |
| Dashboard | `/admin/dashboard` | `admin/dashboard.jsp` |
| Manage Vehicles | `/admin/vehicles` | `admin/vehicles.jsp` |
| Vehicle Details | `/admin/vehicles/details` | `admin/vehicleDetails.jsp` |
| Add New Vehicle | `/admin/vehicles/add` | `admin/addVehicle.jsp` |
| Edit Vehicle | `/admin/vehicles/edit` | `admin/editVehicle.jsp` |
| Manage Rentals | `/admin/rentals` | `admin/rentals.jsp` |
| Manage Payments | `/admin/payments` | `admin/payments.jsp` |
| Admin Profile | `/admin/profile` | `admin/profile.jsp` |
| Manage Users | `/admin/users` | `admin/users.jsp` |
| Manage Branches | `/admin/branches` | `admin/branches.jsp` |
| Add Branch | `/admin/branches/add` | `admin/addBranch.jsp` |
| Edit Branch | `/admin/branches/edit` | `admin/editBranch.jsp` |
| Branch Details | `/admin/branches/details` | `admin/branchDetails.jsp` |
| Manage Reviews | `/admin/reviews` | `admin/reviews.jsp` |
| Reports & Analytics | `/admin/reports` | `admin/reports.jsp` |

## Shared implementation

- Changed shared JSPs: `common/navbar.jsp`, `sidebar.jsp`, `footer.jsp`, `messages.jsp`. Added `common/head.jsp`. The sidebar is role-aware and marks exactly one current link. No backend permissions are implied by the role display.
- CSS added under `static/css/modules/`: `frontend.css`, `auth.css`, `customer.css`, `owner.css`, `admin.css`. The existing `style.css`, `layout.css`, `components.css`, and all six existing module styles are unchanged. Shared reference styling is scoped to `.drivehub` and is not duplicated across role styles.
- JavaScript: enhanced `static/js/app.js`; added `demo-data.js` and `frontend.js`. Vanilla JavaScript only; no framework, fake API, browser persistence, or new application dependency.
- Added `PageController.java` with 47 GET-only page mappings (38 role/instructions mappings and 9 compatibility/root mappings). Changed only the returned view in the existing GET `/login`, `/register`, and `/vehicles` methods. No new POST, PUT or DELETE endpoints.
- Legacy compatibility routes: `/`, `/dashboard`, `/vehicles`, `/vehicles/add`, `/vehicles/edit`, `/vehicles/details`, `/rentals`, `/payments`, `/branches`, `/reviews`.
- Reused existing shared design tokens, button/card/form/table/badge class system, sidebar overlay pattern, toast/modal helpers and local vehicle-filter approach. Existing member-owned JSPs and model/service implementations are preserved.
- Local Bootstrap Icons 1.11.3 assets avoid a runtime CDN dependency. See [asset notes](docs/ASSET-NOTES.md) for reference images, generated assets and exact prompts.

## Frontend interactions

Login role previews; password visibility; registration validation; mobile navigation; global search; role-specific dropdowns; vehicle search/type/branch/availability filtering and price sorting; selected vehicle details; gallery crop selection; form and image previews; three-step rental calculation and confirmation; rental status tabs; selected rental/payment dialogs; review star ratings; admin user form dialogs; table pagination; branch filtering and forms; moderation/approval/delete confirmation previews; profile photo preview.

Actions which would change business records explicitly say that they are previews. Forms cannot fall back to submitting credentials or records when JavaScript is unavailable. Booking state is carried only in the confirmation URL, with no personal information in that URL. Sample data has the requested JSP mock-data comment.

## Visual and responsive verification

The four supplied UI references were followed as closely as practical: compact sidebar, light top navigation, blue/purple active states, navy vehicle banners, white cards, summary tiles, filters, tables, forms, rounded status badges and role-specific page structure. The generated photographic assets reproduce the reference subject/style without embedding UI text. This is not a claim of pixel-identical photography.

- **164 page/viewport checks passed:** root plus all 40 pages at **1440, 1024, 768 and 390 px**.
- **104 internal links** and **12 shared CSS/JavaScript URLs** returned HTTP 200.
- No page-level horizontal overflow, missing active state, broken image elements, or browser JavaScript errors were found. Tables have controlled horizontal scrolling on small screens.
- All JSPs were compiled by Jasper during actual browser requests. This checks JSP includes beyond what Maven packaging alone verifies.
- **21 interaction groups passed**. No POST/PUT/DELETE request was issued during those browser tests.
- Keyboard Escape, mobile overlay close, native labels/radio controls, focus styles, form validation, image type/size checks and modal behavior were checked.
- Visual screenshots are in the workspace's `../.codex-work/screenshots/`. JSON evidence is in [route checks](docs/frontend-route-checks.json) and [interaction checks](docs/frontend-interaction-checks.json).
- A final 40-check layout/asset pass verified all four widths after the image and encoding corrections. Branch filtering, image rejection, and booking totals on the confirmation step also passed.
- The final executable WAR was tested on Java 21 at the non-root context path `/drivehub`: all 41 primary/root routes and 9 compatibility routes returned HTTP 200. Browser navigation from filtered vehicles through details to booking also passed, with no missing assets or JavaScript errors. See [packaged WAR evidence](docs/frontend-war-check.json).

## Maven and local startup

Maven `package` succeeds in the original project. Java 21 `clean package` succeeds in an isolated source copy. The original project's first `clean` attempt was blocked by a pre-existing Windows ACL denying deletion of an old directory under `target`; no source change or permission change was used to bypass that ACL. `pom.xml` and `application.properties` are unchanged.

Use JDK 21 and run from the project directory:

```powershell
.\mvnw.cmd spring-boot:run
```

Then open **http://localhost:8080/login**. The Customer / Vehicle Owner / Admin cards open the three frontend previews. The guide is **http://localhost:8080/instructions**.

A JDK 21 used for verification is available locally at:
`../.codex-work/jdk21/jdk-21.0.12.1+1`.

If the computer's default Java is not 21, select the verified local JDK before starting:

```powershell
$env:JAVA_HOME = (Resolve-Path '..\.codex-work\jdk21\jdk-21.0.12.1+1').Path
.\mvnw.cmd spring-boot:run
```

The final Java 21 WAR was copied back to `target/vehicle-rental-service-platform-0.0.1-SNAPSHOT.war`. Temporary QA servers have been stopped.

## Preservation and remaining integration

The before/after SHA-256 audit confirms that all six `data/*.txt` files, all existing models/services, all existing module JSPs, `pom.xml`, `application.properties`, and original CSS files are unchanged. No original files were removed. Only the three existing view-only GET return values, the shared JSPs and `app.js` changed among existing application files. New files supply the role-based frontend. See [preservation evidence](docs/frontend-preservation-check.json).

**No real CRUD, .txt handling, authentication backend, sessions, security, database, service business logic, real booking or payment processing was implemented by Task 1. No Git operations were performed.** The pre-existing UserController/UserService backend is retained, but these frontend pages do not submit to its write endpoints.

Backend integration remains for login/registration and role authorization, model binding/JSTL records, persisted forms, vehicle image storage, rental creation and status updates, payment handling, user/branch/review management, durable profile updates, and real report calculations. Preview role navigation is not an authorization boundary.
