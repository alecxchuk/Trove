// import 'package:flutter/material.dart';
// import 'package:trove/app/app.locator.dart';
// import 'package:trove/models/alert_request.dart';
// import 'package:trove/services/app_services/dialog_service.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

// class DialogManager extends StatefulWidget {
//   final Widget child;
//   const DialogManager({Key? key, required this.child}) : super(key: key);

//   @override
//   _DialogManagerState createState() => _DialogManagerState();
// }

// class _DialogManagerState extends State<DialogManager> {
//   final DialogService _dialogService = serviceLocator<DialogService>();

//   @override
//   void initState() {
//     super.initState();
//     _dialogService.registerDialogListener(_showDialog);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }

//   // void _showDialog(AlertRequest request) {
//   //   AlertDialog(
//   //     title: Text(
//   //       request.title,
//   //     ),
//   //     content: Text(request.description),
//   //     //buttons?
//   //     actions: <Widget>[
//   //       ElevatedButton(
//   //         child: Text(request.buttonTitle),
//   //         onPressed: () {
//   //           Navigator.of(context).pop();
//   //         }, //closes popup
//   //       ),
//   //     ],
//   //   );
//   // }
//   void _showDialog(AlertRequest request) {
//     Alert(
//         context: context,
//         title: request.title,
//         desc: request.description,
//         closeFunction: () => _dialogService.dialogComplete(),
//         buttons: [
//           DialogButton(
//             child: Text(request.buttonTitle),
//             onPressed: () {
//               _dialogService.dialogComplete();
//               Navigator.of(context).pop();
//             },
//           )
//         ]).show();
//   }
// }

import 'package:flutter/material.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/models/alert_request.dart';
import 'package:trove/models/alert_response.dart';
import 'package:trove/services/app_services/dialog_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogManager extends StatefulWidget {
  final Widget? child;
  const DialogManager({Key? key, this.child}) : super(key: key);

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final DialogService _dialogService = serviceLocator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  void _showDialog(AlertRequest request) {
    Alert(
        context: context,
        title: request.title,
        desc: request.description,
        closeFunction: () =>
            _dialogService.dialogComplete(AlertResponse(confirmed: false)),
        buttons: [
          DialogButton(
            child: Text(request.buttonTitle),
            onPressed: () {
              _dialogService.dialogComplete(AlertResponse(confirmed: true));
              Navigator.of(context).pop();
            },
          )
        ]).show();
  }
}
