import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/home/widgets/carousel_image.dart';
import 'package:amazon_clone/features/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../../../providers/user_provider.dart';
import '../../search/screens/search_screen.dart';
import '../widgets/deal_of_day.dart';
class HomeScreen extends StatefulWidget {
  static const String routename="/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    // final user=Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace:Container(
            decoration: BoxDecoration(
              gradient: GV.appBarGradient,
            ),

          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left:15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        hintText: "Search here",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17
                        ),
                        prefixIcon: InkWell(
                          onTap: (){},
                          child: const Padding(
                            padding:EdgeInsets.only(left: 6) ,
                            child: Icon(Icons.search,color: Colors.black,size: 23,),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide(color: Colors.black38,width: 1),
                        ),
                      ),
                    ),
                  )
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic,color: Colors.black,size: 25,),
              )



            ],
          ),
        ),

      ) ,
      body: SingleChildScrollView(
        child: Column(
          children:  [
             AddressBox(),
             SizedBox(height: 10,),
            TopCategories(),
            SizedBox(height: 10,),
            CarouselImage(),
            DealOfDay(),



          ],
        ),
      ),
    );
  }
}
