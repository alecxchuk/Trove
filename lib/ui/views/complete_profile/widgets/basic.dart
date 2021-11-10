import 'package:flutter/material.dart';
import 'package:trove/ui/shared/custom_textfield.dart';
import 'package:trove/ui/views/complete_profile/complete_profile_page_viewmodel.dart';
import 'package:trove/utils/colors.dart';
import 'package:trove/utils/styles.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo(
      {Key? key,
      required this.gender,
      required this.setGender,
      required this.togglePicker,
      required this.model,
      required this.firstController,
      required this.lastController,
      required this.phoneController,
      required this.accountNameVal,
      required this.accountNumberVal,
      required this.phoneNumberVal,
      required this.formKey})
      : super(key: key);
  final String gender;
  final Function setGender;
  final Function togglePicker;
  final CompleteProfileViewModel model;
  final TextEditingController firstController;
  final TextEditingController lastController;
  final TextEditingController phoneController;
  final dynamic accountNameVal;
  final dynamic accountNumberVal;
  final dynamic phoneNumberVal;
  final dynamic formKey;
  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
    if (_focus.hasFocus && !widget.model.showDatePicker) {
      widget.togglePicker();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          textAndField('First name', 'Please enter first name',
              widget.accountNameVal, widget.firstController),
          const SizedBox(
            height: 16,
          ),
          textAndField('Last name', 'Please enter last name',
              widget.accountNameVal, widget.lastController),
          const SizedBox(
            height: 16,
          ),
          textAndField('Phone number', 'Please enter phone number here',
              widget.phoneNumberVal, widget.phoneController, true),
          const SizedBox(
            height: 16,
          ),
          datePicker(),
          const SizedBox(
            height: 16,
          ),
          dropdown()
        ],
      ),
    );
  }

  Widget textAndField(label, hintText, validator, [controller, bool? phone]) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: AppTextStyle.grey500_12,
      ),
      const SizedBox(
        height: 12,
      ),
      SizedBox(
        //height: 48,
        child: CustomTextField(
            controller: controller,
            validator: validator,
            keyboardType:
                phone != null ? TextInputType.number : TextInputType.text,
            inputAction: TextInputAction.next,
            outlinedBorder: true,
            autoCorrect: false,
            obscureText: false,
            hintText: hintText),
      )
    ]);
  }

  Widget dropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: AppTextStyle.grey500_12,
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.appGrey),
              borderRadius: BorderRadius.circular(4)),
          child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
            value: widget.gender,
            isExpanded: true,
            isDense: true,
            itemHeight: 50,
            items: <String>['Female', 'Male'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(value, style: AppTextStyle.greyNormal16),
                ),
              );
            }).toList(),
            onChanged: (String? gender) {
              widget.setGender(gender);
            },
          )),
        ),
      ],
    );
  }

  Widget datePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of birth',
          style: AppTextStyle.grey500_12,
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 48,
          child: CustomTextField(
            onTap: () => widget.togglePicker(),
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            outlinedBorder: true,
            autoCorrect: false,
            obscureText: false,
            readOnly: true,
            focus: _focus,
            hintText: widget.model.selectedDate,
            suffixIcon: Icon(
                widget.model.showDatePicker
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                color: AppColors.appGrey),
          ),
        ),
        Visibility(
          visible: widget.model.showDatePicker,
          child: SfDateRangePicker(
            onSelectionChanged: (date) {
              widget.model.selectDate(
                date.value.toString(),
              );
              widget.model.toggleDatePickerVisibility();
            },
          ),
        ),
      ],
    );
  }
}
