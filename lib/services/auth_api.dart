

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:todo_with_node/models/usermodel.dart';

class AuthApiClass{

  static signUp(UserModel userModel)async{
 var url = Uri.parse('https://viridian-jellyfish-sock.cyclic.app/auth/signUp');
var response = await http.post(url,body: userModel.toMap()
// {
//     "email":"alpha@g1234.com",
//     "userName":'122',
//     "password":"Teaaa",
   
// }

)

;
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');
var decode = jsonDecode(response.body);


if(response.statusCode ==200){
return response;
}else{
   return response;
}


  }


  static login(UserModel userModel)async{
 var url = Uri.parse('https://viridian-jellyfish-sock.cyclic.app/auth/login');
var response = await http.post(url,body: userModel.toMap()

);

var decode = jsonDecode(response.body);

log(decode.toString());
if(response.statusCode ==200){
return decode;
}else{
  decode = 400;
   return response;
}


  }
}