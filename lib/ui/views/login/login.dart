import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/ui/shared/custom_rich_text.dart';
import 'package:trove/ui/shared/custom_textfield.dart';
import 'package:trove/ui/shared/long_button.dart';
import 'package:trove/ui/views/base_widget/base_widget.dart';
import 'package:trove/ui/views/login/login_viewmodel.dart';
import 'package:trove/utils/mixins/validators_mixin.dart';
import 'package:trove/utils/styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidatorMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginViewModel model = serviceLocator<LoginViewModel>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
        model: model,
        //onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
            body: model.busy
                ? const Center(
                    child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ))
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              Text(
                                'Let\'s Sign You In',
                                style: AppTextStyle.blackBold24,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Opacity(
                                opacity: 0.6,
                                child: Text(
                                  'Welcome back, You\'ve been missed',
                                  style: AppTextStyle.black500_14,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                'Username or email',
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
                                height: 100,
                              ),
                              LongButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      model.login(_emailController.text,
                                          _passwordController.text);
                                    }
                                  },
                                  label: 'SIGN IN'),
                              const SizedBox(
                                height: 12,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: AuthText(
                                  label: 'Don\'t have an account? ',
                                  label2: 'Sign up',
                                  onPressed: () {
                                    model.nToSignup();
                                  },
                                ),
                              )
                            ]),
                      ),
                    ),
                  )));
  }
}
