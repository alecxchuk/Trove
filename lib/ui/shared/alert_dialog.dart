import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<dynamic> alertDialog({
  required BuildContext context,
}) {
  return showDialog(
      context: context,
      barrierDismissible:
          false, // disables popup to close if tapped outside popup (need a button to close)
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "title",
          ),
          content: Text("your text here"),
          //buttons?
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              }, //closes popup
            ),
          ],
        );
      });
}
