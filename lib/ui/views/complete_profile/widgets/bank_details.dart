import 'package:flutter/material.dart';
import 'package:trove/ui/shared/custom_textfield.dart';
import 'package:trove/ui/shared/ui_helpers.dart';
import 'package:trove/ui/views/complete_profile/complete_profile_page_viewmodel.dart';
import 'package:trove/utils/colors.dart';
import 'package:trove/utils/styles.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BankInfo extends StatefulWidget {
  const BankInfo(
      {Key? key,
      required this.banks,
      required this.setBank,
      required this.bank,
      required this.firstController,
      required this.lastController,
      required this.accountNameVal,
      required this.accountNumberVal,
      required this.formKey})
      : super(key: key);
  final List<String> banks;
  final Function setBank;
  final String bank;
  final TextEditingController firstController;
  final TextEditingController lastController;
  final dynamic accountNameVal;
  final dynamic accountNumberVal;
  final dynamic formKey;
  @override
  _BankInfoState createState() => _BankInfoState();
}

class _BankInfoState extends State<BankInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            textAndField(
                'Account Name',
                'Please enter the name associated with your bank account',
                widget.firstController,
                widget.accountNameVal),
            UIHelper.verticalSpaceMedium,
            dropdown(),
            UIHelper.verticalSpaceMedium,
            textAndField(
                'Account Number',
                'Please enter your Bank account number',
                widget.lastController,
                widget.accountNumberVal,
                number: true),
          ],
        ),
      ),
    );
  }

  Widget textAndField(label, hintText, controller, validator, {bool? number}) {
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
                number != null ? TextInputType.number : TextInputType.text,
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
          'Bank Name',
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
            value: widget.bank,
            isExpanded: true,
            isDense: true,
            itemHeight: 50,
            items: widget.banks.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(value, style: AppTextStyle.greyNormal16),
                ),
              );
            }).toList(),
            onChanged: (String? bank) {
              widget.setBank(bank);
            },
          )),
        ),
      ],
    );
  }
}
