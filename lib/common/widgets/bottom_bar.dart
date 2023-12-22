import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
class BottomBar extends StatefulWidget {
  static const String routeName ='/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page=0;
  double bottomBarWidth=42;
  double bottomBarBorderWidth=5;
  List<Widget> pages=[
      const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text("Cart Page"),)
  ];
  void updatePage(int page){
    setState(() {
      _page=page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex:_page ,
        selectedItemColor: GV.selectedNavBarColor,
        unselectedItemColor: GV.unselectedNavBarColor,
        backgroundColor: GV.backgroundColor,
        onTap: updatePage,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(icon: Container(
            width:bottomBarWidth ,
            decoration: BoxDecoration(
              border: Border(top:BorderSide(
                color: _page==0?GV.selectedNavBarColor:GV.backgroundColor,
                width: bottomBarBorderWidth,
              ))
            ),
            child: const Icon(
              Icons.home_outlined,
            ),

          ),
          label: ''),
          BottomNavigationBarItem(icon: Container(
            width:bottomBarWidth ,
            decoration: BoxDecoration(
                border: Border(top:BorderSide(
                  color: _page==1?GV.selectedNavBarColor:GV.backgroundColor,
                  width: bottomBarBorderWidth,
                ))
            ),
            child: const Icon(
              Icons.person_outline_outlined,
            ),

          ),
              label: ''),
          BottomNavigationBarItem(icon: Container(
            width:bottomBarWidth ,
            decoration: BoxDecoration(
                border: Border(top:BorderSide(
                  color: _page==2?GV.selectedNavBarColor:GV.backgroundColor,
                  width: bottomBarBorderWidth,
                ))
            ),
            child: badges.Badge(
              elevation:0,
              badgeContent: const Text('2'),
              badgeColor: Colors.white,
              child: Icon(
                Icons.shopping_cart_rounded,
              ),
            ),

          ),
              label: '')
        ],
      ) ,
    );
  }
}
