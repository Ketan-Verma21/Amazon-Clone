import 'dart:io';

import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textField.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _pnameController = TextEditingController();
  final TextEditingController _pdescController = TextEditingController();
  final TextEditingController _ppriceController = TextEditingController();
  final TextEditingController _pqtyController = TextEditingController();
  final AdminServices adminServices=AdminServices();
  String category = 'Mobiles';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pnameController.dispose();
    _pdescController.dispose();
    _pqtyController.dispose();
    _ppriceController.dispose();
  }
  final _addProductFromKey=GlobalKey<FormState>();
  List<String> productCategory = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];
  void sellProduct(){
      if(_addProductFromKey.currentState!.validate()&& images.isNotEmpty){
          adminServices.sellProduct(
              context: context,
              name: _pnameController.text,
              description: _pdescController.text,
              price:double.parse(_ppriceController.text),
              quantity: double.parse(_pqtyController.text),
              category: category,
              images: images);
      }
  }
  List<File> images = [];
  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GV.appBarGradient,
            ),
          ),
          title: Text(
            "Add Product",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFromKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((i) {
                          return Builder(
                              builder: (BuildContext context) => Image.file(
                                    i,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ));
                        }).toList(),
                        options:
                            CarouselOptions(viewportFraction: 1, height: 200))
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Select Product images",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[400],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                    controller: _pnameController, text: "Product Name"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _pdescController,
                  text: "Description",
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(controller: _ppriceController, text: "Price"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(controller: _pqtyController, text: "Quantity"),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategory.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(text: 'Sell', onTap: sellProduct),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
