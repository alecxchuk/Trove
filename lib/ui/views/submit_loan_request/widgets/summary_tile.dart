import 'package:flutter/material.dart';
import 'package:trove/ui/shared/ui_helpers.dart';
import 'package:trove/utils/styles.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard(
      {Key? key,
      required this.loanAmount,
      required this.loanDuration,
      required this.totalDue,
      required this.interest})
      : super(key: key);
  final String loanAmount;
  final String loanDuration;
  final String totalDue;
  final String interest;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            //width: MediaQuery.of(context).size.width * .8,
            children: [
              row('Loan Amount', 'Duration', '\$ $loanAmount',
                  '$loanDuration months'),
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
              row('Interest', 'Total Due', '\$ $interest', '\$ $totalDue'),
            ]),
      ),
    );
  }

  Widget row(label1, label2, value1, value2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label1),
              UIHelper.verticalSpaceSmall,
              Text(
                value1,
                style: AppTextStyle.blackBold20,
              )
            ],
          ),
        ),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label2),
              UIHelper.verticalSpaceSmall,
              Text(
                value2,
                style: AppTextStyle.blackBold20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
