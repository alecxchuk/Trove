import 'package:flutter/material.dart';
import 'package:trove/utils/styles.dart';

import './shared.dart';

class LongButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Color? labelColor;
  final Color? outlineColor;
  final double? height;
  final double? width;

  const LongButton({
    Key? key,
    this.labelColor,
    required this.onPressed,
    required this.label,
    this.outlineColor,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      fillColor: outlineColor ?? Colors.amberAccent,
      constraints: BoxConstraints.tightFor(
        height: height ?? 48,
        width: width ?? MediaQuery.of(context).size.width.clamp(240.0, 560.0),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: FittedBox(
        child: Text(
          label,
          style: AppTextStyle.blackBold14,
        ),
      ),
    );
  }
}

// Container(
//               height: 48,
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//                 gradient: LinearGradient(
//                     begin: Alignment(6.123234262925839e-17, 1),
//                     end: Alignment(-1, 6.123234262925839e-17),
//                     colors: [
//                       Color.fromRGBO(169, 94, 250, 1),
//                       Color.fromRGBO(138, 73, 247, 1)
//                     ]),
//               ))