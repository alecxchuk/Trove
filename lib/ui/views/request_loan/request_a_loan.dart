import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/ui/shared/app_bar.dart';
import 'package:trove/ui/shared/long_button.dart';
import 'package:trove/ui/shared/shared.dart';
import 'package:trove/ui/views/request_loan/request_loan_vm.dart';
import 'package:trove/utils/styles.dart';

class RequestLoan extends StatelessWidget {
  final RequestLoanViewModel model = serviceLocator<RequestLoanViewModel>();
  RequestLoan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Request a specific amount',
          leading: Icons.arrow_back_ios_new,
        ),
        body: ChangeNotifierProvider<RequestLoanViewModel>(
            create: (context) => model,
            child: Consumer<RequestLoanViewModel>(
                builder: (context, model, child) {
              return Container(
                height: MediaQuery.of(context).size.height,
                color: AppColors.appwhite,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
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
                                'Fill in the following options to establish how much you want to borrow and for how long',
                                style: AppTextStyle.whiteNormal16,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              loanLabel('Loan amount',
                                  '\$ ${model.loanAmount.toStringAsFixed(0)}'),
                              slider(model.loanAmount, 100, 6000, 60,
                                  model.setLoanAmount),
                              loanLabel('\$ 0', '\$ 6000'),
                              const SizedBox(
                                height: 16,
                              ),
                              loanLabel('Loan term',
                                  '${model.loanDuration.toStringAsFixed(0)} months'),
                              slider(model.loanDuration, 6, 12, 16,
                                  model.setLoanDuration),
                              loanLabel('6 months', '12 months'),
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
                          '\$ ${model.interest.toStringAsFixed(2)}',
                          'Interest'),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: loanDetailTile(
                          '\$ ${model.totalDue.toStringAsFixed(2)}',
                          'Total Due'),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: LongButton(
                            onPressed: () {
                              model.nToSubmitLoan();
                            },
                            label: 'Continue'))
                  ]),
                ),
              );
            })));
  }

  Widget loanDetailTile(String amount, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyle.greyNormal14,
            ),
            Text(
              amount,
              style: AppTextStyle.blackBold24,
            )
          ],
        ),
        const Text('View Details')
      ],
    );
  }

  Widget slider(amount, double min, double max, int divisions,
      Function(double message) onChange) {
    return Slider(
      min: min,
      max: max,
      //divisions: divisions,
      inactiveColor: Colors.amber,
      onChanged: (value) {
        onChange(value);
      },
      value: amount,
      activeColor: Colors.green,
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
