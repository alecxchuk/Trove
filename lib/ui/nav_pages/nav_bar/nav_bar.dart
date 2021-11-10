import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trove/ui/nav_pages/dashboard/dashboard.dart';
import 'package:trove/ui/nav_pages/loan_activity/loan_activity.dart';
import 'package:trove/ui/nav_pages/profile_page/profile_page.dart';
import 'package:trove/ui/shared/app_bar.dart';
import 'package:trove/ui/views/base_widget/network_sentive.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  final widgetOptions = [
    Text('Beer List'),
    Text('Add new beer'),
    Text('Favourites'),
    Text('Favourites'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: selectedIndex == 0
            ? 'Dashboard'
            : selectedIndex == 1
                ? 'Loan History'
                : 'Profile',
        leading: Icons.arrow_back_ios_new,
      ),
      body: getViewForIndex(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Beers'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_customize), label: 'New Beer'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Favourites'),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  ///Get all the pages and match them to the bottom nav icon
  ///that is clicked this would change the view to the current
  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return NetworkSensitive(child: Dashboard());
      case 1:
        return LoanActivity();

      case 2:
        return ProfilePage();
      default:
        return Dashboard();
    }
  }
}
