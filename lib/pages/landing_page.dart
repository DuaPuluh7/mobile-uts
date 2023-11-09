import 'package:a/pages/home_page.dart';
import 'package:a/pages/profile_screen.dart';
import 'package:a/pages/promo_screen.dart';
import 'package:a/pages/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(),
      ShopScreen(),
      PromoScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exitApp = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text('Do you want to exit the app?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Close the dialog
                  },
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Close the dialog
                  },
                  child: Text('Yes'),
                ),
              ],
            );
          },
        );
        
        if (exitApp == true) {
          SystemNavigator.pop(); // Close the app
        }
        return false; // Prevent default behavior
      },
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 24),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer, size: 24),
              label: 'Promo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 24),
              label: 'Account',
            ),
          ],
          showUnselectedLabels: true,
          selectedFontSize: 14,
          unselectedItemColor: Colors.grey[500],
          unselectedFontSize: 12,
          selectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
