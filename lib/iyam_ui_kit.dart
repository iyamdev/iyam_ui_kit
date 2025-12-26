library iyam_ui_kit;

//
// ==============================
// THEME
// ==============================
//
export 'src/core/theme/app_theme.dart';
export 'src/core/theme/theme_extensions.dart';
export 'src/core/theme/theme_presets.dart';

//
// ==============================
// CONTEXT EXTENSIONS
// ==============================
//
export 'src/core/extensions/context_extension.dart';

//
// ==============================
// TOKENS (OPTIONAL PUBLIC)
// ==============================
// Jika mau strict, token bisa TIDAK diexport.
// Untuk sekarang diexport agar fleksibel.
//
export 'src/core/tokens/colors.dart';
export 'src/core/tokens/typography.dart';
export 'src/core/tokens/spacing.dart';
export 'src/core/tokens/radius.dart';
export 'src/core/tokens/borders.dart';
export 'src/core/tokens/elevation.dart';
export 'src/core/tokens/opacity.dart';
export 'src/core/tokens/animation.dart';

//
// ==============================
// BUTTONS
// ==============================
//
export 'src/components/buttons/app_button.dart';
export 'src/components/buttons/app_button_variant.dart';
export 'src/components/buttons/app_button_size.dart';

//
// ==============================
// INPUTS
// ==============================
//
export 'src/components/inputs/app_text_field.dart';
export 'src/components/inputs/app_text_form_field.dart';
export 'src/components/inputs/app_input_variant.dart';
export 'src/components/inputs/app_input_size.dart';
export 'src/components/inputs/app_input_type.dart';
export 'src/components/inputs/advanced/app_date_picker_field.dart';
export 'src/components/inputs/advanced/app_select_field.dart';

//
// ==============================
// FORMS
// ==============================
//
export 'src/components/forms/app_form_layout.dart';
export 'src/components/forms/app_form_section.dart';
export 'src/components/forms/app_form_field.dart';

//
// ==============================
// SURFACES & CARDS
// ==============================
//
export 'src/components/surfaces/app_card.dart';
export 'src/components/surfaces/app_card_header.dart';
export 'src/components/surfaces/app_card_footer.dart';
export 'src/components/surfaces/app_surface.dart';

//
// ==============================
// MEDIA / IMAGE
// ==============================
//
export 'src/components/media/app_image.dart';
export 'src/components/media/app_image_source.dart';

// AVATAR & MEDIA
export 'src/components/media/avatar/app_avatar.dart';
export 'src/components/media/gallery/app_image_grid.dart';

// SHIMMER
export 'src/components/states/shimmer/app_shimmer.dart';

// FEEDBACK
export 'src/components/feedback/app_badge.dart';
export 'src/components/feedback/app_label.dart';
export 'src/components/feedback/app_chip.dart';
export 'src/components/feedback/toast/app_toast.dart';
