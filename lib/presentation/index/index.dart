import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:oyinshyq/base/base_provider.dart';
import 'package:oyinshyq/presentation/cart/ui/cart.dart';
import 'package:oyinshyq/presentation/catalog/ui/catalog.dart';
import 'package:oyinshyq/presentation/home/ui/home.dart';
import 'package:oyinshyq/presentation/index/index_provider.dart';
import 'package:oyinshyq/presentation/profile/ui/profile.dart';
import 'package:oyinshyq/presentation/searching/ui/searching.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  // static List<Widget> _widgetOptions = <Widget>[
  //   HomeScreen(

  //   ),
  //   CartScreen(),
  //   SearchingScreen(),
  //   CatalogScreen(),
  //   ProfileScreen()
  // ];

  @override
  Widget build(BuildContext context) {
    return BaseProvider<IndexProvider>(
      model: IndexProvider(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: <Widget>[
              HomeScreen(
                indexProvider: model,
              ),
              CartScreen(
                indexProvider: model,
              ),
              SearchingScreen(),
              ProfileScreen()
            ].elementAt(_selectedIndex),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: '',
                  ),
                  GButton(
                    icon: Icons.list_alt,
                    text: '',
                  ),
                  GButton(
                    icon: LineIcons.search,
                    text: '',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: '',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
