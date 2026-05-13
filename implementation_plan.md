# Starvving — Implementation Plan

## 1. Project Overview

A fully offline-first Android application for tracking running and walking activities. The app is built around the **Starvving** brand and the "Performance Dark" design system — a rugged, utilitarian HUD aesthetic designed for legibility under physical duress and outdoor conditions. All core functionality operates without a network connection. Cloud sync and Strava integration are optional, online-only layers.

---

## 2. Design System

All UI implementation must strictly follow the Starvving design language extracted from the Stitch design files. Stitch design files are in stitch_starvving_offline_run_tracker folder.

### Colors (Primary Theme — Neon Lime)

| Token | Hex | Usage |
|---|---|---|
| `background` | `#111508` | Base canvas — all screens |
| `surface-container` | `#1E2113` | Cards, metric tiles |
| `surface-container-high` | `#282B1D` | Elevated containers, modals |
| `primary` (Neon Lime) | `#C3F400` / `#ABD600` | GPS polyline, Start CTA, active states |
| `secondary` (Action Orange) | `#FF5722` | Pause state, polyline variant, warnings |
| `on-surface` | `#E2E4CF` | Primary text |
| `on-surface-variant` | `#C4C9AC` | Secondary / label text |
| `outline-variant` | `#444933` | 1px structural borders |
| `error` (Crimson) | `#D50000` | Stop button, destructive actions |

The Settings screen exposes three selectable accent colors: **Neon Lime**, **Action Orange**, and **Crimson**. The chosen accent is used for the GPS polyline color, active button fills, and primary metric highlights throughout the app.

### Typography

| Role | Font | Size | Weight | Notes |
|---|---|---|---|---|
| `metric-xl` | Barlow Condensed | 64px | 700 | Live pace / distance hero |
| `metric-lg` | Barlow Condensed | 48px | 700 | Secondary live metrics |
| `headline-lg` | Barlow Condensed | 32px | 700 | Screen titles |
| `headline-md` | Barlow Condensed | 24px | 600 | Section headers |
| `body-lg` | Inter | 18px | 400 | Descriptions, list content |
| `body-md` | Inter | 16px | 400 | General UI text |
| `label-caps` | JetBrains Mono | 12px | 500 | Metric labels, status chips, timestamps |

All numerical displays must use **tabular figures** to prevent layout jitter as values update in real time. In Flutter: `fontFeatures: [FontFeature.tabularFigures()]` on every `TextStyle` used for live metrics.

### Shape & Elevation

- Standard elements (buttons, cards, inputs): **4px corner radius**
- Large containers / map overlays: **8px corner radius**
- **No shadows.** Depth is communicated through 1px solid borders (`outline-variant`) and tonal surface stepping.
- Active / focused states: border weight increases to 2px and color shifts to the selected accent.

### Spacing Grid

Base unit is 4px. All spacing must be multiples of 4: `xs=4`, `sm=8`, `md=16`, `lg=24`, `xl=32`. Mobile edge margin: 16px. Gutter: 12px.

### Touch Targets

Minimum 48×48px hit area on all interactive elements. Action buttons on the live tracking screen must be full-width or near-full-width to accommodate shaky hands in motion.

---

## 3. Navigation

Four-tab bottom navigation bar — persistent across all screens. Icons are monochromatic (`on-surface-variant` when inactive, accent color when active). Labels in `label-caps`.

| Tab | Screen |
|---|---|
| TRACK | Live tracking / pre-run start |
| ACTIVITIES | Activity feed & detail |
| INSIGHTS | Progress & gamification |
| SETTINGS | App configuration |

---

## 4. Screen-by-Screen Feature Specification

### 4A. Live Tracking Screen (TRACK tab)

**Pre-run state:** Full-width START button (accent fill, black Barlow Condensed Bold text). GPS lock status chip visible — `ACQUIRING` / `LOCKED` in `label-caps`.

**Active run state:**

Top metric bar — full-width, `surface-container-high`, two cells divided by a 1px vertical border:
- Left cell: **Current Pace** in `metric-lg` (e.g. `05:42 /KM`)
- Right cell: **Elapsed Time** in `metric-lg` (e.g. `24:15`)

