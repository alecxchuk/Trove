import 'package:flutter/material.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/models/alert_request.dart';
import 'package:trove/services/app_services/dialog_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  const DialogManager({Key? key, required this.child}) : super(key: key);

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
    return widget.child;
  }

  // void _showDialog(AlertRequest request) {
  //   AlertDialog(
  //     title: Text(
  //       request.title,
  //     ),
  //     content: Text(request.description),
  //     //buttons?
  //     actions: <Widget>[
  //       ElevatedButton(
  //         child: Text(request.buttonTitle),
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         }, //closes popup
  //       ),
  //     ],
  //   );
  // }
  void _showDialog() {
    Alert(
        context: context,
        title: "FilledStacks",
        desc: "Flutter is awesome.",
        closeFunction: () => _dialogService.dialogComplete(),
        buttons: [
          DialogButton(
            child: Text('OkieDoke'),
            onPressed: () {
              _dialogService.dialogComplete();
              Navigator.of(context).pop();
            },
          )
        ]).show();
  }
}
