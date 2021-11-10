import 'dart:async';

import 'package:trove/models/snack_request.dart';
import 'package:trove/utils/enums.dart';

class SnackbarService {
  Function(SnackRequest)? _showSnackbarListener;
  Completer? _snackCompleter;

  /// Registers a callback function. Typically to show the dialog
  void registerDialogListener(Function(SnackRequest) showSnackbarListener) {
    _showSnackbarListener = showSnackbarListener;
  }

  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  showSnackbar({
    required String? content,
    Duration? duration = const Duration(seconds: 3),
    SnackbarType? variant = SnackbarType.success,
  }) {
    _snackCompleter = Completer();
    _showSnackbarListener!(SnackRequest(
        content: content!, duration: duration!, variant: variant!));
    return _snackCompleter!.future;
  }

  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete() {
    _snackCompleter!.complete();
    _snackCompleter = null;
  }
}
