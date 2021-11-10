import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      height: 50,
      width: 50,
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    ));
  }
}
