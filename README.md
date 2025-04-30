# sharay2project3
**Stephen Harayo**  
sharay2 · 675165774  
**Project 3 – Animation Nation**

This TFT/EXOTECH-themed app shows eight custom animations with unique screen transitions. Everything is optimized for landscape.

---

## Main files
- **main.dart**  
  Locks orientation to landscape, applies the TFT dark/silver/orange theme, and launches `HomeScreen`.
- **home_screen.dart**  
  Displays the scrollable list of 8 animations (with icons) and routes taps through `screen_transition.dart`.

---

## Animations barrel
- **animations/animation_export.dart**  
  Re-exports all eight animation screen classes so you can import them in one line.

---

## Explicit animations (manual Play/Pause + Reverse)
- **animations/explicit/bouncing_bullet.dart**  
  Jhin’s bullet bouncing up/down with curved “bounce” motion.
- **animations/explicit/jax_spin.dart**  
  Jax spinning his weapon continuously in place.
- **animations/explicit/zeri_sprint.dart**  
  Zeri’s “lightning sprint” dot zooming back and forth.

---

## Implicit animations (auto-play, no controls)
- **animations/implicit/naafiri_fade.dart**  
  Naafiri’s shadow text fading smoothly in and out.
- **animations/implicit/sejuani_ult_growth.dart**  
  Sejuani’s ult circle expanding and contracting like frost.
- **animations/implicit/varus_target.dart**  
  Varus’s target highlight jumping to random positions.
- **animations/implicit/mordekaiser_slam.dart**  
  Mordekaiser’s abyssal slam glow pulsing rhythmically.
- **animations/implicit/tacticians_crown.dart**  
  Tactician’s Crown floating and pulsing with cosmic energy.

---

## Transitions
All transition classes are re-exported by `transitions/transition_export.dart`.

- **transitions/dark_fade_transition.dart**  
  Simple fullscreen fade to black (used for subtle mood shifts).
- **transitions/fade_transition.dart**  
  Standard cross-fade transition between screens.
- **transitions/rotation_transition.dart**  
  Rotates the incoming page into view.
- **transitions/scale_transition.dart**  
  Scales the new page up from center.
- **transitions/slide_fade_transition.dart**  
  Combined slide + fade effect.
- **transitions/slide_from_bottom_right_transition.dart**  
  Slides the next page in from bottom-right corner.
- **transitions/slide_from_left_transition.dart**  
  Slides in from the left edge.
- **transitions/slide_transition.dart**  
  Basic slide-in from any direction (configurable).
- **transitions/transition_export.dart**  
  Barrel file exporting all of the above transitions.

---

## Widgets
- **widgets/animation_screen_layout.dart**  
  1/3 description panel + 2/3 animation panel (with optional Play/Pause & Reverse buttons) template.
- **widgets/screen_transition.dart**  
  Chooses which `PageRoute` (from `transition_export.dart`) to use when you tap a list item on the home screen.

---

## Test Suite

All of our automated tests live in `test/widget_test.dart` and are split into two groups:

### 1. Widget Tests (10)

These verify each UI component in isolation:

1. **HomeScreen shows 8 animations**  
   Confirms we have exactly 8 `ListTile` entries.
2. **HomeScreen shows “Jhin’s Perfect Shot”**  
   Verifies the Jhin title appears.
3. **HomeScreen shows “Tactician’s Crown”**  
   Verifies the Crown title appears.
4. **AnimationScreenLayout renders title & description**  
   Renders a mock layout with a `Placeholder` and checks its title & description text.
5. **AnimationScreenLayout shows the animation widget**  
   Confirms a passed‐in `Placeholder()` is displayed.
6. **BouncingBulletScreen shows Play/Pause & Reverse**  
   Checks Jhin’s explicit animation has its two control buttons.
7. **JaxSpinScreen shows Play/Pause & Reverse**  
   Same for Jax’s screen.
8. **ZeriSprintScreen shows Play/Pause & Reverse**  
   Same for Zeri’s screen.
9. **SejuaniIceGrowthScreen hides controls**  
   Verifies the implicit animation (with `disableLoop`) shows no buttons.
10. **NaafiriFadeScreen hides controls**  
    Same for Naafiri’s implicit fade.

### 2. Integration Tests (5)

These simulate real user flows across screens:

1. **Tap Jhin → BouncingBulletScreen**  
   Taps “Jhin’s Perfect Shot” on Home, waits for the custom transition, then asserts the AppBar title.
2. **Tap Zeri → ZeriSprintScreen**  
   Same pattern for Zeri’s animation.
3. **Tap Jax → JaxSpinScreen**  
   Same for Jax’s animation.
4. **Back from Jhin → HomeScreen**  
   After entering Jhin’s screen, calls `handlePopRoute()` (simulating Android back) and verifies we’ve returned to the HomeScreen title.
5. **Back from Zeri → HomeScreen**  
   Same “back” flow for Zeri’s screen.

