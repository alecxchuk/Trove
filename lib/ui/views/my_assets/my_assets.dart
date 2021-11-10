import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trove/models/user_portfolio.dart';
import 'package:trove/ui/shared/shared.dart';
import 'package:trove/ui/shared/ui_helpers.dart';
import 'package:trove/utils/styles.dart';

class MyAssets extends StatelessWidget {
  final String? totalAssets;
  final VoidCallback navToLoan;
  const MyAssets({Key? key, this.totalAssets, required this.navToLoan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .7,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('My Assets', style: AppTextStyle.blackBold24),
              UIHelper.horizontalSpaceLarge,
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel_rounded,
                      color: AppColors.appGrey))
            ],
          )),
          UIHelper.verticalSpaceMedium,
          UIHelper.verticalSpaceSmall,
          Flexible(
              child: Text(
            'Your total asset portfolio',
            style: AppTextStyle.greyNormal16,
          )),
          Flexible(
              child: Row(
            children: [
              Text(
                totalAssets ?? '\$ 10,000',
                style: AppTextStyle.blackBold32,
              ),
              UIHelper.horizontalSpaceSmall,
              SvgPicture.asset(
                'assets/icons/up_arrow.svg',
                color: AppColors.appGreen,
              ),
              UIHelper.horizontalSpace4,
              Text(
                '+ 2%',
                style: AppTextStyle.greenNormal12,
              ),
            ],
          )),
          UIHelper.verticalSpace40,
          Flexible(
              child: Text(
            'My Portfolio',
            style: AppTextStyle.blackBold24,
          )),
          UIHelper.verticalSpaceMedium,
          stockTile('', 'AAPL',
              Provider.of<List<UserPortfolio>>(context)[1].equityValue!, 0),
          UIHelper.verticalSpaceSmall,
          stockTile('', 'AMZN',
              Provider.of<List<UserPortfolio>>(context)[2].equityValue!, 1),
          UIHelper.verticalSpaceSmall,
          stockTile('', 'TSLA',
              Provider.of<List<UserPortfolio>>(context)[0].equityValue!, 2),
          UIHelper.verticalSpaceSmall,
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => navToLoan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Take a loan', style: AppTextStyle.orangeNormal14),
                  UIHelper.horizontalSpaceSmall,
                  const Icon(Icons.arrow_forward, color: AppColors.appOrange)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget stockTile(
      String iconPath, String stockName, String stockPrice, int index) {
    return Container(
        height: 64,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          gradient: index == 0
              ? const LinearGradient(
                  begin: Alignment(-0.527920663356781, 0.5924132466316223),
                  end: Alignment(-0.41658008098602295, -0.522767186164856),
                  colors: [
                      Color.fromRGBO(0, 0, 0, 1),
                      Color.fromRGBO(103, 103, 103, 1)
                    ])
              : index == 1
                  ? const LinearGradient(
                      begin: Alignment(-0.4723811447620392, 0.592414140701294),
                      end: Alignment(-0.463242769241333, -0.520132303237915),
                      colors: [
                          Color.fromRGBO(0, 56, 255, 1),
                          Color.fromRGBO(92, 225, 255, 1)
                        ])
                  : const LinearGradient(
                      begin:
                          Alignment(-0.36698463559150696, 0.6823118329048157),
                      end: Alignment(-0.6823118329048157, -0.5906580090522766),
                      colors: [
                          Color.fromRGBO(255, 128, 108, 1),
                          Color.fromRGBO(255, 91, 0, 1)
                        ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/amazon_icon.svg'),
              UIHelper.horizontalSpace25,
              Text(
                stockName,
                style: AppTextStyle.white600_18,
              ),
              const Spacer(),
              Text('\$ $stockPrice', style: AppTextStyle.white600_14),
            ],
          ),
        ));
  }
}
