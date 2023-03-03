

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:todo_with_node/models/usermodel.dart';
import 'package:todo_with_node/services/auth_api.dart';

import '../components/alert_dialog.dart';

class AuthProvider extends ChangeNotifier{

bool loading= false;
UserModel userData = UserModel();
  //signUp
  void signUp({required String userName, required String email ,required String password, required BuildContext context})async{

    UserModel userModel =UserModel(email: email,password: password,userName: userName);
var data =AuthApiClass.signUp(userModel);

if(data.data[''])
userData =UserModel.fromMap(data);

notifyListeners();

print(userData.email.toString() + userData.userName.toString());
  }


    //Login
  void login({ required String email ,required String password ,required BuildContext context})async{

  
loading=true;
notifyListeners();
    UserModel userModel =UserModel(email: email,password: password, userName: '',id: '');
 var data =
await AuthApiClass.login(userModel);
log(data['success'].toString());


try {
  if(data['success'] ==true){
 
   

   userData =UserModel.fromMap(data['data']);
userData.userName=data['data']['userName'];
userData.id=data['data']['_id'];
  // print( userData.id.toString() +'aaaaaa');
loading=false;
   handleClickMe(context,userData.email.toString()+ userData.userName.toString());

}else if(data['success'] == false){
    loading=false;
  handleClickMe(context,data['error']);
  log('STATUS 400');
}
} catch (e) {
  loading=false;
 log(e.toString() +'TryCatch error') ;
}



notifyListeners();


  }
}