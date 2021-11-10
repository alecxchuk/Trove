import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/models/user_model.dart';
import 'package:trove/ui/shared/app_bar.dart';
import 'package:trove/ui/shared/long_button.dart';
import 'package:trove/ui/shared/shared.dart';
import 'package:trove/ui/views/submit_loan_request/widgets/summary_tile.dart';
import 'package:trove/utils/colors.dart';
import 'package:trove/utils/styles.dart';

import 'submit_loan_request_view_model.dart';

class SubmitLoan extends StatelessWidget {
  final SubmitLoanViewModel model = serviceLocator<SubmitLoanViewModel>();
  SubmitLoan(
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
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Submit Loan request',
          leading: Icons.arrow_back_ios_new,
        ),
        body: ChangeNotifierProvider<SubmitLoanViewModel>(
            create: (context) => model,
            child:
                Consumer<SubmitLoanViewModel>(builder: (context, model, child) {
              return Container(
                height: MediaQuery.of(context).size.height,
                color: AppColors.appwhite,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: AppColors.appwhite,
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Repayments will be automatically collected from the debit card linked to your account',
                                style: AppTextStyle.greyNormal16,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SummaryCard(
                                  loanAmount: loanAmount,
                                  loanDuration: loanDuration,
                                  totalDue: totalDue,
                                  interest: interest),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: loanDetailTile(
                          Provider.of<User>(context).bankUsername!,
                          'Account Name'),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: loanDetailTile(
                          Provider.of<User>(context).bankName!,
                          'Bank Account Information',
                          context),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: loanDetailTile(
                          Provider.of<User>(context).bankAccountNumber!,
                          'Account Number',
                          context),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: LongButton(
                            onPressed: () {
                              model.nToLoanSuccessful();
                            },
                            label: 'Submit'))
                  ]),
                ),
              );
            })));
  }

  Widget textVal(String text) {
    return Text(
      text,
      style: AppTextStyle.blackBold14,
    );
  }

  Widget loanDetailTile(String text, String label, [context]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.greyNormal14s,
        ),
        Text(
          text,
          style: AppTextStyle.blackBold20,
        )
      ],
    );
  }

  Widget loanLabel(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Text(
            label,
            style: AppTextStyle.whiteNormal16,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: AppTextStyle.whiteNormal16,
          ),
        )
      ],
    );
  }
}
