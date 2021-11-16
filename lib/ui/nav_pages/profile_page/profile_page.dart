import 'package:flutter/material.dart';
import 'package:trove/app/app.locator.dart';
import 'package:trove/ui/nav_pages/profile_page/profile_vm.dart';
import 'package:trove/ui/shared/long_button.dart';
import 'package:trove/ui/views/base_widget/base_widget.dart';
import 'package:trove/utils/styles.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ProfileVm model = serviceLocator<ProfileVm>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProfileVm>(
        model: model,
        builder: (context, model, child) => Scaffold(
              body: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      backgroundColor: Colors.amberAccent,
                      radius: 80,
                      //backgroundImage: NetworkImage(userAvatarUrl),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Udofia Mkpoririem',
                    style: AppTextStyle.blackBold24,
                  ),
                  const Spacer(),
                  LongButton(
                      onPressed: () {
                        model.logout();
                      },
                      label: 'Sign Out'),
                  const SizedBox(
                    height: 32,
                  )
                ],
              ),
            ));
  }
}
