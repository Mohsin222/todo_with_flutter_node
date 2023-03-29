import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/components/dialog1.dart';
import 'package:todo_with_node/providers/get_task_provider.dart';
import 'package:todo_with_node/views/tasklist.dart';
import 'package:uuid/uuid.dart';

import '../models/task_model.dart';
import '../services/task_api.dart';
import 'auth_provider.dart';

class AddTaskProvider extends ChangeNotifier{

// save task
saveTask({required BuildContext context, required String title,required String description,required String completeDate})async{
  var uuid = Uuid();
  var id =uuid.v1();

try {
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
  notifyListeners();

  print(data.toString() +"AAAAA");
     final authProvider= Provider.of<GetTaskProvider>(context,listen: false).getAllTask();

Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: TaskList()));
 }else{
  print(data.toString());
  dialog1(press: (){}, dialogTtile: 'Error', dialogContent: ' taskCompleteDate must me greater then currentdate', context: context);
 }

  print(authProvider.email.toString()  + ''+authProvider.password.toString());
} catch (e) {
  log(e.toString());

  
}

}

// xxxxxxxxxxxxxxxxxxxxxxxxxx save task end xxxxxxxxxxxxxxxxxxxxxxxxxx
  
}