Distance panel — below metric bar, `surface-container`:
- `DISTANCE` label in `label-caps`
- Distance value in `metric-xl` (e.g. `4.2 KM`)
- GPS signal chip: `▌▌▌ LOCKED` in `label-caps`, right-aligned
- **Goal progress bar** — 8px tall, flat. Accent fill over `surface-container-high` track. Represents progress toward an optional distance goal set before the run.

Map area — full remaining screen height:
- MapLibre Native rendering preloaded `.mbtiles` (projection switchable between TOPO and DARK in Settings)
- Live GPS polyline drawn in the user's selected accent color
- Current position: filled circle, accent color
- Start position: hollow circle, `on-surface-variant`
- Full-bleed, no UI chrome overlaid on the map itself

Lap chip — floating pill above bottom buttons, centered, `surface-container-highest`:
- `CURRENT LAP 04  •  01:12.4` in `label-caps`
- Updates on each LAP tap

Bottom action bar — two rectangular full-width buttons, 4px radius:
- **LAP** — transparent background, 1px accent border, accent text + stopwatch icon
- **STOP** — solid `#D50000` background, white text + stop icon

**Timer behavior:** The elapsed timer runs continuously from START to STOP. There is no pause. LAP records a split without interrupting the clock — consistent with Strava's behavior.

**Screen lock:** Tapping the `LOCKED` chip freezes all button interactions to prevent accidental taps mid-run. Unlock requires a long-press gesture. Locked state is indicated by a lock icon overlay on the action buttons.

---

### 4B. Activity Detail Screen (ACTIVITIES → detail view)

**Header:** Back arrow + STARVVING wordmark. Activity type chip at top of content (e.g. `TRAIL RUN: VERTICAL KILOMETRE`) in `label-caps`, 1px border.

**Route map thumbnail** — full-width, ~200px height. Completed polyline over dark topo map (MapLibre static render). GPS quality chip: `⊙ SIGNAL LOCK 100%` in accent.

**Primary stats grid — 2×2 tiles**, each with `label-caps` header and `headline-lg` value in accent:

| DISTANCE | AVG PACE |
|---|---|
| TIME | CALORIES |

**Elevation Profile section:**
- `ELEVATION PROFILE` header + `GAIN: 840M` right-aligned, both `headline-md`
- Vertical bar chart: accent fill for prominent bars, `surface-container` for lower bars
- Data sourced from `altitudeMeters` per `LocationPoint`

**Pace Delta section:**
- `PACE DELTA` header + `VAR: 2.4%` right-aligned in `error` color
- Per-lap pace deviation from session average. Bars above average: `error` color. At/below average: `on-surface-variant`.

**Extended metrics table** — condensed rows, 1px horizontal dividers, no vertical lines, three columns (METRIC / VALUE / UNIT):
- Max Heart Rate (manual entry in v1)
- Avg Cadence (manual entry in v1)
- Training Effect (computed from pace variance + duration)

**Export actions — three stacked full-width buttons:**
- `↺ SYNC TO STRAVA` — accent fill, black text (disabled + dimmed when offline)
- `↓ EXPORT GPX` — transparent, 1px accent border, accent text
- `⊞ EXPORT CSV` — transparent, 1px `outline-variant` border, `on-surface` text

---

### 4C. Insights Screen (INSIGHTS tab)

**Momentum hero card** — full-width, `surface-container`, 1px accent border:
- `CURRENT MOMENTUM` in `label-caps`
- `ELITE STATUS` chip top-right, 1px accent border
- Streak value: `12` in `metric-xl` accent + `DAY STREAK` in `headline-lg` on-surface
- Motivational percentile copy in `body-lg` (e.g. `You are in the top 2% of endurance athletes this month.`)
- Percentile is computed locally from streak length against a bundled reference distribution

**Activity Intensity calendar** — `surface-container`, 1px border:
- `ACTIVITY INTENSITY` in `label-caps` + 4-stop intensity legend top-right
- 7-column grid (Mon–Sun), rows for each week of the current month
- Each cell: day number in `label-caps`, background tinted by intensity bucket derived from that day's total distance (no activity = `surface-container-low`, light = dim accent, moderate = mid accent, heavy = full accent)
- Powered by `table_calendar` Flutter package

