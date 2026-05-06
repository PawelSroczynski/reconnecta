# Reconnecta Basemap

Geospatial basemap for the Reconnecta land at Nadadouro, Portugal — commissioned from [Regrarians Basemaps](https://basemaps.regrarians.org/) and delivered on **2026-04-18**.

> Filenames in the delivery use the spelling *Recontecta* (sic). They are kept as delivered to preserve traceability with the Regrarians order. The project itself is *Reconnecta*.

---

## What is in this directory

```
basemap/
├── README.md          ← this file
├── Boundaries/        ← project boundary as KML + QGIS metadata
├── DTM/               ← Digital Terrain Model (GeoTIFF, source raster)
├── Legends/           ← Google Earth legend (KMZ + display-quality settings)
└── KMZ/               ← 60 layers ready to open in Google Earth
```

**Total: 66 files · 130 MB.** All data is for the parcel and its immediate surroundings.

---

## How to use it

The fastest way to read the land is **Google Earth** (Pro or Web).

1. Install Google Earth Pro (free, desktop). The web version handles most KMZ but not all.
2. **Tune Google Earth's display settings first** (otherwise legends and labels look poor). See `Legends/Google_Earth_Legend_Settings.png` — turn on:
   - **Texture Colors:** True Color (32 bit)
   - **Anisotropic Filtering:** High
   - **Labels/Icon Size:** Medium or Large
   - **Use high quality terrain:** ON
   - **Elevation Exaggeration:** ~1.5
3. Open `Legends/Legends.kmz` once — keeps the colour ramps for every layer accessible from the sidebar.
4. Open any layer from `KMZ/` — they overlay onto the same boundary.
5. Open the boundary `Boundaries/PT_Recontecta_Roztocki.kml` to see the parcel outline.

For deeper analysis (resampling, derived rasters, slope class re-binning, custom planning overlays), open `DTM/PT_Recontecta_Roztocki.tif` in [QGIS](https://qgis.org/) — it's a GeoTIFF, georeferenced.

---

## Bounds

The parcel sits at **39.42 °N, –9.19 °W** (approximate centre), roughly 1 km from Óbidos Lagoon. The KML polygon defines a rectangular study area covering the parcel and a buffer of immediate surroundings.

| Property | Value |
|---|---|
| Bounding box (lat, lon) | 39.4172 – 39.4290 N · –9.2016 – –9.1869 W |
| Source DTM elevation range | 3.73 – 59.89 m a.s.l. |
| DTM mean elevation | 34.09 m |
| DTM coverage | 97.02% valid pixels |

These match the project's own description (Hotel zone ~27–37 m, lower stream zone ~24–27 m).

---

## Layers in `KMZ/` — what they show

### Terrain & form

| File | What it shows |
|------|---------------|
| `…Elevation.kmz` / `…Elevation_Relief.kmz` | Raw DEM colour ramp · Relief = same with hillshade blended in |
| `…Hillshade.kmz` | Shaded relief — read the topography at a glance |
| `…Aspect.kmz` | Slope direction (0–360°) for every cell |
| `…Aspect_<direction>_<deg_range>.kmz` (×8) | Pre-filtered slices: pick a single aspect window (e.g. SW-facing slopes only) |
| `…Contours_0.5m.kmz` / `…_1m.kmz` / `…_2m.kmz` / `…_5m.kmz` | Contour lines at 4 intervals — pick the resolution that suits the zoom |

### Landforms (Geomorphons classification)

Ten classes following the Geomorphons algorithm. Each class is delivered twice — raw boundaries (`…_Class_X_<name>.kmz`) and the same overlaid on hillshade (`…_Relief.kmz`):

| Class | Name |
|-------|------|
| 1 | Flat |
| 2 | Peak |
| 3 | Ridge |
| 4 | Shoulder |
| 5 | Spur |
| 6 | Slope |
| 7 | Hollow |
| 8 | Footslope |
| 9 | Valley |
| 10 | Pit |

Plus aggregate views:
- `…Landforms_RL100.kmz` — all classes at lookup-radius 100 m (broader features)
- `…Landforms_RL1000.kmz` — same at 1 km lookup (regional context)
- `…Landforms_RL1000_Relief.kmz` — RL1000 over hillshade

### Water

| File | What it shows |
|------|---------------|
| `…Drainage.kmz` | Flow accumulation lines — where water collects and runs |
| `…Flow_Velocity.kmz` / `…_Relief.kmz` | Modelled velocity per cell (high = erosion risk) |
| `…Inundations.kmz` | Modelled flood / pooling zones |
| `…Erosion.kmz` / `…_Relief.kmz` | Erosion risk surface |

### Watersheds (Hydrobasins)

Sub-catchment boundaries at six nesting levels — pick the granularity:

| File | Scale |
|------|-------|
| `…Hydrobasins_Xlarge.kmz` | Largest catchments containing the parcel |
| `…Hydrobasins_Large.kmz` | Sub-watershed |
| `…Hydrobasins_Medium.kmz` | Local watershed |
| `…Hydrobasins_Small.kmz` | Sub-local |
| `…Hydrobasins_Micro.kmz` | On-parcel micro-catchments |

Each is delivered as raster polygons (filled), `_Relief` (overlaid on hillshade), and `Vector_<size>` (clean polygon outlines for export).

---

## Files outside `KMZ/`

| Path | Purpose |
|------|---------|
| `Boundaries/PT_Recontecta_Roztocki.kml` | Parcel boundary polygon (study-area rectangle) |
| `Boundaries/PT_Recontecta_Roztocki.qmd` | QGIS sidecar metadata |
| `DTM/PT_Recontecta_Roztocki.tif` | Source Digital Terrain Model — GeoTIFF, the raster behind every derived layer |
| `DTM/PT_Recontecta_Roztocki.tif.aux.xml` | GDAL statistics sidecar |
| `Legends/Legends.kmz` | All colour-ramp legends loaded as a single KMZ |
| `Legends/Google_Earth_Legend_Settings.png` | Recommended Google Earth display config for legible legends |

---

## Reading order — first time on this data

If you have an hour with this data and have never seen the parcel, this is a useful sequence:

1. **Boundary** — open `Boundaries/PT_Recontecta_Roztocki.kml`. Sets your viewport.
2. **Hillshade** — `KMZ/…Hillshade.kmz`. Fastest way to read shape of the land.
3. **Contours 1m** — `KMZ/…Contours_1m.kmz`. Numerical slope intuition.
4. **Aspect** — `KMZ/…Aspect.kmz`. Where the sun lands; orient buildings, food forest.
5. **Landforms RL100** — `KMZ/…Landforms_RL100.kmz`. Auto-classified shoulder/footslope/valley boundaries — surprisingly accurate.
6. **Drainage + Hydrobasins Micro** — `KMZ/…Drainage.kmz` + `KMZ/…Hydrobasins_Micro.kmz`. The water story.
7. **Inundations + Flow Velocity** — `KMZ/…Inundations.kmz` + `KMZ/…Flow_Velocity.kmz`. Where to slow water down, where to be careful.
8. **Erosion** — `KMZ/…Erosion.kmz`. Where to *not* break ground.

---

## Provenance

- **Provider:** [Regrarians Basemaps](https://basemaps.regrarians.org/)
- **Order date:** 2026-04-18
- **Delivery format:** Google Earth KMZ + GeoTIFF DTM + KML boundary + QGIS metadata
- **Original folder:** [Google Drive](https://drive.google.com/drive/folders/17A4XCXmiZhRuTfxUtMXAQfVq107KQkvC) (read-only)

This is a one-shot delivery. If the parcel boundary changes (e.g. the rented 4–5 ha is incorporated, or new parcels are acquired), a fresh order from Regrarians is the cleanest way to refresh the basemap.

---

## A note on file size in this repo

The `basemap/` directory adds ~130 MB to the repository. That's larger than typical for a static-site repo but well within GitHub's per-file (100 MB) and per-repo (~1 GB recommended) limits. If file size becomes a concern as the repo grows, this directory is a clean candidate for [Git LFS](https://git-lfs.com/) — the `.tif` and the larger `.kmz` files are binary and not diffable, which is exactly what LFS is for.

For now: kept in plain git so the data is immediately available to anyone who clones.
