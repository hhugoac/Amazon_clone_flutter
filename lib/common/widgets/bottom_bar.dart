import 'package:ecommerce_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavigationBarWidth = 42;
  double bottomNavigationBarBorderWidth = 5;

  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        items: [
          //Home
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavigationBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 0
                    ? GlobalVariables.selectedNavBarColor
                    : GlobalVariables.backgroundColor,
              ))),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),
          //Cart
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavigationBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 1
                    ? GlobalVariables.selectedNavBarColor
                    : GlobalVariables.backgroundColor,
              ))),
              child: const Badge(
                label: Text('2'),
                backgroundColor: Colors.white,
                textColor: Colors.black,
                child: Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
            label: '',
          ),
          //Account
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavigationBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 2
                    ? GlobalVariables.selectedNavBarColor
                    : GlobalVariables.backgroundColor,
              ))),
              child: const Icon(
                Icons.person_2_outlined,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
