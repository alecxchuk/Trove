import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/ui/shared/custom_rich_text.dart';
import 'package:trove/ui/shared/custom_textfield.dart';
import 'package:trove/ui/shared/long_button.dart';
import 'package:trove/ui/shared/progress_indicator.dart';
import 'package:trove/ui/views/base_widget/base_widget.dart';
import 'package:trove/ui/views/signup/signup_viewmodel.dart';
import 'package:trove/utils/mixins/validators_mixin.dart';
import 'package:trove/utils/styles.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with ValidatorMixin {
  final SignupViewModel model = serviceLocator<SignupViewModel>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SignupViewModel>(
        model: model,
        //onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
            body: model.busy
                ? const CicularProgress()
                : SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              Text(
                                'Getting Started',
                                style: AppTextStyle.blackBold24,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Opacity(
                                opacity: 0.6,
                                child: Text(
                                  'Create an account to continue',
                                  style: AppTextStyle.black500_14,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                'Email',
                                style: AppTextStyle.grey500_12,
                              ),
                              CustomTextField(
                                controller: _emailController,
                                validator: (input) => validateEmail(input),
                                keyboardType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                                autoCorrect: false,
                                obscureText: false,
                                hintText: 'Email or username',
                                prefixIcon: SvgPicture.asset(
                                    'assets/icons/person.svg',
                                    width: 24,
                                    height: 24,
                                    semanticsLabel: 'person'),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                'Password',
                                style: AppTextStyle.grey500_12,
                              ),
                              CustomTextField(
                                controller: _passwordController,
                                validator: (input) => validatePassword(input),
                                keyboardType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                                autoCorrect: false,
                                obscureText: true,
                                hintText: 'Password',
                                prefixIcon: SvgPicture.asset(
                                    'assets/icons/lock.svg',
                                    width: 24,
                                    height: 24,
                                    semanticsLabel: 'lock'),
                                suffixIcon: SvgPicture.asset(
                                    'assets/icons/eye.svg',
                                    semanticsLabel: 'eye'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Checkbox(
                                          value: true,
                                          onChanged: (checked) {})),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Flexible(
                                    child: AuthText(
                                        onPressed: () {},
                                        label:
                                            'By creating an account, you agree to our terms and conditions',
                                        label2: 'Terms and Conditions'),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              LongButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      model.signup(_emailController.text,
                                          _passwordController.text);
                                      //model.doThings();
                                    }
                                    //model.nToOtp();
                                  },
                                  label: 'SIGN UP'),
                              const SizedBox(
                                height: 12,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: AuthText(
                                  label: 'Already have an account? ',
                                  label2: 'Sign in',
                                  onPressed: () {
                                    model.nToLogin();
                                  },
                                ),
                              )
                            ]),
                      ),
                    ),
                  )));
  }
}
