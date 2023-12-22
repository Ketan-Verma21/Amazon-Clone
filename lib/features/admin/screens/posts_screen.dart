import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';
class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminServices=AdminServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllProduct();
  }
  fetchAllProduct() async{
    products=await adminServices.fetchAllProduct(context);
    setState(() {});
  }
  void deleteProduct(Product product,int index){
    adminServices.deleteProduct(context: context, product: product, onSuccess: () {
      products!.removeAt(index);
      setState(() {});
    },);
  }
  void navigateToAddProduct(){
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return products==null?const Loader():Scaffold(
      body: GridView.builder(
        itemCount: products!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
            final productData=products![index];
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 140,
                  child: SingleProduct(
                      image: productData.images[0]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          productData.name,overflow: TextOverflow.ellipsis,maxLines: 2,
                        ),
                      )),
                      IconButton(
                          onPressed: ()=>deleteProduct(productData,index),
                          icon: Icon(Icons.delete_outline))
                    ],
                  )
                ],
              ),
            );
          }),
      floatingActionButton:
        FloatingActionButton(
          onPressed: navigateToAddProduct,
          tooltip: 'Add a Product',
          child: const Icon(Icons.add),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
