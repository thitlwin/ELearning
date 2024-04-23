import 'package:animations/animations.dart';
import 'package:elearning/app/controller/HomeController.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/home/HomePage.dart';
import 'package:elearning/app/ui/profile/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  final String restorationId = "restorationId";

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage>
    with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);
  var previousIndex;

  @override
  String get restorationId => widget.restorationId;

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.account_circle),
        label: "Profile",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.settings),
        label: "Setting",
      ),
    ];

    return Scaffold(
      body: Center(
        child: PageTransitionSwitcher(
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: _contentScreen(_currentIndex.value),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex.value,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex.value = index;
            debugPrint('index==$index');
            if (index == 2) {
              _showPopupMenu();
            }
          });
        },
        selectedItemColor: colorScheme.onPrimary,
        unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
        backgroundColor: colorScheme.primary,
      ),
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }

  _contentScreen(int value) {
    switch (value) {
      case 0:
        previousIndex = 0;
        return HomePage();
      case 1:
        previousIndex = 1;
        return ProfilePage();
      case 2:
        if (previousIndex == 0) {
          return HomePage();
        }
        if (previousIndex == 1) {
          return ProfilePage();
        }
        break;
      default:
    }
  }

  _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(1000.0, 1000.0, 0.0, 0.0),
      items: [
        PopupMenuItem(
          child: Text("Logout"),
          value: 1,
        ),
        PopupMenuItem(
          child: Text("Change Password"),
          value: 2,
        ),
        PopupMenuItem(
          child: Text("Setting"),
          value: 3,
        ),
      ],
      elevation: 8.0,
    ).then(
      (value) {
        switch (value) {
          case 1:
            _displayConfirmationDialog("Are you sure you want to logout?");
            return null;
          case 2:
            Get.toNamed(Routes.CHANGE_PASSWORD);
            return null;
          case 3:
            Get.toNamed(Routes.SETTING_PAGE);
            return null;
        }
      },
    );
  }

  void _displayConfirmationDialog(String message) {
    Get.dialog(AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$message',
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel')),
        ElevatedButton(
            onPressed: () {
              Get.back();
              HomeController homeController = Get.find();
              // Get.dialog(successDialog("You have successfully logout"));
              homeController.doLogout();
            },
            child: Text('Yes'))
      ],
    ));
  }
}
