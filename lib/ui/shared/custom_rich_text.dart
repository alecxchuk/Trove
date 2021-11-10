import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trove/utils/styles.dart';

class AuthText extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final String label2;

  const AuthText({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.label2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyle.blackBold14,
        children: <TextSpan>[
          TextSpan(text: label, style: AppTextStyle.greyNormal14),
          TextSpan(
              text: label2,
              //style: TextStyle(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = () => onPressed()),
        ],
      ),
    );
  }
}
