import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  CustomButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: Text(text,),
      style:ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity,50),

      ) ,
    );
  }
}
