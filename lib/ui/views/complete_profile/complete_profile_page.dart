import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/ui/shared/progress_indicator.dart';
import 'package:trove/ui/shared/ui_helpers.dart';
import 'package:trove/ui/views/complete_profile/widgets/bank_details.dart';
import 'package:trove/ui/views/complete_profile/widgets/basic.dart';
import 'package:trove/utils/colors.dart';
import 'package:trove/utils/mixins/validators_mixin.dart';

import 'complete_profile_page_viewmodel.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({Key? key}) : super(key: key);

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<CompleteProfilePage> with ValidatorMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Editing controllers
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  // View model
  final CompleteProfileViewModel model =
      serviceLocator<CompleteProfileViewModel>();

  StepperType stepperType = StepperType.horizontal;

  @override
  void dispose() {
    super.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _phoneController.dispose();
    _accountNameController.dispose();
    _accountNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Complete Profile'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<CompleteProfileViewModel>(
          create: (context) => model,
          child: Consumer<CompleteProfileViewModel>(
              builder: (context, model, child) {
            return model.busy
                ? const CircularProgress()
                : Column(
                    children: [
                      Expanded(
                        child: Stepper(
                          type: stepperType,
                          physics: const ScrollPhysics(),
                          currentStep: model.currentStep,
                          onStepTapped: (step) => tapped(step),
                          onStepContinue: continued,
                          onStepCancel: cancel,
                          steps: <Step>[
                            Step(
                              title: const Text('Basic'),
                              content: BasicInfo(
                                gender: model.gender,
                                setGender: model.setGender,
                                togglePicker: model.toggleDatePickerVisibility,
                                model: model,
                                firstController: _firstnameController,
                                lastController: _lastnameController,
                                phoneController: _phoneController,
                                accountNameVal: (input) =>
                                    validateNotEmptyField(input),
                                accountNumberVal: (input) =>
                                    accountNumberValidation(input),
                                phoneNumberVal: (input) =>
                                    phonenumberValidation(input),
                                formKey: _formKey,
                              ),
                              isActive: model.currentStep >= 0,
                              state: model.currentStep >= 0
                                  ? StepState.complete
                                  : StepState.disabled,
                            ),
                            Step(
                              title: const Text('Bank'),
                              content: BankInfo(
                                banks: model.banks,
                                setBank: model.selectBank,
                                bank: model.bank,
                                firstController: _accountNameController,
                                lastController: _accountNumberController,
                                accountNameVal: (input) =>
                                    validateNotEmptyField(input),
                                accountNumberVal: (input) =>
                                    accountNumberValidation(input),
                                formKey: _formKey,
                              ),
                              isActive: model.currentStep >= 0,
                              state: model.currentStep >= 1
                                  ? StepState.complete
                                  : StepState.disabled,
                            ),
                            Step(
                              title: const Text('Finish'),
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.check_circle,
                                    size: 80,
                                    color: AppColors.appGreen,
                                  ),
                                  UIHelper.verticalSpace40,
                                  Text('Profile Update completed')
                                ],
                              ),
                              isActive: model.currentStep >= 0,
                              state: model.currentStep >= 2
                                  ? StepState.complete
                                  : StepState.disabled,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          })),
    );
  }

  tapped(int step) {
    model.setStep(step);
  }

  continued() async {
    var currentStep = model.currentStep;

    if (currentStep == 0) {
      if (_formKey.currentState!.validate()) {
        model.setStep(model.currentStep + 1);
      }
    } else if (currentStep == 1) {
      if (_formKey.currentState!.validate()) {
        var success = await model.updateProfile(
          _firstnameController.text,
          _lastnameController.text,
          _phoneController.text,
          model.bank,
          _accountNameController.text,
          _accountNumberController.text,
          model.selectedDate,
        );
        if (success) {
          model.setStep(model.currentStep + 1);
        }
      }
    } else {
      model.nToDashboard();
    }
  }

  cancel() {
    model.currentStep > 0 ? model.setStep(model.currentStep - 1) : null;
  }
}
