import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trove/ui/shared/shared.dart';
import 'package:trove/utils/styles.dart';

class QuickLink extends StatelessWidget {
  final VoidCallback nToLoanRequest;
  final VoidCallback nToLoanPayment;
  // final VoidCallback nToLoanBreakdown;
  // final VoidCallback nToAddPaymentAccount;
  const QuickLink(
      {Key? key, required this.nToLoanRequest, required this.nToLoanPayment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: Card(
        elevation: 0,
        // color: Colors.transparent,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(15),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                'Quick Links',
                style: AppTextStyle.blackBold24,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Flexible(
              child: StaggeredGridView.countBuilder(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () {
                    switch (index) {
                      case 0:
                        break;
                      case 1:
                        break;
                      case 2:
                        break;
                      default:
                        nToLoanRequest();
                        break;
                    }
                    //if (index == 3) {
                    //nToLoanRequest();
                    //}
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      gradient: index == 0
                          ? const LinearGradient(
                              begin: Alignment(-0.36698463559150696, 0.6823118329048157),
                              end: Alignment(-0.6823118329048157, -0.5906580090522766),
                              colors: [
                                  Color.fromRGBO(0, 0, 0, 1),
                                  Color.fromRGBO(103, 103, 103, 1)
                                ])
                          : index == 1
                              ? const LinearGradient(
                                  begin: Alignment(
                                      -0.36698463559150696, 0.6823118329048157),
                                  end: Alignment(
                                      -0.6823118329048157, -0.5906580090522766),
                                  colors: [
                                      Color.fromRGBO(231, 10, 10, 1),
                                      Color.fromRGBO(219, 79, 0, 1)
                                    ])
                              : index == 2
                                  ? const LinearGradient(
                                      begin:
                                          Alignment(-0.36698463559150696, 0.6823118329048157),
                                      end: Alignment(-0.6823118329048157, -0.5906580090522766),
                                      colors: [
                                          Color.fromRGBO(69, 24, 219, 1),
                                          Color.fromRGBO(122, 41, 255, 1)
                                        ])
                                  : const LinearGradient(
                                      begin: Alignment(-2.1384785175323486,
                                          0.02271915040910244),
                                      end: Alignment(-0.02271915040910244,
                                          -0.013923936523497105),
                                      colors: [
                                          Color.fromRGBO(254, 87, 98, 1),
                                          Color.fromRGBO(255, 107, 161, 1)
                                        ]),
                    ),
                    child: quickListTile(getQuickLinkData(index)['icon']!,
                        getQuickLinkData(index)['label']!),
                  ),
                ),
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 2 : 1.5),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget quickListTile(String icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: SvgPicture.asset(
              icon,
              color: AppColors.appwhite,
              width: 60,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: Text(
              label,
              style: AppTextStyle.whiteNormal14,
            ),
          )
        ],
      ),
    );
  }

  Map<dynamic, String> getQuickLinkData(int index) {
    switch (index) {
      case 0:
        return const {
          'icon': 'assets/icons/loan_breakdown.svg',
          'label': 'Loan breakdowns'
        };
      case 1:
        return const {
          'icon': 'assets/icons/money.svg',
          'label': 'Make a loan payment'
        };
      // case 2:
      //   return const DmPage();
      case 2:
        return const {
          'icon': 'assets/icons/plus_button.svg',
          'label': 'Add payment account'
        };
      default:
        return const {
          'icon': 'assets/icons/loan.svg',
          'label': 'Apply for a loan'
        };
    }
  }
}
