# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and this project adheres to [Semantic Versioning](https://semver.org/).

---

## [Unreleased]

## [0.2.4] - 2026-01-04

### Added

- **Feedback**: Added `AppToast`, `AppBadge`, `AppChip`, and `AppLabel`.
- **Surfaces**: Added `AppCard`.
- **Media**: Added `AppAvatar`, `AppImage`, and `AppImageGrid`.
- **States**: Added `AppShimmer`, `AppSkeleton`, `AppEmptyState`, `AppErrorState`, and `AppLoadingState`.
- **Navigation**: Added `AppAppBar` and `AppSidebar`.
- **Overlays**: Added `AppBottomSheet`, `AppDialog`, and `AppConfirmDialog`.
- **Lists**: Added `AppListTile`, `AppSectionHeader`, and `AppDivider`.
- **Forms**: Added `AppFormLayout` and `AppFormField`.

## [0.2.3] - 2026-01-03

### Added

- Added `borderRadius` property to `AppButton` to allow customization of rounded corners.

## [0.2.0] - 2026-01-03

### Added

- Added `primaryDark`, `primaryLight`, `secondaryDark`, and `secondaryLight` to `AppColors` for better color variant support.
- Updated `ThemePresets.squareGovernment` to include consistent dark/light variants for primary and secondary colors.
- Date picker & select components
- Responsive layout helpers

### Changed

- `AppColors` constructor now requires `primaryDark`, `primaryLight`, `secondaryDark`, and `secondaryLight`.
- `AppColors.corporate()` factory updated with default values for new color variants.
- Improve theme customization API

---

## [0.1.1] - 2025-12-27

### Added

- `onTap` dan `readOnly` pada `AppTextFormField` untuk mendukung interaksi tambahan tanpa input manual.

### Changed

- `AppSelectField` kini menggunakan `readOnly: true` agar tetap interaktif melalui `onTap` namun tidak dapat diketik langsung.

---

## [0.1.0] - 2025-12-27

### Added

- Initial release of `iyam_ui_kit`
- Theme system:
  - AppTheme
  - Theme presets (light & dark)
  - Design tokens (colors, typography, spacing, radius)
- Button components:
  - Primary, secondary, outline variants
  - Disabled & loading states
- Input components:
  - Text, number, password
  - Currency (rupiah)
  - Prefix & suffix support
  - Thousand separator
- Layout components:
  - Form section
  - Card & surface
- Image components:
  - AppImage (asset, svg, network, cached)
  - Avatar
  - Image grid / gallery
- Feedback components:
  - Toast (success, info, warning, error)
  - Toast queue & position handling
  - Badge, label, chips
  - Shimmer / skeleton loading
- Dark mode auto adaptation
