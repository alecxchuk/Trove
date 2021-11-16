import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/models/loan_history.dart';
import 'package:trove/models/user_model.dart';
import 'package:trove/ui/nav_pages/dashboard/widgets/assets_tile.dart';
import 'package:trove/ui/nav_pages/dashboard/widgets/quick_links.dart';
import 'package:trove/ui/shared/progress_indicator.dart';
import 'package:trove/ui/shared/shared.dart';
import 'package:trove/ui/views/base_widget/base_widget.dart';
import 'package:trove/ui/views/my_assets/my_assets.dart';
import 'package:trove/utils/styles.dart';

import 'dashboard_viewmodel.dart';

class Dashboard extends StatelessWidget {
  final DashboardViewModel model = serviceLocator<DashboardViewModel>();
  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<List<LoanHistoryModel>>(context);
    return BaseWidget<DashboardViewModel>(
        model: DashboardViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
                body: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Stack(clipBehavior: Clip.none, children: [
                  Container(height: 650),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.elliptical(30.0, 30.0),
                        bottomLeft: Radius.elliptical(30.0, 30.0),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9 + 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Flexible(
                              child: Text(
                                'Hello ${Provider.of<User>(context).firstName}',
                                style: AppTextStyle.whiteBold32,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              provider.isEmpty ? 'You have no loans yet' : '',
                              style: AppTextStyle.white500_20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        //color: Colors.green,
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                                onTap: () {
                                  showBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      builder: (context) => MyAssets(
                                          navToLoan: model.nToRequestLoan));
                                },
                                child: model.busy
                                    ? const CircularProgress(
                                        color: AppColors.appwhite)
                                    : AssertCard(
                                        index: model.index, busy: model.busy)),
                            const SizedBox(
                              height: 8,
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: QuickLink(
                                  nToLoanRequest: model.nToRequestLoan,
                                  nToLoanPayment: model.nToRequestLoan),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            )));
  }
}
