import 'package:flutter/material.dart';
import 'package:trove/ui/shared/app_bar.dart';
import 'package:trove/ui/shared/long_button.dart';
import 'package:trove/utils/styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //   title: 'My Profile',
      //   leading: Icons.arrow_back_ios_new,
      // ),
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
          LongButton(onPressed: () {}, label: 'Sign Out'),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}
