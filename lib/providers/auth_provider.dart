

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:todo_with_node/models/usermodel.dart';
import 'package:todo_with_node/services/auth_api.dart';

class AuthProvider extends ChangeNotifier{

bool loading= false;
UserModel userData = UserModel();
  //signUp
  void signUp({required String userName, required String email ,required String password})async{

    UserModel userModel =UserModel(email: email,password: password,userName: userName);
var data =AuthApiClass.signUp(userModel);

if(data.data[''])
userData =UserModel.fromMap(data);

notifyListeners();

print(userData.email.toString() + userData.userName.toString());
  }


    //Login
  void login({ required String email ,required String password})async{

  

    UserModel userModel =UserModel(email: email,password: password, userName: '',id: '');
 var data =
await AuthApiClass.login(userModel);

if(data ==400){
  log('STATUS 400');
}else{
  log('YES');
  userData =UserModel.fromMap(data['data']);
  print(userData.email.toString() + userData.userName.toString() +'aaaaaa');
}



notifyListeners();


  }
}