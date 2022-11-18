import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:kochure_quiz_app/utils/top_snack_bar.dart';

/// Connectivity represents a singleton helper for retrieving connectivity
/// from the internet
class Connectivity {
  static final instance = Connectivity._internal();

  // internal constructor
  Connectivity._internal();

  /// Returns true if connected, false otherwise
  Future<bool> isConnected(context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (e) {
      debugPrint('Unable to read connectivity from internet, $e');
      topSnack(context: context, message: e.message, isError: true);
      return false;
    }
  }
}
