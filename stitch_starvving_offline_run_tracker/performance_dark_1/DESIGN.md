---
name: Performance Dark
colors:
  surface: '#111508'
  surface-dim: '#111508'
  surface-bright: '#373b2c'
  surface-container-lowest: '#0c0f04'
  surface-container-low: '#1a1d10'
  surface-container: '#1e2113'
  surface-container-high: '#282b1d'
  surface-container-highest: '#333627'
  on-surface: '#e2e4cf'
  on-surface-variant: '#c4c9ac'
  inverse-surface: '#e2e4cf'
  inverse-on-surface: '#2f3223'
  outline: '#8e9379'
  outline-variant: '#444933'
  surface-tint: '#abd600'
  primary: '#ffffff'
  on-primary: '#283500'
  primary-container: '#c3f400'
  on-primary-container: '#556d00'
  inverse-primary: '#506600'
  secondary: '#ffb5a0'
  on-secondary: '#5f1500'
  secondary-container: '#d73b00'
  on-secondary-container: '#fffbff'
  tertiary: '#ffffff'
  on-tertiary: '#21323e'
  tertiary-container: '#d2e5f5'
  on-tertiary-container: '#556774'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#c3f400'
  primary-fixed-dim: '#abd600'
  on-primary-fixed: '#161e00'
  on-primary-fixed-variant: '#3c4d00'
  secondary-fixed: '#ffdbd1'
  secondary-fixed-dim: '#ffb5a0'
  on-secondary-fixed: '#3b0900'
  on-secondary-fixed-variant: '#862200'
  tertiary-fixed: '#d2e5f5'
  tertiary-fixed-dim: '#b6c9d8'
  on-tertiary-fixed: '#0b1d29'
  on-tertiary-fixed-variant: '#374956'
  background: '#111508'
  on-background: '#e2e4cf'
  surface-variant: '#333627'
typography:
  metric-lg:
    fontFamily: Barlow Condensed
    fontSize: 64px
    fontWeight: '700'
    lineHeight: 64px
    letterSpacing: -0.02em
  metric-md:
    fontFamily: Barlow Condensed
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 48px
    letterSpacing: -0.01em
  headline-lg:
    fontFamily: Barlow Condensed
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 36px
  headline-md:
    fontFamily: Barlow Condensed
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 26px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-caps:
    fontFamily: JetBrains Mono
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.05em
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  unit: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  gutter: 12px
  margin-mobile: 16px
---

## Brand & Style

The design system is built for the high-endurance athlete operating in unpredictable environments. The brand personality is rugged, resilient, and utilitarian, prioritizing functional clarity over decorative flair. It evokes the feeling of professional-grade tactical equipment—reliable, high-contrast, and focused.

The visual style blends **Brutalism** and **Minimalism**. It utilizes a structured, grid-heavy layout with reinforced borders to convey a sense of structural integrity. Every element is designed for "at-a-glance" comprehension while the user is in motion, ensuring that the interface remains a tool rather than a distraction.

## Colors

The palette is optimized for OLED efficiency and extreme legibility. 

- **Primary (Neon Lime):** Reserved for the most critical interactive elements, GPS active paths, and "Start" actions. Its high frequency ensures visibility in direct sunlight.
- **Secondary (Action Orange):** Used for warnings, pauses, or secondary metrics to provide immediate visual differentiation from the primary path.
- **Monochrome Foundation:** The deep black background maximizes battery life during long-distance, offline-first sessions. Surfaces use a slightly lighter charcoal to create a subtle hierarchy without relying on shadows.
- **Success (Electric Green):** Dedicated exclusively to streaks, completed goals, and positive performance indicators.

## Typography

This design system employs a tiered typography strategy to handle extreme data density.

- **Metrics & Headlines:** Uses **Barlow Condensed**. The narrow apertures and high x-height allow for large-scale numbers (Pace, Distance) to fit within tight horizontal constraints without sacrificing legibility.
- **General UI & Body:** Uses **Inter**. This provides a neutral, highly readable foundation for settings, descriptions, and list items.
- **System Labels:** Uses **JetBrains Mono**. Monospaced characters are used for secondary data points and technical labels (GPS coordinates, timestamps) to maintain a mechanical, "instrument panel" aesthetic.

All numerical data must use **tabular figures** to prevent layout jitter as numbers fluctuate during a run.

## Layout & Spacing

The layout philosophy follows a **strict modular grid** optimized for data density.

- **Grid Model:** A fluid 4-column grid for mobile devices, expanding to 8 columns for tablets. 
- **Density:** Spacing is tight (8px or 12px gutters) to allow for more performance data to be visible on a single screen, reducing the need for scrolling while running.
- **Touch Targets:** While the layout is dense, interactive elements (buttons, toggles) must maintain a minimum 48x48px hit area to account for shaky hands and movement.
- **Offline States:** Layouts must include dedicated "Offline Map Stash" indicators and sync status bars that persist at the top of the view.

## Elevation & Depth

This design system rejects traditional shadows and blurs in favor of **structural layering**.

- **Borders over Shadows:** Depth is communicated through 1px solid borders (#333333). Active states are indicated by increasing the border weight to 2px or changing the border color to the Primary Neon Lime.
- **Tonal Stepping:** The background (#121212) represents the lowest level. Cards and "Surface" containers (#1E1E1E) sit one level above. Modals or high-priority alerts use a slightly lighter Gray (#2A2A2A).
- **Z-Index Precision:** Interactive overlays (like a "Pause" button) should use a high-contrast border and a solid background to appear "bolted on" to the UI rather than floating over it.

## Shapes

The shape language is "Soft-Industrial." 

Elements use a consistent **4px corner radius (Soft)**. This small radius provides enough "ruggedness" to feel like molded plastic or machined metal, avoiding the friendliness of fully rounded corners while remaining more comfortable than sharp 90-degree angles.

- **Standard Elements:** 4px radius (Buttons, Cards, Inputs).
- **Large Containers:** 8px radius (Modals, Large Map Overlays).
- **Icons:** Use square caps and sharp joins to match the utilitarian aesthetic.

## Components

- **Action Buttons:** Large, rectangular with 4px radius. Primary buttons use the Neon Lime background with black text for maximum contrast. Secondary buttons use a transparent background with a 2px Action Orange border.
- **Metric Cards:** Modular tiles that can be reordered. Each card features a "Label-Caps" header and a "Metric-LG" value. 
- **GPS Progress Bar:** A thick, 8px high track. The "traveled" portion uses a Neon Lime glow effect, while the "remaining" portion is a dark #333333.
- **Status Chips:** Small, monospaced labels used for "OFFLINE," "SYNCED," or "LOW BATTERY." They use a dark background with a high-contrast border.
- **Toggle Switches:** Rectangular and mechanical in appearance. When "ON," the track fills with Primary Neon Lime; when "OFF," it remains a dark neutral.
- **Data Tables:** Highly condensed with 1px horizontal dividers and no vertical lines. Headers use the monospaced font to differentiate from the data values.