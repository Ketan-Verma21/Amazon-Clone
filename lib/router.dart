import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

import 'features/admin/screens/admin_screen.dart';
Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings:routeSettings,
          builder: (_)=>const AuthScreen()
      );
    case HomeScreen.routename:
      return MaterialPageRoute(
          settings:routeSettings,
          builder: (_)=>const HomeScreen()
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings:routeSettings,
          builder: (_)=>const BottomBar()
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings:routeSettings,
          builder: (_)=>const AddProductScreen()
      );
    case CategoryDealsScreen.routeName:
      var category =routeSettings.arguments as String;
      return MaterialPageRoute(
          settings:routeSettings,
          builder: (_)=> CategoryDealsScreen(
              category: category)
      );
    case SearchScreen.routeName:
      var searchQuery =routeSettings.arguments as String;
      return MaterialPageRoute(
          settings:routeSettings,
          builder: (_)=>SearchScreen(searchQuery: searchQuery)
      );

    default:
      return MaterialPageRoute(
          settings:routeSettings,
          builder: (_)=> Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/images/8_404 Error.png",
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: MediaQuery.of(_).size.height * 0.15,
                  left: MediaQuery.of(_).size.width * 0.3,
                  right: MediaQuery.of(_).size.width * 0.3,
                  child: MaterialButton(
                    color: Color(0xFF6B92F2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () {},
                    child: Text(
                      "Go Home".toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
      );

  }
}