import 'package:flutter/material.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/models/snack_request.dart';
import 'package:trove/services/app_services/snackbar_service.dart';
import 'package:trove/utils/colors.dart';
import 'package:trove/utils/enums.dart';

class SnackManager extends StatefulWidget {
  final Widget child;
  const SnackManager({Key? key, required this.child}) : super(key: key);

  @override
  _SnackManagerState createState() => _SnackManagerState();
}

class _SnackManagerState extends State<SnackManager> {
  final _snackService = serviceLocator<SnackbarService>();

  @override
  void initState() {
    super.initState();
    _snackService.registerDialogListener(_showSnackbar);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showSnackbar(SnackRequest request) {
    SnackBar(
      content: Text(request.content),
      duration: request.duration,
      backgroundColor: request.variant == SnackbarType.success
          ? AppColors.appGreen
          : AppColors.appRed,
    );
  }
}
