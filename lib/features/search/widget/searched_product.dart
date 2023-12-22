import 'package:flutter/material.dart';

import '../../../common/widgets/stars.dart';
import '../../../models/product.dart';
class SearchedProduct extends StatelessWidget {
  final Product product;
  SearchedProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.network(product.images[0],fit:BoxFit.fitHeight,height: 135,width: 135,),
              Column(
                children: [
                  Container(width: 235,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(product.name,style:const TextStyle(
                    fontSize: 16,
                  ),maxLines: 2,overflow: TextOverflow.ellipsis,),),
                  Container(width: 235,
                    padding: const EdgeInsets.only(left: 10,top: 5),
                    child: Stars(rating:4.0),),
                  Container(width: 235,
                    padding: const EdgeInsets.only(left: 10,top: 5),
                    child: Text('\$${product.price}',style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),maxLines: 2,overflow: TextOverflow.ellipsis,),),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
