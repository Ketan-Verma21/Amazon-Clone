import 'package:amazon_clone/features/admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page=0;
  double bottomBarWidth=42;
  double bottomBarBorderWidth=5;
  List<Widget> pages=[
    PostsScreen(),
    const Center(child: Text("Analytics Page"),),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace:Container(
            decoration: BoxDecoration(
              gradient: GV.appBarGradient,
            ),

          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset("assets/images/amazon_in.png",width: 120,height: 45,color: Colors.black,),
              ),
              const Text("Admin",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),)


            ],
          ),
        ),

      ) ,
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
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
              Icons.analytics_outlined,
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
            child: const Icon(
              Icons.all_inbox_outlined,
            ),

          ),
              label: ''),

        ],
      ) ,
    );
  }
}
