import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/models/plant.dart';
import 'package:fyp_frontend/ui/scan_page.dart';
import 'package:fyp_frontend/ui/screens/info_page.dart';
import 'package:fyp_frontend/ui/screens/feedback_page.dart';
import 'package:fyp_frontend/ui/screens/home_page.dart';
import 'package:fyp_frontend/ui/screens/profile_page.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomNavIndex = 0;

  //List of the pages
  List<Widget> pages = [
      HomePage(),
      FeedbackPage(),
      InfoPage(),
      ProfilePage(),
  ];

    //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.feedback,
    Icons.info,
    Icons.person,
  ];

    //List of the pages titles
  List<String> titleList = [
    'Home',
    'Feedback',
    'About App',
    'Profile',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[bottomNavIndex], style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),),
            const Icon(Icons.notifications, color: Colors.black, size: 30.0,)
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, PageTransition(child: const ScanPage(), type: PageTransitionType.bottomToTop));
        },
        child: Image.asset('assets/images/scan1.png', height: 30.0,),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            bottomNavIndex = index;
          });
        }
      ),
    );
  }
}
