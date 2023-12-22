import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../models/product.dart';
import '../../../providers/user_provider.dart';

class SearchServices{
  Future<List<Product>> fetchSearchedProduct({required BuildContext context,required String searchQuery})async{
    final userProvider=Provider.of<UserProvider>(context,listen: false);
    List<Product> productList=[];
    try{
      http.Response res=await http.get(Uri.parse('$uri/api/products/search/$searchQuery'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },

      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: (){
            for (int i = 0; i <jsonDecode(res.body).length;i++){
              productList.add(
                  Product.fromJson(
                      jsonEncode(
                          jsonDecode(res.body)[i]
                      )
                  )
              );
            }

          });

    }catch(e){

      showSnackBar(context, e.toString());
    }
    return productList;
  }
}