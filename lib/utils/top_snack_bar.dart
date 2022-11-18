import 'package:kochure_quiz_app/utils/show_top_bar.dart';

import '../app.dart';
import 'custom_snack_bar.dart';

void topSnack({
  required BuildContext context,
  required String message,
  required bool isError,
  int? duration,
}) =>
    showTopSnackBar(
      context,
      isError
          ? CustomSnackBar.error(
              message: message,
            )
          : CustomSnackBar.success(
              message: message,
            ),
      displayDuration: Duration(milliseconds: duration ?? 1500),
    );
