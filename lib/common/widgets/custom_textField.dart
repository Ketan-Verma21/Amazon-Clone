import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final int maxLines;
  CustomTextField({Key? key, required this.controller, required this.text, this.maxLines=1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black38,
        )),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black38,
        )),
      ),
      validator: (val) {
        if(val==null || val.isEmpty){
          return 'Enter your $text';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
