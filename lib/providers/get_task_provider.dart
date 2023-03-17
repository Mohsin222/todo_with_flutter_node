import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/models/task_model.dart';
import 'package:todo_with_node/models/usermodel.dart';
import 'package:todo_with_node/providers/auth_provider.dart';
import 'package:todo_with_node/services/task_api.dart';
import 'package:todo_with_node/views/tasklist.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../components/dialog1.dart';

class GetTaskProvider extends ChangeNotifier{

  GetTaskProvider(){
    getAllTask();
  }
  // for task tile
Color taskCompleteColor=Colors.greenAccent;

  void updateDate(DateTime newdateTime){
    dateTime=newdateTime;
    getAllTask();
    notifyListeners();
  }
UserModel userModel =UserModel();
   getAuthDate(UserModel userData){
userModel=userData;
  notifyListeners();

  return userData;
  }

  DateTime dateTime =DateTime.now();
List<TaskModel> getListTasks =[];
void getAllTask()async{
  getListTasks=[];
var data =await TaskApiClass.gettasks();

print(data.toString());


  for (var i in data.data['data']) {
      TaskModel taskModel = TaskModel.fromMap(i);
log(userModel.email.toString() +'aaaaaaaaaaaaaa');
        
if(taskModel.email==userModel.email){
        //  var d = DateTime.parse(taskModel.dateTime.toString());
//  DateTime.parse("2018-02-27 10:09:00");
  // DateFormat.parse(taskModel.dateTime.toString());
  log("${DateTime.parse(taskModel.dateTime.toString()).day}");
  print(dateTime.day);
  if(DateTime.parse(taskModel.dateTime.toString()).day == dateTime.day){

 getListTasks.add(taskModel);
  }else{
    log('FALESSSSS');
  }


  
     
}

    }
    notifyListeners();
// print(data.data['data'][0]['publistDate'].toString());
}






bool switchValue = false;
changeCardStatus(bool? val , taskCompleteVal){
  if(DateTime.parse(taskCompleteVal).isBefore(DateTime.now().toUtc())){

      taskCompleteVal =Colors.green;
      notifyListeners();
  
  }else{
         switchValue == true
                                        ? taskCompleteColor = Colors.white
                                        : taskCompleteColor =
                                            Color(0xffe91e63);

                                   switchValue = val ?? false;
                                  //  getAllTask();
                                   notifyListeners();

  }

}

updateSwitchvalue(bool val){
  switchValue=val;
  notifyListeners();
  
}

updateTask({required String? taskId,  required BuildContext context})async{
  if(switchValue == true){
    switchValue =false;
    notifyListeners();
  }else{
    switchValue =true;
    notifyListeners();
  }
 var data = await  TaskApiClass.updateOnlyTaskStatus(switchValue: switchValue,taskId: taskId);


  if(data['success']==true){
      getAllTask();
      notifyListeners();
// Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: TaskList()));
  }else{
    dialog1(press: (){},context: context,dialogContent:data['error'].toString(),dialogTtile: 'ERROR' );
  }
}




saveTask({required BuildContext context, required String title,required String description,required String completeDate})async{
  var uuid = Uuid();
  var id =uuid.v1();

try {
   final authProvider= Provider.of<AuthProvider>(context,listen: false).userData;
TaskModel taskModel =TaskModel(
  title: title, 
description: description,
//  status: false, 
 email: authProvider.email.toString(),
  taskId: id.toString(), 
dateTime: DateTime.now().toString(),
taskCompleteDate: completeDate


);
var data = await TaskApiClass.saveTask(taskModel);

 if(data['success']==true){
  notifyListeners();

  print(data.toString() +"AAAAA");
  getAllTask();
Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: TaskList()));
 }else{
  print(data.toString());
 }

  print(authProvider.email.toString()  + ''+authProvider.password.toString());
} catch (e) {
  log(e.toString());
}

}


//delete task
void deleteTask(String taskid)async{
  var data  = await TaskApiClass.deleteTask(taskid) ;

  if(data["success"]==true){
  // getListTasks.firstWhere((element) {
  //   return getListTasks.remove(taskid==taskid);
  // });

  getListTasks.removeWhere((element) => element.taskId==taskid);
  notifyListeners();
  }
    if(data.data["success"]==false){
    log('not deleted');
  }
}
}