**Stats row — two side-by-side tiles:**
- Left: `AVG DISTANCE` + `12.4 KM/WK`
- Right: `ARCHETYPE` + derived label (e.g. `☀ MORNING RUNNER`) — computed from most frequent `startedAt` hour across last 30 activities

**Monthly goal progress** — `surface-container`, 1px border:
- `MONTHLY GOAL` label + `164.2 / 200 KM` value + `82% COMPLETE` right-aligned in accent
- 8px flat progress bar, accent fill, no rounded caps

**Motivational banner** — full-width image card:
- Bundled grayscale photo asset (no network fetch)
- Italic accent headline overlay (e.g. `MAINTAIN FOCUS`) in Barlow Condensed Italic Bold
- Sub-label in `label-caps`: `3 DAYS UNTIL NEXT LEVEL`
- Milestone text updates based on streak tier thresholds

---

### 4D. Settings Screen (SETTINGS tab)

**Header:** `SETTINGS` in `headline-lg`. `System Configuration v2.0.4` in `label-caps`, `on-surface-variant`.

**THEME & BRANDING section:**
- Three large square swatches: Neon Lime (default), Action Orange, Crimson
- Selected swatch shows a checkmark overlay
- Selection persists to `AppSettings` and propagates app-wide via provider without restart

**ACCOUNT section:**
- `STRAVA SYNC` row — icon, connected username or `NOT CONNECTED`, `ACTIVE` chip or `CONNECT` button
- `SUPABASE CLOUD` row — icon, `SYNCED` chip (green dot) or `OFFLINE` chip

**APP PREFERENCES section:**
- `MEASUREMENT UNITS` — segmented toggle: `METRIC` / `IMPERIAL`
- `MAP PROJECTION` — segmented toggle: `TOPO` / `DARK` (swaps active tileset on live tracking map)
- `CACHE MANAGEMENT` — current footprint label (`1.2 GB — Maps & Track data`). `FLUSH CACHE` button: transparent, 1px `error` border, `error` text. Triggers RDP compression on `LocationPoint` records older than 90 days.
- `MONTHLY DISTANCE GOAL` — numeric input field for the Insights goal progress bar

**WARNING PROTOCOL section** — `surface-container`, 1px `error` border:
- `⚠ WARNING PROTOCOL` in `error`
- `DESTROY LOCAL DATA` — full-width solid `error` button. Wipes all Isar collections. Two-step confirmation dialog required.
- `SIGN OUT OF TERMINAL` — full-width transparent button, `on-surface` text. Clears Strava and Supabase auth tokens.

---

## 5. Technical Stack

| Technology | Component | Purpose |
|---|---|---|
| Flutter | Frontend Framework | Android UI rendering with high-performance real-time tracking |
| Isar Database (Community Version 3.3.2) | Local Storage | NoSQL local DB — activities, location points, laps, settings |
| MapLibre Native | Map Engine | Renders preloaded `.mbtiles` vector tiles (TOPO and DARK modes) |
| Supabase | Cloud Backend | Managed PostgreSQL + PostGIS for optional backup and auth |
| table_calendar | UI Component | Powers the Activity Intensity calendar on Insights screen |
| Geolocator | Location Service | High-accuracy GPS polling with runtime permission handling |
| Flutter Foreground Task | Background Service | Prevents Android OS from killing the app during long runs |
| GPX Package | Data Export | Converts Isar activity models to `.gpx` for Strava and local export |
| Barlow Condensed | Display Font | All metric, headline, and label typography |
| Inter | Body Font | Settings descriptions and general UI text |
| JetBrains Mono | Mono Font | Status chips, GPS labels, timestamps |

---

## 6. Data Architecture

### Isar Schemas

