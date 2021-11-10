// import 'dart:async';

// import 'package:trove/models/alert_request.dart';
// import 'package:trove/models/alert_response.dart';

// class DialogService {
//   Function(AlertRequest)? _showDialogListener;
//   Completer<AlertResponse>? _dialogCompleter;

//   /// Registers a callback function. Typically to show the dialog
//   void registerDialogListener(Function(AlertRequest) showDialogListener) {
//     _showDialogListener = showDialogListener;
//   }

//   /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
//   Future<AlertResponse> showDialog({
//     String? title,
//     String? description = '',
//     String? buttonTitle = 'Ok',
//   }) {
//     _dialogCompleter = Completer<AlertResponse>();
//     _showDialogListener!(AlertRequest(
//       title: title ?? 'sdc',
//       description: description ?? 'dvv',
//       buttonTitle: buttonTitle ?? 'ascas',
//     ));
//     return _dialogCompleter!.future;
//   }

//   /// Completes the _dialogCompleter to resume the Future's execution call
//   void dialogComplete(AlertResponse response) {
//     _dialogCompleter!.complete(response);
//     _dialogCompleter = null;
//   }
// }

import 'dart:async';

class DialogService {
  Function? _showDialogListener;
  Completer? _dialogCompleter;

  /// Registers a callback function. Typically to show the dialog
  void registerDialogListener(Function showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future showDialog() {
    _dialogCompleter = Completer();
    _showDialogListener!();
    return _dialogCompleter!.future;
  }

  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete() {
    _dialogCompleter!.complete();
    _dialogCompleter = null;
  }
}
