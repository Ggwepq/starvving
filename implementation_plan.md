# starvving — Implementation Plan

## 1. Project Overview

A fully offline-first mobile application focused on tracking running and walking activities. The app prioritizes local data persistence and offline map rendering, with an optional synchronization layer for Supabase and Strava. The timer runs continuously once started — consistent with Strava's philosophy — giving users an honest record of elapsed time.

---

## 2. Technical Stack & Purpose

| Technology | Component | Purpose |
|---|---|---|
| Flutter | Frontend Framework | Cross-platform UI rendering with high-performance tracking. |
| Isar Database | Local Storage | NoSQL local DB to store GPS breadcrumbs, streaks, and history offline. |
| MapLibre Native | Map Engine | Renders OpenStreetMap vector tiles from local `.mbtiles` files. |
| Supabase | Cloud Backend | Managed PostgreSQL + PostGIS for backups and user auth. |
| Table Calendar | UI Component | Optimized widget for displaying run history and streak highlights. |
| Geolocator | Location Service | High-accuracy GPS polling and permission handling. |
| Flutter Foreground Task | Service Management | Ensures the Android OS does not kill the app during long runs. |
| GPX Package | Data Formatting | Converts internal DB models into `.gpx` files for Strava. |

---

## 3. Core Features (Offline Focus)

### A. High-Accuracy Tracking

- **Live Metrics:** Real-time calculation of Pace, Distance, and Duration.
- **Continuous Timer:** The timer runs without interruption from start to stop — no auto-pause. This matches Strava's behavior and gives users an honest elapsed time record.
- **GPS Accuracy Thresholding:** Points with `horizontalAccuracy > 15m` are silently discarded to prevent GPS drift without interrupting the session.
- **Breadcrumb Trail:** Live drawing of the run path over the map using a Polyline.

### B. Offline Map Ecosystem

- **Region Management:** Allows users to download map sectors (e.g., Metro Manila) for offline use.
- **Local Tile Hosting:** Serves tiles directly from the device's internal storage.

### C. Streaks & Calendar Visualization

- **Activity Calendar:** A heat-map style calendar showing days with recorded runs.
- **Streak Counter:** Dynamic counter displaying consecutive days/weeks of activity.
- **Consistency Insights:** Local data analysis showing most active times and average distance progress.

### D. Data Export

- **Local GPX Export:** Users can export any activity as a `.gpx` file directly from the device — independent of Strava or cloud sync.
- **CSV Export (Optional):** Flat export of all activities for personal archiving or import into other tools.

### E. Cloud & Strava Integration (Online-Only)

- **Supabase Sync:** Automated `upsert` of local activities to the cloud when online.
- **Strava Bridge:** OAuth2 flow to upload `.gpx` files directly to the user's Strava profile, with chunked upload and retry queue for large files.

---

## 4. Data Architecture

### Isar Schemas

```dart
// Core activity record
@collection
class Activity {
  Id id = Isar.autoIncrement;
  late DateTime startedAt;
  late DateTime endedAt;
  late double distanceMeters;
  late int durationSeconds;       // wall-clock elapsed (timer never pauses)
  late double avgPaceSecPerKm;
  bool synced = false;
  bool exportedToStrava = false;
}

// Individual GPS breadcrumbs — linked to Activity
@collection
class LocationPoint {
  Id id = Isar.autoIncrement;
  late int activityId;
  late double lat;
  late double lng;
  late double accuracyMeters;
  late DateTime recordedAt;
}
```

### Volume Planning

At 1-second GPS polling, a 1-hour run produces ~3,600 `LocationPoint` rows. Across 365 days of daily runs, that is ~1.3 million rows. To keep Isar queries fast:

- Index `LocationPoint` on `activityId` for efficient polyline reconstruction.
- Implement a **retention policy**: compress points older than 90 days using the Ramer-Douglas-Peucker algorithm (reduce to ~200 key points per activity) while preserving original distance/pace values.
- Expose a "Manage Storage" screen showing per-activity size and a bulk-delete option.

---

## 5. Platform Considerations

### Android

- Use `flutter_foreground_task` with a persistent notification to prevent OS sleep cycles during long runs.
- Request `FOREGROUND_SERVICE_LOCATION` permission (Android 14+).

---

## 6. Phase-by-Phase Development

### Phase 1 — The Tracking Engine (MVP)

- Set up Isar schemas for `Activity` and `LocationPoint`.
- Implement `Geolocator` with accuracy thresholding (`horizontalAccuracy > 15m` → discard).
- Implement `flutter_foreground_task` for Android background service.
- Build "Record" UI with start/stop/pause (manual) functionality. Timer runs continuously; pausing is a UI affordance only (lap marker, not a timer halt).
- Add local GPX export from the activity detail screen.

### Phase 2 — The Map & Geography

- Integrate MapLibre and load regional `.mbtiles` files.
- Implement real-time Polyline updates on the map during a live session.
- Add distance calculation logic using the Haversine formula over stored Isar coordinates.
- Build the region download manager (Metro Manila as the default seed region).

### Phase 3 — Gamification & Insights

- Build `StreakService` to calculate current/longest streaks from Isar data.
- Integrate `Table Calendar` to visualize run history with heat-map styling.
- Develop the "Insights" dashboard for local performance trends.
- Implement the storage retention policy and "Manage Storage" screen.

### Phase 4 — The Data Bridge (Cloud)

- Set up Supabase project with PostGIS enabled.
- Create the sync service to push Isar data to Supabase PostgreSQL via `upsert`.
- Integrate the `gpx` package for activity exporting.
- Build retry queue for failed sync attempts (exponential backoff).

### Phase 5 — Strava Integration

- Implement Strava OAuth2 login flow.
- Add "Sync to Strava" button with multipart POST upload of GPX files.
- Implement chunked upload with retry logic for large files (runs > 2 hours).
- Respect Strava API rate limits (100 requests/15 min, 1000/day).

---

## 7. Potential Challenges & Solutions

| Challenge | Solution |
|---|---|
| Android battery / OS kill | `flutter_foreground_task` with persistent notification |
| GPS drift | Discard points where `horizontalAccuracy > 15m` |
| Storage growth (1.3M+ rows/year) | 90-day retention policy with RDP point compression; "Manage Storage" screen |
| Strava large file uploads | Chunked multipart POST with exponential-backoff retry queue |
| Strava rate limits | Client-side rate limiter; queue uploads when limit approached |
| Offline map storage | Vector tiles (`.mbtiles`) instead of raster — ~80% smaller |
| No user data export outside Strava | Local GPX and optional CSV export on every activity |
