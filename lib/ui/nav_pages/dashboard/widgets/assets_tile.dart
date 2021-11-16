import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trove/models/user_portfolio.dart';
import 'package:trove/utils/styles.dart';

class AssertCard extends StatelessWidget {
  final int index;
  final bool busy;
  const AssertCard({Key? key, required this.index, required this.busy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgets = [
      listItem(
          index: '2',
          title: 'Your total asset portfolio',
          value: '10000',
          keys: const ValueKey(1)),
      listItem(
          index: '5',
          title: Provider.of<List<UserPortfolio>>(context)[1].symbol!,
          value: Provider.of<List<UserPortfolio>>(context)[1].equityValue!,
          keys: const ValueKey(2)),
      listItem(
          index: '3',
          title: Provider.of<List<UserPortfolio>>(context)[2].symbol!,
          value: Provider.of<List<UserPortfolio>>(context)[2].equityValue!,
          keys: const ValueKey(3)),
      listItem(
          index: '4',
          title: Provider.of<List<UserPortfolio>>(context)[0].symbol!,
          value: Provider.of<List<UserPortfolio>>(context)[0].equityValue!,
          keys: const ValueKey(4)),
    ];

    return Container(
      height: 125,
      //TODO ADD GRADIENTS AND IMPLEMENT
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        gradient: LinearGradient(
            begin: Alignment(-2.1384785175323486, 0.02271915040910244),
            end: Alignment(-0.02271915040910244, -0.013923936523497105),
            colors: [
              Color.fromRGBO(254, 87, 98, 1),
              Color.fromRGBO(255, 107, 161, 1)
            ]),
      ),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          //TODO FIX ANIMATION SWITCHER
          child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween(
                    begin: const Offset(1.0, 0.0),
                    end: const Offset(0.0, 0.0),
                    // begin: const Offset(-1.0, 0.0),
                    // end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              child: busy ? Text('') : widgets[index])),
    );
  }

  Widget listItem(
      {required String title,
      String? path,
      required String value,
      required String index,
      keys}) {
    return Column(
        key: keys,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          path != null
              ? SvgPicture.asset(path)
              : const SizedBox(
                  height: 0,
                ),
          SizedBox(height: path != null ? 8 : 0),
          Text(
            busy ? '----' : title,
            style: AppTextStyle.whiteNormal16,
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: SizedBox(
              height: 32,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    busy ? '' : '\$ $value',
                    style: AppTextStyle.white600_32,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Visibility(
                    visible: !busy,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SvgPicture.asset(
                          'assets/icons/up_arrow.svg',
                        )),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    busy ? '----' : '+ $index%',
                    style: AppTextStyle.whiteNormal12,
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
