import 'package:flutter/material.dart';

fieldsHeading(String headingText){
    return        Container(
              //  email Section
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(headingText,style:const TextStyle(fontSize: 16,color: Colors.white),)),);
  }

   textDecoration({required String lableText, Icon? prefixIcon ,IconButton? suffixIcon, double? paddingVertical, double? paddingHorizontal}){
   return InputDecoration(
    
                  // prefix: Icon ==null ?null:prefixIcon,
                  // prefixStyle: TextStyle(color: Colors.white),
                  prefixIconColor: Colors.white,
                  suffixIcon: suffixIcon,
           
   contentPadding: EdgeInsets.symmetric(vertical:paddingVertical?? 8,horizontal: paddingHorizontal ?? 8),
          
                    filled: true,
                    border:const OutlineInputBorder(),
                      fillColor:Colors.white.withOpacity(0.3),
                     focusedBorder:const OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white ),
                     ) ,
                     errorBorder:const OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.red ),
                     ) ,
                     
                  // labelText: lableText,
                  labelStyle:const TextStyle(color: Colors.white),
                  hintStyle:const TextStyle(color: Colors.white),
                  
                );
   }