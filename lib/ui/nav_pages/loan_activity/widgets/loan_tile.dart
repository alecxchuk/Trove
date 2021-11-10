import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trove/utils/styles.dart';

class LoanTile extends StatelessWidget {
  const LoanTile(
      {Key? key,
      required this.title,
      required this.payStatus,
      required this.date,
      required this.loanAmount})
      : super(key: key);
  final String title;
  final String payStatus;
  final String date;
  final String loanAmount;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            //width: MediaQuery.of(context).size.width * .8,
            children: [
              row1(),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                height: 12,
                color: Colors.amber,
              ),
              const SizedBox(
                height: 8,
              ),
              row(),
            ]),
      ),
    );
  }

  Widget row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: SvgPicture.asset(
            'assets/icons/card.svg',
            width: 32,
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                loanAmount,
                style: AppTextStyle.blackBold24,
              ),
              Text(date),
            ],
          ),
        ),
      ],
    );
  }

  Widget row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.blackBold24,
        ),
        Text(
          payStatus,
          style: payStatus == 'Paid'
              ? AppTextStyle.greenNormal14
              : AppTextStyle.redNormal14,
        ),
      ],
    );
  }
}
