import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trove/ui/shared/custom_rich_text.dart';
import 'package:trove/ui/shared/custom_textfield.dart';
import 'package:trove/ui/shared/long_button.dart';
import 'package:trove/utils/styles.dart';

class RecoverPassword extends StatelessWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              'Password Recovery',
              style: AppTextStyle.blackBold24,
            ),
            const SizedBox(
              height: 16,
            ),
            Opacity(
              opacity: 0.6,
              child: Text(
                'Enter your phone number to recover your password',
                style: AppTextStyle.black500_14,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Phone number',
              style: AppTextStyle.grey500_12,
            ),
            const CustomTextField(
              keyboardType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              autoCorrect: false,
              obscureText: false,
              hintText: 'Email or username',
            ),
            const SizedBox(
              height: 40,
            ),
            LongButton(onPressed: () {}, label: 'CONTINUE'),
            const SizedBox(
              height: 12,
            ),
          ]),
        ),
      ),
    );
  }
}
