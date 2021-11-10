import 'package:flutter/material.dart';
import 'package:trove/ui/shared/app_bar.dart';
import 'package:trove/ui/shared/long_button.dart';
import 'package:trove/utils/styles.dart';

import 'widgets/loan_tile.dart';

class LoanActivity extends StatelessWidget {
  const LoanActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //   title: 'Loan Activity',
      //   leading: Icons.arrow_back_ios_new,
      // ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                LoanTile(
                    title: 'Nano loan',
                    payStatus: 'Unpaid',
                    date: 'Approved 15/10/2021',
                    loanAmount: '\$ 3000'),
                const SizedBox(
                  height: 16,
                ),
                LoanTile(
                    title: 'Business loan',
                    payStatus: 'Paid',
                    date: 'Approved 07/3/2021',
                    loanAmount: '\$ 5000'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
