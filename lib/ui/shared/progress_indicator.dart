import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final Color? color;
  const CircularProgress({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 50,
      width: 50,
      child: CircularProgressIndicator(
        color: color ?? Colors.blue,
        strokeWidth: 2,
      ),
    ));
  }
}
