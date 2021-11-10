import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/ui/shared/long_button.dart';
import 'package:trove/utils/styles.dart';

import 'loan_successful_viewmodel.dart';

class LoanSuccessful extends StatelessWidget {
  final LoanSuccessfulViewModel model =
      serviceLocator<LoanSuccessfulViewModel>();
  LoanSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<LoanSuccessfulViewModel>(
            create: (context) => model,
            child: Consumer<LoanSuccessfulViewModel>(
                builder: (context, model, child) {
              return Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 64),
                        const Icon(
                          Icons.check_circle,
                          size: 160,
                          color: Colors.blueAccent,
                        ),
                        Text(
                          'Successful',
                          style: AppTextStyle.blackBold24,
                        ),
                        Text(
                          'Your loan request has been sent out successful, and will be disbursed in few minutes',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.greyNormal16,
                        ),
                        //const Spacer(),
                        LongButton(
                            onPressed: () {
                              model.nToDashBoard();
                            },
                            label: 'Go back home'),
                        const SizedBox(height: 44),
                      ]),
                ),
              );
            })));
  }
}
