# canary-504

_Latest commit titles and messages from `larsmartens/PixelXpert-fork@canary`._

## Version update: Release (fork)

- Commit: `244419d`
- Author: github-actions[bot]
- Date: 2026-06-24

## fix: mark untranslated fork strings intentional

- Commit: `b487177`
- Author: Lars Martens
- Date: 2026-06-24

## Version update: Release (fork)

- Commit: `8e77b6c`
- Author: github-actions[bot]
- Date: 2026-06-24

## fix: mark literal percent strings non-format

- Commit: `984fcd7`
- Author: Lars Martens
- Date: 2026-06-24

## Version update: Release (fork)

- Commit: `a00b6c0`
- Author: github-actions[bot]
- Date: 2026-06-24

## fix: remove hilt release blocker

- Commit: `9e8dde3`
- Author: Lars Martens
- Date: 2026-06-24

## Version update: Release (fork)

- Commit: `2f296b1`
- Author: github-actions[bot]
- Date: 2026-06-24

## fix: satisfy release and lint CI gates

- Commit: `859e543`
- Author: Lars Martens
- Date: 2026-06-24

## Version update: Release (fork)

- Commit: `ecd0bf0`
- Author: github-actions[bot]
- Date: 2026-06-24

## fix: repair A17 merge compile issues

- Commit: `f891d6b`
- Author: Lars Martens
- Date: 2026-06-24

## Update module artifact from verified build

- Commit: `7607be2`
- Author: Lars Martens
- Date: 2026-06-23

## Limit preference wait during Xposed startup

- Commit: `0dd195c`
- Author: Lars Martens
- Date: 2026-06-23

## fix(reflection): propagate hook throwables to after callbacks

- Commit: `79f077e`
- Author: Lars Martens
- Date: 2026-04-13

## fix(xposed): avoid concurrent preference reload crashes

- Commit: `f7d35f5`
- Author: Lars Martens
- Date: 2026-04-13

## Fix Vector activation safety for PixelXpert module

- Commit: `d6a0d0e`
- Author: Lars Martens
- Date: 2026-06-23

## Remove dead PyTorch ProGuard keep rules

- Commit: `c005433`
- Author: lars-martens
- Date: 2026-06-21

## Add system-trace capture quick settings tile; note A17 support

- New Quick Settings tile captures a perfetto system trace on demand via
  ProfilingManager and reports the saved trace path. Useful for diagnosing
  performance on device without external tooling.
- README: state Android 17 support explicitly in the compatibility chart.

- Commit: `1f3a6a4`
- Author: lars-martens
- Date: 2026-06-21

## Drop PyTorch segmentor for 16 KB page-size compatibility

PyTorch Android (1.13.1, deprecated upstream) bundled native libraries
(libfbjni, libpytorch_vision_jni, libc++_shared) that are not 16 KB-page
aligned, so they fail to load on Android 15+/17 devices. Remove the PyTorch
backend entirely; ML Kit subject segmentation (already the default) is the
sole segmentor. The only remaining native library is now 16 KB-aligned.

Removes the PyTorch dependencies, the segmentor classes, the AI-model
selection preference, and the related packaging exclusion.

- Commit: `9d95765`
- Author: lars-martens
- Date: 2026-06-21
