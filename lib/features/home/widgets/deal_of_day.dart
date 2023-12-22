import 'package:flutter/material.dart';
class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left:10,top:15),
          child: Text("Deal of the day",style: TextStyle(
            fontSize: 20,
          ),),
        ),
        Image.network("https://images.unsplash.com/photo-1682686581551-867e0b208bd1?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8",
        height: 235,
        fit: BoxFit.fitHeight,),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15),
          child: const Text('\$100',
          style: TextStyle(
            fontSize: 18,
            
          ),),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15,top: 5,right: 40),
          child: Text("Laptop",maxLines: 2,overflow: TextOverflow.ellipsis,),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network("https://images.unsplash.com/photo-1702470714576-4f3f73cea3be?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHx8",fit:BoxFit.fitWidth,width: 100 ,height: 100,),
              Image.network("https://images.unsplash.com/photo-1702470714576-4f3f73cea3be?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHx8",fit:BoxFit.fitWidth,width: 100 ,height: 100,),
              Image.network("https://images.unsplash.com/photo-1702470714576-4f3f73cea3be?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHx8",fit:BoxFit.fitWidth,width: 100 ,height: 100,),
              Image.network("https://images.unsplash.com/photo-1702470714576-4f3f73cea3be?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHx8",fit:BoxFit.fitWidth,width: 100 ,height: 100,),

            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15),
          alignment: Alignment.topLeft,
          child: Text("See all deals",style: TextStyle(
            color: Colors.cyan[800],

          ),),
        )
      ],
    );
  }
}