```dart
@collection
class Activity {
  Id id = Isar.autoIncrement;
  late DateTime startedAt;
  late DateTime endedAt;
  late double distanceMeters;
  late int durationSeconds;         // continuous wall-clock; never paused
  late double avgPaceSecPerKm;
  late double? elevationGainMeters;
  late int? estimatedCalories;
  late double? paceVariancePercent;
  late String activityType;         // "run" | "walk"
  late String accentColor;          // accent in use at time of recording
  bool synced = false;
  bool exportedToStrava = false;
  final laps = IsarLinks<LapSplit>();
}

@collection
class LapSplit {
  Id id = Isar.autoIncrement;
  late int activityId;
  late int lapNumber;
  late int splitDurationSeconds;
  late double splitDistanceMeters;
  late DateTime markedAt;
}

@collection
class LocationPoint {
  Id id = Isar.autoIncrement;
  late int activityId;
  late double lat;
  late double lng;
  late double altitudeMeters;
  late double accuracyMeters;
  late DateTime recordedAt;
}

@collection
class AppSettings {
  Id id = 1;                        // singleton
  late String accentColor;          // "lime" | "orange" | "crimson"
  late String units;                // "metric" | "imperial"
  late String mapProjection;        // "topo" | "dark"
  late double monthlyGoalKm;
  String? stravaAccessToken;
  String? stravaUsername;
  bool supabaseEnabled = false;
}
```

### Volume & Retention

At 1-second GPS polling, a 1-hour run generates ~3,600 `LocationPoint` rows. Over 365 days of daily runs that is ~1.3 million rows. To maintain query performance:

- Index `LocationPoint` on `activityId`.
- After 90 days, compress points using the **Ramer-Douglas-Peucker** algorithm, retaining ~200 key points per activity. Original `distanceMeters`, `avgPaceSecPerKm`, and `elevationGainMeters` are preserved on the `Activity` record and are unaffected.
- `FLUSH CACHE` in Settings triggers this compression on demand.

---

## 7. Phase-by-Phase Development

### Phase 1 — Tracking Engine & Live HUD (MVP)

- Set up Isar schemas: `Activity`, `LocationPoint`, `LapSplit`, `AppSettings`.
- Implement `Geolocator` with accuracy thresholding: discard points where `accuracyMeters > 15`.
- Implement `flutter_foreground_task` with persistent notification channel.
- Build Live Tracking screen:
  - Metric header bar (pace + elapsed time, `metric-lg`)
  - Distance panel with optional goal progress bar
  - Full-bleed MapLibre map, preloaded `.mbtiles`, live polyline rendering
  - Floating lap chip (updates on LAP tap)
  - LAP and STOP action buttons (correct sizing, accent/error styling)
  - Screen lock / unlock via long-press on the LOCKED chip
- Implement lap logic: write `LapSplit` on each LAP tap; elapsed timer is never interrupted.
- Implement accent color provider: reads `AppSettings.accentColor`, applies to polyline, buttons, and metric highlights.
- Implement tabular figures on all metric `TextStyle`s.

### Phase 2 — Activity Feed & Detail

- Build Activities feed: reverse-chronological list of `Activity` records. Each card shows date, distance, avg pace, duration, and a mini route snapshot.
- Build Activity Detail screen:
  - Route map thumbnail (MapLibre static polyline render)
  - 2×2 primary stats grid
  - Elevation Profile chart (from `altitudeMeters` per `LocationPoint`)
  - Pace Delta chart (per-lap pace vs. session average)
  - Extended metrics table
  - Export buttons: GPX, CSV (always available); Strava sync (online-only, dimmed offline)
- Implement local GPX export via the `gpx` package.
- Implement local CSV export (activity summary + laps).

### Phase 3 — Insights & Gamification

- Build Insights screen:
  - Momentum hero card (streak counter, Elite Status chip, percentile copy)
  - Activity Intensity calendar (`table_calendar`, intensity-bucketed by daily distance)
  - Stats row (avg weekly distance + Runner Archetype)
  - Monthly goal progress bar
  - Motivational banner (bundled assets, milestone-driven)
- Implement `StreakService`: current streak, longest streak, streak tier thresholds.
- Implement `ArchetypeService`: derive runner type from `startedAt` hour distribution across last 30 activities.
- Implement storage retention policy: RDP compression at 90 days; expose footprint in Settings.

