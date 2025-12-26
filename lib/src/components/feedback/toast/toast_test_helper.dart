import 'toast_service.dart';
import 'app_toast_variant.dart';
import 'app_toast_position.dart';

class ToastTestHelper {
  static void showAllVariants() {
    ToastService.show(
      ToastRequest(
        message: 'Success toast',
        variant: AppToastVariant.success,
        duration: const Duration(seconds: 2),
        position: AppToastPosition.bottom,
      ),
    );

    ToastService.show(
      ToastRequest(
        message: 'Info toast',
        variant: AppToastVariant.info,
        duration: const Duration(seconds: 2),
        position: AppToastPosition.bottom,
      ),
    );

    ToastService.show(
      ToastRequest(
        message: 'Warning toast',
        variant: AppToastVariant.warning,
        duration: const Duration(seconds: 2),
        position: AppToastPosition.bottom,
      ),
    );

    ToastService.show(
      ToastRequest(
        message: 'Danger toast',
        variant: AppToastVariant.danger,
        duration: const Duration(seconds: 2),
        position: AppToastPosition.bottom,
      ),
    );
  }
}
