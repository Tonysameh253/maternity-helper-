// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomFormButton extends StatelessWidget {
  final String innerText;
  final void Function()? onPressed;
  // ignore: prefer_typing_uninitialized_variables
  final Image;
  final Icon;
  
  const CustomFormButton({super.key, required this.innerText, required this.onPressed, this.Image,this.Icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xFF806BB2),
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextButton(
        onPressed: onPressed, 
        child: Text(innerText, style: const TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }
}
