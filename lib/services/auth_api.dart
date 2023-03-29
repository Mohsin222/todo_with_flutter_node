

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:todo_with_node/components/dialog1.dart';
import 'package:todo_with_node/models/usermodel.dart';

class AuthApiClass{

static String apiUrl ="https://enchanting-pink-headscarf.cyclic.app";
  static signUp(UserModel userModel)async{
 var url = Uri.parse('$apiUrl/auth/signUp');
var response = await http.post(url,body: userModel.toMap()
// {
//     "email":"alpha@g1234.com",
//     "userName":'122',
//     "password":"Teaaa",
   
// }

)

;


print(response.statusCode.toString());
if(response.statusCode ==200){

  var decode = jsonDecode(response.body);
  log(decode.toString()+'dds');
    return decode;
}else{
    var decode = jsonDecode(response.body);
  // log(decode.toString()+'fassaaa');


  return null;
}
// if(response.statusCode ==200){
  
// return decode;
// }else{
//    return decode;
// }


  }


  static login(UserModel userModel)async{
 var url = Uri.parse('$apiUrl/auth/login');
var response = await http.post(url,body: userModel.toMap()

);





if(response.statusCode ==200){
  var decode = jsonDecode(response.body);
 
return decode;
}else{
var decode = jsonDecode(response.body);
  log(decode.toString() +'bbbbbbbbbb');
   return decode;
}


  }
}