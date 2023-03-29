// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  final String text;
  final VoidCallback press;
  double? width;
  double? height; 
   Button1({
    Key? key,
    required this.text,
    required this.press,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          width:width?? MediaQuery.of(context).size.width,
                        height:height?? 58,
      child: ElevatedButton(onPressed: press, child: Text(text,style: TextStyle(fontSize: 20,letterSpacing: 2),),
                 style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  
                  
                  
                ),
                backgroundColor: Colors.white.withOpacity(0.3),
      ),
      ),
    );
  }
}
