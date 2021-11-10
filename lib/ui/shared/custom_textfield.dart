import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trove/ui/shared/shared.dart';
import 'package:trove/utils/colors.dart';
import 'package:trove/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      this.focus,
      required this.keyboardType,
      required this.inputAction,
      required this.autoCorrect,
      required this.obscureText,
      this.readOnly,
      this.outlinedBorder,
      this.labelText,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.onTap,
      this.onSubmitted,
      this.validator})
      : super(key: key);
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final FocusNode? focus;
  final bool? autoCorrect;
  final bool? obscureText;
  final bool? outlinedBorder;
  final bool? readOnly;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final VoidCallback? onSubmitted;
  final dynamic validator;
  @override
  Widget build(BuildContext context) {
    return validator == null
        ? TextField(
            focusNode: focus,
            controller: controller,
            onTap: onTap,
            onSubmitted: (_) => onSubmitted,
            readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            textInputAction: inputAction,
            autocorrect: autoCorrect!,
            obscureText: obscureText!,
            style: const TextStyle(fontSize: 16),

            //cursorColor: AppColors.zuriPrimaryColor,
            decoration: InputDecoration(
              contentPadding: prefixIcon != null
                  ? const EdgeInsets.symmetric(vertical: 4, horizontal: 8)
                  : outlinedBorder != null
                      ? const EdgeInsets.symmetric(vertical: 5, horizontal: 16)
                      : null,
              labelText: labelText,
              hintText: hintText,
              hintStyle: AppTextStyle.greyNormal16,
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 8, end: 20),
                      child: prefixIcon,
                    )
                  : null,
              suffixIcon: suffixIcon,
              prefixIconConstraints: const BoxConstraints(
                minHeight: 24,
                minWidth: 24,
              ),
              suffixIconConstraints: const BoxConstraints(
                  minHeight: 24, maxHeight: 24, minWidth: 24, maxWidth: 24),
              border: outlinedBorder != null
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appGrey,
                      ),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appGrey,
                      ),
                    ),
              focusedBorder: outlinedBorder != null
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appGrey,
                      ),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appGrey,
                      ),
                    ),
            ),
          )
        : TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            focusNode: focus,
            controller: controller,
            onTap: onTap,
            readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            textInputAction: inputAction,
            autocorrect: autoCorrect!,
            obscureText: obscureText!,
            style: const TextStyle(fontSize: 16),

            //cursorColor: AppColors.zuriPrimaryColor,
            decoration: InputDecoration(
              contentPadding: prefixIcon != null
                  ? const EdgeInsets.symmetric(vertical: 4, horizontal: 8)
                  : outlinedBorder != null
                      ? const EdgeInsets.symmetric(vertical: 5, horizontal: 16)
                      : null,
              labelText: labelText,
              hintText: hintText,
              hintStyle: AppTextStyle.greyNormal16,
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 8, end: 20),
                      child: prefixIcon,
                    )
                  : null,
              suffixIcon: suffixIcon,
              prefixIconConstraints: const BoxConstraints(
                minHeight: 24,
                minWidth: 24,
              ),
              suffixIconConstraints: const BoxConstraints(
                  minHeight: 24, maxHeight: 24, minWidth: 24, maxWidth: 24),
              border: outlinedBorder != null
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appGrey,
                      ),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appGrey,
                      ),
                    ),
              focusedBorder: outlinedBorder != null
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appGrey,
                      ),
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.appGrey,
                      ),
                    ),
            ),
          );
  }
}
