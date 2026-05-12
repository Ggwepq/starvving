---
name: Performance Dark
colors:
  surface: '#121414'
  surface-dim: '#121414'
  surface-bright: '#37393a'
  surface-container-lowest: '#0c0f0f'
  surface-container-low: '#1a1c1c'
  surface-container: '#1e2020'
  surface-container-high: '#282a2b'
  surface-container-highest: '#333535'
  on-surface: '#e2e2e2'
  on-surface-variant: '#e8bcb5'
  inverse-surface: '#e2e2e2'
  inverse-on-surface: '#2f3131'
  outline: '#af8781'
  outline-variant: '#5e3f3a'
  surface-tint: '#ffb4a8'
  primary: '#ffb4a8'
  on-primary: '#690000'
  primary-container: '#d50000'
  on-primary-container: '#ffe4e0'
  inverse-primary: '#c00000'
  secondary: '#c5c9b3'
  on-secondary: '#2e3223'
  secondary-container: '#444938'
  on-secondary-container: '#b3b7a2'
  tertiary: '#c4c9b6'
  on-tertiary: '#2d3225'
  tertiary-container: '#666b5b'
  on-tertiary-container: '#e7ecd8'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#ffdad4'
  primary-fixed-dim: '#ffb4a8'
  on-primary-fixed: '#410000'
  on-primary-fixed-variant: '#930000'
  secondary-fixed: '#e1e5ce'
  secondary-fixed-dim: '#c5c9b3'
  on-secondary-fixed: '#191d0f'
  on-secondary-fixed-variant: '#444938'
  tertiary-fixed: '#e0e5d1'
  tertiary-fixed-dim: '#c4c9b6'
  on-tertiary-fixed: '#181d11'
  on-tertiary-fixed-variant: '#43493a'
  background: '#121414'
  on-background: '#e2e2e2'
  surface-variant: '#333535'
typography:
  display-lg:
    fontFamily: Barlow Condensed
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 48px
    letterSpacing: -0.02em
  display-md:
    fontFamily: Barlow Condensed
    fontSize: 36px
    fontWeight: '700'
    lineHeight: 36px
    letterSpacing: -0.01em
  headline-lg:
    fontFamily: Barlow Condensed
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 32px
    letterSpacing: 0.02em
  headline-md:
    fontFamily: Barlow Condensed
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: 0.02em
  body-lg:
    fontFamily: Barlow Condensed
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 24px
    letterSpacing: 0.01em
  body-md:
    fontFamily: Barlow Condensed
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 22px
    letterSpacing: 0.01em
  label-lg:
    fontFamily: Barlow Condensed
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.06em
  label-sm:
    fontFamily: Barlow Condensed
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 14px
    letterSpacing: 0.08em
  display-lg-mobile:
    fontFamily: Barlow Condensed
    fontSize: 40px
    fontWeight: '700'
    lineHeight: 40px
spacing:
  unit: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 40px
  margin-mobile: 16px
  margin-desktop: 32px
  gutter: 16px
---

## Brand & Style
This design system is engineered for high-intensity training environments where focus, speed, and battery endurance are paramount. The brand personality is aggressive, disciplined, and tactical—evoking the feeling of a professional athlete's telemetry dashboard. 

The aesthetic leverages a mix of **High-Contrast Bold** and **Tactical Minimalism**. It avoids decorative flourishes in favor of functional density and immediate readability. The emotional response should be one of urgency and "work-mode" readiness, utilizing the psychological impact of deep blacks and sharp reds to signal peak performance.

## Colors
The palette is centered on pure utility and energy efficiency. 
- **Primary:** Crimson Red (#D50000) is used exclusively for calls to action, active states, and critical performance metrics. It represents blood, adrenaline, and effort.
- **Background:** The Deep Charcoal (#111508) is nearly black to maximize OLED battery efficiency during long workouts while maintaining just enough depth to prevent visual "smearing" during scrolling.
- **Surface Tiers:** Secondary surfaces use a slightly lifted charcoal (#1B2110) to create subtle separation without losing the tactical feel.
- **Typography:** Pure White (#FFFFFF) is used for maximum contrast on primary text, while a muted "Zinc" (#A1A1AA) is reserved for secondary metadata.

## Typography
The typography in this design system is exclusively **Barlow Condensed**. The condensed nature allows for high data density, fitting large numerical values (reps, weight, heart rate) into tight spaces without sacrificing legibility.

- **Headlines:** Always uppercase for a "command" feel.
- **Display Styles:** Used for hero metrics. Use tight letter spacing to create a solid, industrial block of text.
- **Labels:** Small caps with increased letter spacing (tracking) are mandatory for labels to ensure they are distinct from body copy at a glance.

## Layout & Spacing
This design system uses a strict **4px baseline grid**. All spacing increments must be multiples of 4 to maintain a tight, mathematical rhythm.

- **Layout:** A 12-column fluid grid is used for desktop, collapsing to a 4-column grid for mobile.
- **Density:** High. Margins are kept tight (16px on mobile) to maximize the "HUD" (Heads-Up Display) feel.
- **Alignment:** Consistent left-alignment for all data points to allow the eye to scan vertically down a list of metrics rapidly.

## Elevation & Depth
Elevation is achieved through **Tonal Layers** and **Crimson Accents** rather than traditional shadows. Shadows are inefficient for the battery-saving goals of this theme and often look muddy on very dark backgrounds.

1. **Base Layer:** #111508 (The void).
2. **Mid Layer:** #1B2110 (Used for cards and container backgrounds).
3. **Top Layer:** #2A2F22 (Used for active states or elevated modals).

To define boundaries, use 1px solid borders in a slightly lighter charcoal (#333) or a faint Crimson Red for active elements. This "wireframe" approach reinforces the tactical aesthetic.

## Shapes
This design system utilizes **Sharp (0px)** corners for all structural elements including buttons, cards, and input fields. Sharp corners communicate precision, technicality, and a "no-frills" attitude. 

The only exception to the sharp-corner rule is the use of circular "Pill" shapes for status indicators or progress rings to differentiate biological data from mechanical UI elements.

## Components
- **Buttons:** Primary buttons are solid Crimson Red (#D50000) with Black text. Secondary buttons use a 1px Crimson border with no fill. Use a "cut-corner" clip-path on the top-right of primary buttons for an extra tactical edge.
- **Cards:** No shadows. Cards are defined by a background color of #1B2110 and a 1px border of #2A2F22. Headlines within cards should be set in `label-lg`.
- **Input Fields:** Bottom-border only (2px thickness). When focused, the border glows Crimson Red.
- **Progress Bars:** Background is #2A2F22. The progress fill is a solid Crimson Red block. For "extreme" zones, the red can pulse.
- **Chips:** Small, rectangular, and high-contrast. Use for workout tags (e.g., "HIIT", "STRENGTH").
- **Lists:** Separated by 1px dividers in #2A2F22. Icons within lists should be monochromatic white or crimson.
- **Tactical HUD Overlay:** For active workout screens, use a "scanline" overlay effect (0.05 opacity) to simulate a digital visor.