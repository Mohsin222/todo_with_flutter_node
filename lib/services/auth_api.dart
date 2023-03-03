

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
// print('Response status: ${response.statusCode}');
// print('Response body: ${response.body}');


print(response.statusCode.toString());
if(response.statusCode ==200){

  var decode = jsonDecode(response.body);
  log(decode.toString()+'dds');
    return decode;
}else{
    var decode = jsonDecode(response.body);
  // log(decode.toString()+'fassaaa');
  return decode;
}
// if(response.statusCode ==200){
  
// return decode;
// }else{
//    return decode;
// }


  }


  static login(UserModel userModel)async{
 var url = Uri.parse('https://viridian-jellyfish-sock.cyclic.app/auth/login');
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