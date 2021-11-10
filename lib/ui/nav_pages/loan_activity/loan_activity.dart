import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/models/loan_history.dart';
import 'package:trove/models/loan_model.dart';
import 'package:trove/ui/nav_pages/loan_activity/loan_activity_vm.dart';
import 'package:trove/ui/shared/app_bar.dart';
import 'package:trove/ui/shared/long_button.dart';
import 'package:trove/ui/shared/progress_indicator.dart';
import 'package:trove/ui/views/base_widget/base_widget.dart';
import 'package:trove/utils/styles.dart';

import 'widgets/loan_tile.dart';

class LoanActivity extends StatelessWidget {
  final LoanActivityVm model = serviceLocator<LoanActivityVm>();
  LoanActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<List<LoanHistoryModel>>(context);
    return BaseWidget<LoanActivityVm>(
      model: model,
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: model.busy
            ? const CircularProgress()
            : SingleChildScrollView(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height,
                      child: provider.isEmpty
                          ? Center(
                              child: Text(
                              'No Loans yet',
                              style: AppTextStyle.black500_16,
                            ))
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: provider.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: LoanTile(
                                      title: 'Quick loan',
                                      payStatus: index == 0 ? 'Unpaid' : 'Paid',
                                      date: provider[index].createdAt,
                                      loanAmount:
                                          '\$ ${provider[index].loanAmount}'),
                                );
                              })
                      // Column(
                      //   //crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     const SizedBox(
                      //       height: 16,
                      //     ),
                      //     LoanTile(
                      //         title: 'Nano loan',
                      //         payStatus: 'Unpaid',
                      //         date: 'Approved 15/10/2021',
                      //         loanAmount: '\$ 3000'),
                      //     const SizedBox(
                      //       height: 16,
                      //     ),
                      //     LoanTile(
                      //         title: 'Business loan',
                      //         payStatus: 'Paid',
                      //         date: 'Approved 07/3/2021',
                      //         loanAmount: '\$ 5000'),
                      //   ],
                      // ),
                      ),
                ),
              ),
      ),
    );
  }
}
