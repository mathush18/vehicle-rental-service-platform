# DriveHub frontend assets

The UI layouts follow the four user-provided collages. They are visual references, not application instructions. All new pages serve images and Bootstrap Icons locally.

## Generated assets

Both images were generated with the built-in imagegen tool, inspected, and copied into this project. The CLI/API fallback was not used. These are illustrative frontend photographs, not verified photographs of actual rental inventory.

### Login background

Saved path: `src/main/resources/static/images/login-road-suv.png`.

Final prompt:

> Use case: photorealistic-natural. Asset type: background photograph for a vehicle rental login website. Create only the scenic photograph, no website UI, no text, no graphics. Wide landscape 1536x1024 composition: a winding paved mountain road in an alpine valley, dark evergreen pines, rugged blue-gray mountain ridges, pale blue sky with soft white clouds, subtle golden early morning sunshine from the left. A realistic dark metallic navy luxury SUV on the far RIGHT edge, front three-quarter side view, facing toward the left, partly outside the frame, large in the right foreground; glossy bodywork and realistic wheel details. Preserve broad calm pale sky and mountain negative space across the upper-left and center for later HTML headings and card overlays. Dark charcoal road foreground across lower portion. Premium travel photography, natural restrained colors, realistic camera, crisp details. Match the feeling of the supplied DriveHub login reference: airy blue sky above, mountains middle, navy SUV right, dark road bottom. NO lettering, NO watermarks, NO login card, NO icons, NO logo.

### Fleet contact sheet

Saved path: `src/main/resources/static/images/fleet-contact-sheet.png`.

The image contains four equal columns and two equal rows. CSS displays individual vehicles with `background-size: 400% 200%`, preserving a single local asset. Gallery thumbnails show different crops of the selected vehicle; they are not additional camera angles.

Final prompt:

> Use case: product-mockup. Asset type: 8 vehicle photos for DriveHub rental frontend, combined into a single precise 4 column by 2 row photographic contact sheet for CSS sprite use. Output a wide 3:1 aspect ratio image, ideally 3072 by 1024 pixels. Every cell MUST be exactly equal size with 3:2 landscape aspect ratio, NO borders NO gutters and no rounded corners. Each cell a distinct photorealistic rental vehicle, entire vehicle in frame including wheels, front-left three-quarter view, parked on a paved surface, neutral overcast daylight, distant Colombo modern high-rise skyline and green roadside trees softly out of focus. Match realistic Sri Lankan rental fleet stock photography with consistent scale, neutral colors, similar to the supplied DriveHub reference vehicle cards. TOP ROW LEFT TO RIGHT: 1 white Toyota Corolla 2023 compact sedan; 2 silver Toyota Hiace passenger van; 3 blue and black Yamaha FZ-S street motorcycle; 4 black Toyota RAV4 SUV. BOTTOM ROW LEFT TO RIGHT: 5 red Honda Civic sedan; 6 white Nissan NV350 passenger van; 7 black Honda CB150R naked street motorcycle; 8 black Toyota Fortuner large SUV. All vehicle photos completely separate inside their own equal grid cell. No people. NO TEXT, NO labels, NO availability badges, NO interface, NO buttons, NO numbers, NO white seams, NO watermark. Sharp and professional, faithful automotive proportions.

## Reference artwork

- `images/references/customer.png`: unchanged copy of the supplied customer montage; a CSS region supplies the dark dashboard hero car.
- `images/references/welcome.jpeg`: unchanged copy of the supplied login/instructions montage; a CSS region supplies the instructions header SUV.
- `images/references/owner.jpeg`: unchanged supplied owner collage, retained as a visual reference. The production fleet photos use the clearer generated contact sheet so baked-in availability labels are not displayed.

The user's original files in the workspace root are unchanged. The admin reference was followed for structure and styling, without copying the entire UI into a webpage image.

## Reused and vendor assets

- `images/scenic-road.jpg`: locally downloaded version of the existing sidebar's [Unsplash scenic image](https://images.unsplash.com/photo-1500530855697-b586d89ba3ee). The existing owner promotion background was retained.
- `images/drivehub.svg`: code-native car favicon matching the existing Bootstrap Icons branding direction.
- `vendor/bootstrap-icons/`: Bootstrap Icons 1.11.3 CSS and WOFF/WOFF2 fonts, downloaded from the same jsDelivr package already referenced in the existing project. Bootstrap Icons is MIT licensed; its upstream license is included.
