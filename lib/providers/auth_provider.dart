

import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/models/usermodel.dart';
import 'package:todo_with_node/providers/get_task_provider.dart';
import 'package:todo_with_node/services/auth_api.dart';
import 'package:todo_with_node/views/tasklist.dart';

import '../components/alert_dialog.dart';

class AuthProvider extends ChangeNotifier{

bool loading= false;
UserModel userData = UserModel();
  //signUp
  void signUp({required String userName, required String email ,required String password, required BuildContext context})async{
try {
loading=true;
notifyListeners();
    UserModel userModel =UserModel(email: email,password: password,userName: userName,id: '');
var data =
       await AuthApiClass.signUp(userModel);


   if(data['success'] ==true){
   userData =UserModel.fromMap(data['data']);
// userData.userName=data['data']['userName'];
// userData.id=data['data']['_id'];
  // print( userData.id.toString() +'aaaaaa');
loading=false;

final taskProv =Provider.of<GetTaskProvider>(context,listen: false);
taskProv.getAuthDate(userData);
   handleClickMe(context,userData.email.toString()+ userData.userName.toString());
   Navigator.push(context, MaterialPageRoute(builder: (context) {
     return TaskList();
   },));
 }
 else if(data['success'] == false){
    loading=false;
    notifyListeners();
  handleClickMe(context,data['error']);
  log('STATUS 400');
}
} catch (e) {
    loading=false;
    notifyListeners();
     handleClickMe(context,'ERROR');
 log(e.toString() +'TryCatch error') ;
}



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
final taskProv =Provider.of<GetTaskProvider>(context,listen: false);
taskProv.getAuthDate(userData);
   handleClickMe(context,userData.email.toString()+ userData.userName.toString());
   Navigator.push(context, MaterialPageRoute(builder: (context) {
     return TaskList();
   },));

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