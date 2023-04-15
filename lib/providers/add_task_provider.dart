import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:todo_with_node/providers/get_task_provider.dart';
import 'package:todo_with_node/views/tasklist.dart';
import 'package:uuid/uuid.dart';

import '../components/single_btn_dialog.dart';
import '../models/task_model.dart';
import '../services/task_api.dart';
import 'auth_provider.dart';

class AddTaskProvider extends ChangeNotifier{


bool loading =false;
// save task
saveTask({required BuildContext context, required String title,required String description,required String completeDate})async{
  var uuid = Uuid();
  var id =uuid.v1();

try {
  loading=true;
  notifyListeners();
   final authProvider= Provider.of<AuthProvider>(context,listen: false).userData;
TaskModel taskModel =TaskModel(
  title: title, 
description: description,
 status: false, 
 email: authProvider.email.toString(),
  taskId: id.toString(), 
dateTime: DateTime.now().toString(),
taskCompleteDate: completeDate


);
var data = await TaskApiClass.saveTask(taskModel);

 if(data['success']==true){
  loading=false;
  notifyListeners();

  print(data.toString() +"AAAAA");
     final authProvider= Provider.of<GetTaskProvider>(context,listen: false).getAllTask();
loading=false;

Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade,duration: Duration(seconds: 1), child: TaskList()));
 }else{
  loading=false;
  notifyListeners();
  print(data.toString());
  singleButtonDialog(press: (){Navigator.pop(context);}, dialogTtile: 'Error', dialogContent: ' taskCompleteDate must me greater then currentdate', context: context);
 }

  print(authProvider.email.toString()  + ''+authProvider.password.toString());
} catch (e) {
    loading=false;
  notifyListeners();
 singleButtonDialog(press: (){
  Navigator.pop(context);
 }, dialogTtile: 'Error', dialogContent: e.toString(), context: context);

  
}

}

// xxxxxxxxxxxxxxxxxxxxxxxxxx save task end xxxxxxxxxxxxxxxxxxxxxxxxxx
  
}