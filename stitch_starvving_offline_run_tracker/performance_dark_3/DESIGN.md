---
name: Performance Dark
colors:
  surface: '#111508'
  surface-dim: '#111508'
  surface-bright: '#373b2b'
  surface-container-lowest: '#0c1004'
  surface-container-low: '#191d0f'
  surface-container: '#1d2113'
  surface-container-high: '#272c1d'
  surface-container-highest: '#323727'
  on-surface: '#e1e5ce'
  on-surface-variant: '#e4beb4'
  inverse-surface: '#e1e5ce'
  inverse-on-surface: '#2e3223'
  outline: '#ab8980'
  outline-variant: '#5b4039'
  surface-tint: '#ffb5a0'
  primary: '#ffb5a0'
  on-primary: '#5f1500'
  primary-container: '#ff5722'
  on-primary-container: '#541200'
  inverse-primary: '#b02f00'
  secondary: '#c5c9b4'
  on-secondary: '#2e3224'
  secondary-container: '#444939'
  on-secondary-container: '#b3b7a3'
  tertiary: '#a4d70f'
  on-tertiary: '#263500'
  tertiary-container: '#779e00'
  on-tertiary-container: '#212f00'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#ffdbd1'
  primary-fixed-dim: '#ffb5a0'
  on-primary-fixed: '#3b0900'
  on-primary-fixed-variant: '#862200'
  secondary-fixed: '#e1e5cf'
  secondary-fixed-dim: '#c5c9b4'
  on-secondary-fixed: '#191d10'
  on-secondary-fixed-variant: '#444939'
  tertiary-fixed: '#bff437'
  tertiary-fixed-dim: '#a4d70f'
  on-tertiary-fixed: '#151f00'
  on-tertiary-fixed-variant: '#394d00'
  background: '#111508'
  on-background: '#e1e5ce'
  surface-variant: '#323727'
typography:
  display-lg:
    fontFamily: Barlow Condensed
    fontSize: 48px
    fontWeight: '700'
    lineHeight: '1.0'
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Barlow Condensed
    fontSize: 32px
    fontWeight: '700'
    lineHeight: '1.1'
    letterSpacing: 0.01em
  headline-md:
    fontFamily: Barlow Condensed
    fontSize: 24px
    fontWeight: '600'
    lineHeight: '1.2'
  body-lg:
    fontFamily: Barlow Condensed
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.5'
  body-md:
    fontFamily: Barlow Condensed
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.5'
  label-lg:
    fontFamily: Barlow Condensed
    fontSize: 14px
    fontWeight: '600'
    lineHeight: '1.0'
    letterSpacing: 0.05em
  label-sm:
    fontFamily: Barlow Condensed
    fontSize: 12px
    fontWeight: '500'
    lineHeight: '1.0'
    letterSpacing: 0.08em
  metric-xl:
    fontFamily: Barlow Condensed
    fontSize: 64px
    fontWeight: '700'
    lineHeight: '1.0'
spacing:
  base: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 40px
  margin-mobile: 16px
  margin-desktop: 32px
  gutter: 12px
---

## Brand & Style

The design system is engineered for high-intensity athletic environments where focus, speed, and battery endurance are paramount. It targets serious athletes and fitness enthusiasts who require a "heads-up display" (HUD) feel for their biometric data and workout metrics. 

The aesthetic is **Rugged Utilitarian**. It avoids decorative flourishes, gradients, or soft shadows in favor of a raw, industrial precision. Drawing inspiration from mechanical toolsets and high-performance automotive dashboards, the UI emphasizes flat surfaces and structural integrity. Every element is designed to feel essential, durable, and highly visible under physical duress or outdoor conditions.

## Colors

This design system utilizes a "True Dark" strategy to maximize OLED battery efficiency and reduce eye strain in low-light gym environments. 

- **Action Orange (#FF5722):** The primary engine. Used exclusively for interactive elements, critical alerts, and primary progress indicators. 
- **Deep Charcoal (#111508):** The foundational canvas. All primary surfaces use this near-black value to save power.
- **Surface Elevation (#1A1E11):** A slightly lighter tint used for secondary containers to provide subtle structural separation without breaking the flat aesthetic.
- **Volt Green (#C9FF42):** An auxiliary accent for "Safe" or "Complete" states, providing a high-visibility contrast against the orange and charcoal.
- **Border Neutral (#2D3224):** A low-key, desaturated tint for the thin borders that define the rugged layout.

## Typography

The typography is built around **Barlow Condensed**, a typeface inspired by California highway signs and public transit—optimized for clarity and impact at a glance.

- **Condensed Weight:** Allows for more data density, particularly useful for multi-digit biometric readings like heart rate or split times.
- **Case Styling:** Labels and secondary headers should utilize **Uppercase** to reinforce the utilitarian, "stenciled" feel of the system.
- **Tabular Numerals:** Essential for all metric-based displays to prevent layout shifting as numbers fluctuate during real-time tracking.
- **Letter Spacing:** Increased slightly for labels to ensure legibility on small screens while moving; decreased for large display metrics to maintain a tight, aggressive visual punch.

## Layout & Spacing

This design system employs a strict **4px baseline grid** to ensure mathematical precision in the rugged aesthetic. 

- **Layout Model:** A fluid grid for mobile (4 columns) and a fixed-center grid for desktop (12 columns).
- **Rhythm:** Elements are spaced using a "compact-yet-clear" philosophy. Dense information clusters (like a workout log) use `sm` (8px) spacing, while major section breaks use `xl` (40px) to maintain a sense of organized efficiency.
- **Margins:** Screens should maintain a consistent 16px edge margin to prevent interactive elements from feeling claustrophobic on modern edge-to-edge displays.

## Elevation & Depth

In line with the rugged, utilitarian theme, this design system **eschews shadows entirely**. Depth is communicated through color-stepping and structural borders rather than physical light metaphors.

- **Flat Surfaces:** Containers do not "float." They sit flush on the background grid.
- **Layering:** Use the secondary surface color (#1A1E11) to define cards or modules. 
- **Borders:** Depth is reinforced with **1px solid borders**. Use `Border Neutral` for standard containers and `Action Orange` for focused or active states.
- **Inverted Layers:** High-priority alerts may use a "full-bleed" primary color background with black text to create an immediate visual hierarchy break.

## Shapes

The shape language is strictly **Sharp (0px)**. 

Every button, card, and input field must have square corners. This reinforces the industrial, non-nonsense personality of the brand and ensures a seamless alignment with the grid. There are no "soft" elements; the UI is built from hard-edged blocks that suggest strength and reliability.

## Components

- **Buttons:** Large, blocky, and full-width on mobile. Use `Action Orange` for primary actions with black `Barlow Condensed Bold` text. Secondary buttons are transparent with a 1px `Border Neutral` outline.
- **Inputs:** Simple boxes with 1px `Border Neutral` outlines. On focus, the border shifts to `Action Orange`. Use `label-sm` for field labels, positioned always-visible above the input.
- **Cards:** No padding or margin between internal components that share a container. Use 1px borders to separate list items within a card.
- **Progress Bars:** Flat, 8px tall bars. The background is a dark track (#1A1E11) with a solid `Action Orange` or `Volt Green` fill. No rounded caps.
- **Chips/Status:** Small rectangular tags with 1px borders. Use `label-sm` for the text. 
- **Workout HUD:** A specialized component for real-time tracking, featuring `metric-xl` typography for primary data points, flanked by smaller, stenciled labels.