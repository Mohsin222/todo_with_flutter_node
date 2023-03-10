import 'package:flutter/material.dart';

fieldsHeading(String headingText){
    return        Container(
              //  email Section
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(headingText,style: TextStyle(fontSize: 16),)),);
  }

   textDecoration({required String lableText, Icon? prefixIcon}){
   return InputDecoration(
                  prefix: Icon ==null ?null:prefixIcon,
                    border: OutlineInputBorder(),
                  labelText: lableText,
                );
   }