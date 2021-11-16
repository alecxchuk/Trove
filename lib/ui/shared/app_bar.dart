import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trove/utils/colors.dart';
import 'package:trove/utils/styles.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leading;
  final IconData? searchBarIcon;
  final Widget? orgTitle;
  bool leadingWidth;
  bool onlineIndicator;
  final Function()? leadingPress;
  final Function(String)? onChanged;
  final TextEditingController? searchController;
  final String? title;
  final String? hintText;

  bool bottomNavBarScreen;
  bool whiteBackground;
  bool isDarkMode;
  final Function()? onEditingComplete;
  bool navBar;
  final String? subtitle;
  final List<Widget>? actions;

  CustomAppBar({
    this.leading,
    this.title,
    this.leadingWidth = false,
    this.subtitle,
    this.actions,
    this.bottomNavBarScreen = false,
    this.whiteBackground = false,
    this.isDarkMode = false,
    this.onlineIndicator = false,
    Key? key,
    this.leadingPress,
    this.navBar = false,
    this.searchController,
    this.searchBarIcon,
    this.hintText,
    this.onChanged,
    this.orgTitle,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 1,
      leadingWidth: leadingWidth ? 10 : null,
      leading: navBar
          ? null
          : InkWell(
              child: Icon(leading,
                  color: !isDarkMode ? AppColors.appwhite : AppColors.appBlack,
                  size: 16),
              onTap: () => leadingPress ?? Navigator.pop(context)),
      title: Text(
        title!,
        style: AppTextStyle.white500_20,
      ),
      // titleTextStyle: AppTextStyle.organizationNameText,
      centerTitle: false,
      // backgroundColor: !whiteBackground
      //     ? isDarkMode
      //         ? AppColors.darkThemePrimaryColor
      //         : AppColors.zuriPrimaryColor
      //     : isDarkMode
      //         ? AppColors.darkThemePrimaryColor
      //         : AppColors.whiteColor,
      //actions: isSearchBar ? null : actions,
    );
  }
}
