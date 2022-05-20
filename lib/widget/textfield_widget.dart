import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
 
  final TextEditingController Controller;

  MyTextField({required this.hintText, required this.Controller,});

  // const MyTextField({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return TextFormField(
        controller: Controller,
        

     
        style: TextStyle(color: Colors.black),
        autofocus: true,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      );
    });
  }
}