### Phase 4 — Settings Screen & Theme Engine

- Build Settings screen: all four sections as specified in 4D.
- Implement accent color switcher: persists to Isar, propagates via Riverpod provider without app restart.
- Implement Map Projection toggle: swaps active `.mbtiles` tileset on the live tracking map.
- Implement Measurement Units toggle: converts all displayed values between metric and imperial.
- Implement `FLUSH CACHE`: RDP compression on `LocationPoint` records older than 90 days.
- Implement `DESTROY LOCAL DATA`: wipes all Isar collections after a two-step confirmation dialog.
- Implement monthly distance goal input, consumed by the Insights progress bar.

### Phase 5 — Cloud & Strava Integration

- Set up Supabase project with PostGIS extension enabled.
- Implement sync service: `upsert` of `Activity` records to Supabase when online. Mark `synced = true` on success.
- Implement exponential-backoff retry queue (max 5 retries) for failed sync attempts.
- Implement Strava OAuth2 login flow. Store token in `AppSettings.stravaAccessToken`.
- Implement `SYNC TO STRAVA`: multipart GPX POST. Mark `exportedToStrava = true` on success.
- Implement Strava rate-limit guard (100 req/15 min, 1,000/day). Surface queue status in Settings.
- Update Settings ACCOUNT section: display connected Strava username and Supabase sync status.

---

## 8. Android-Specific Requirements

- **Minimum SDK:** Android 8.0 (API 26). Target SDK: Android 14 (API 34).
- **Permissions:** Declare `ACCESS_FINE_LOCATION`, `ACCESS_BACKGROUND_LOCATION`, `FOREGROUND_SERVICE`, and `FOREGROUND_SERVICE_LOCATION` in `AndroidManifest.xml`. `ACCESS_BACKGROUND_LOCATION` requires a separate runtime prompt on Android 10+.
- **Battery Optimization:** On first launch, prompt the user to exempt the app via `ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`. Without this, the foreground service can be deferred by the OS on some OEM ROMs (Samsung, Xiaomi).
- **Preloaded Maps:** Bundle the regional `.mbtiles` file in APK assets or copy to internal storage (`getFilesDir()`) on first launch. No in-app download manager. Bundling both TOPO and DARK tilesets allows the Map Projection toggle to work fully offline.
- **OLED Optimization:** The `#111508` near-black background minimizes pixel power on AMOLED displays — a core design constraint. Do not introduce lighter backgrounds, gradients, or translucent layers that would undermine this.
- **Tabular Figures:** Set `fontFeatures: [FontFeature.tabularFigures()]` on every `TextStyle` used for live metric values to prevent layout jitter as numbers update.

---

## 9. Potential Challenges & Mitigations

| Challenge | Mitigation |
|---|---|
| Android OS killing app mid-run | `flutter_foreground_task` + persistent notification + battery optimization exemption prompt |
| GPS drift inflating distance | Discard points where `accuracyMeters > 15`; Haversine distance only on accepted points |
| Storage growth (~1.3M rows/year) | 90-day RDP compression; `FLUSH CACHE` in Settings; `DESTROY LOCAL DATA` for full reset |
| Isar query slowdown over time | Index `LocationPoint.activityId`; load points only for the requested activity on detail view |
| Accent color not propagating | App-level Riverpod provider watches `AppSettings`; rebuilds on change without restart |
| Layout jitter on live metrics | Tabular figures + `Barlow Condensed` narrow apertures absorb digit-width variance |
| Strava upload failures | Chunked multipart POST; exponential-backoff retry queue; surface status in Settings |
| Strava rate limits | Client-side rate limiter; queue pending uploads; show queued count in Settings |
| `.mbtiles` bundle size | Use vector tiles (not raster) — vector `.mbtiles` for a metro region is typically 40–80 MB vs. 400 MB+ raster |

---

## 10. Out of Scope (v1)

- BLE heart rate monitor or cadence sensor integration (HR and cadence are manual-entry fields in v1)
- Route planning or turn-by-turn navigation
- In-app map region download manager (maps are preloaded)
- Social or sharing features
- Wear OS companion app
- iOS support