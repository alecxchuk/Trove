import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/ui/shared/long_button.dart';
import 'package:trove/utils/styles.dart';

import 'otp_viewmodel.dart';

class Otp extends StatelessWidget {
  final OtpViewModel model = serviceLocator<OtpViewModel>();
  Otp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<OtpViewModel>(
            create: (context) => model,
            child: Consumer<OtpViewModel>(builder: (context, model, child) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Text(
                          'OTP Authentication',
                          style: AppTextStyle.blackBold24,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Opacity(
                          opacity: 0.6,
                          child: Text(
                            'An Authentication code has been sent to (+234) 8143838405',
                            style: AppTextStyle.black500_14,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        PinCodeTextField(
                          keyboardAppearance: Brightness.light,
                          autoFocus: true,
                          keyboardType: TextInputType.number,
                          appContext: context,
                          //controller: _otpEditingController,
                          length: 6,
                          //focusNode: _otpFocusNode,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          enablePinAutofill: true,
                          cursorHeight: 25,
                          pinTheme: PinTheme(
                            borderWidth: 1,
                            fieldWidth: 50,
                            shape: PinCodeFieldShape.underline,
                            activeColor: Colors.red,
                            inactiveColor: Colors.red,
                            activeFillColor: Colors.transparent,
                            selectedColor: Colors.red,
                            selectedFillColor: Colors.transparent,
                            inactiveFillColor: Colors.transparent,
                          ),
                          animationDuration: const Duration(milliseconds: 0),
                          enableActiveFill: true,
                          onCompleted: (v) {
                            //_otpEditingController.clear();
                          },
                          onChanged: (value) {},
                          beforeTextPaste: (text) {
                            return true;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        LongButton(
                            onPressed: () {
                              model.nToDashboard();
                            },
                            label: 'CONTINUE'),
                        const SizedBox(
                          height: 12,
                        ),
                      ]),
                ),
              );
            })));
  }
}
