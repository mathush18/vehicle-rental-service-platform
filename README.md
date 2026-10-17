# DriveHub — Vehicle Rental Service

The complete Task 1 frontend is available in this Spring Boot / JSP / Java 21 / Maven WAR project.

- Start with `./mvnw.cmd spring-boot:run` on Windows with JDK 21 selected.
- Open http://localhost:8080/login, then choose Customer, Vehicle Owner or Admin.
- Read [the complete Task 1 handoff](FRONTEND-TASK1.md) for all pages, routes, changed files, verification and backend integration notes.
- This role-based UI uses frontend sample data. Saving, login, booking, payment and moderation actions are previews.
- The original backend/member files are preserved; no Git operation or data-file update was performed.

---

The following scaffold notes are historical and describe the earlier project stage. The handoff above is the current implementation reference.

# Vehicle Rental Service Platform

University team project: structure only. Planned stack: Java 21, Spring Boot,
Maven, JSP, HTML, CSS, and JavaScript. No database.

This scaffold contains placeholder pages, shared fragments, and empty data files.
It is not yet runnable: build configuration and application bootstrap are deferred.
No controllers, services, authentication, CRUD, file handling, booking calculations,
or payment integration are implemented.

## Team ownership

JSP paths below are relative to src/main/webapp/WEB-INF/views/.
Member 6 coordinates common UI; shared files belong to the full team.
Coordinate major visual changes and use one common design system.
Members own page content, not separate styles or scripts.

| Member | Owned pages | Planned future classes (not implemented) |
| --- | --- | --- |
| 1 | user/* | User, Customer, Admin, UserService, UserController |
| 2 | vehicle/* | Vehicle, Car, Van, Motorcycle, VehicleService, VehicleController |
| 3 | rental/* | Rental, RentalService, RentalController |
| 4 | payment/* | Payment, CashPayment, CardPayment, PaymentService, PaymentController |
| 5 | branch/* | Branch, BranchService, BranchController |
| 6 | review/*, common/*, index.jsp, dashboard.jsp | Review, ReviewService, ReviewController |

## Shared structure

Full pages include the common navbar, messages, footer, and shared CSS/JS.
Administration placeholders also include the common sidebar.
Dashboard cards deliberately contain no values.
Forms, tables, and controls are represented by headings and JSP comments.

Navigation uses # with aria-disabled="true" for planned destinations.
These are structural placeholders, not working routes or access controls.
JSP pages under WEB-INF cannot be opened directly through a browser URL.
Future Spring MVC routes must render these views; do not link directly to WEB-INF.
Static asset references use the application context path for later deployment.

Member 6 coordinates static/css/style.css and static/js/app.js.
Both files contain only shared ownership comments.

## Reserved folders

The model, service, controller, and util packages contain no Java code.
Image folders reserve space for vehicles, users, and common assets.
.gitkeep files preserve otherwise empty folders in Git.
The six data/*.txt files are empty; do not add sample data at this stage.
