import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/models/task_model.dart';
import 'package:todo_with_node/providers/auth_provider.dart';
import 'package:todo_with_node/services/task_api.dart';
import 'package:todo_with_node/views/tasklist.dart';
import 'package:uuid/uuid.dart';

class GetTaskProvider extends ChangeNotifier{

  GetTaskProvider(){
    getAllTask();
  }

  void updateDate(DateTime newdateTime){
    dateTime=newdateTime;
    getAllTask();
    notifyListeners();
  }

  DateTime dateTime =DateTime.now();
List<TaskModel> getListTasks =[];
void getAllTask()async{
  getListTasks=[];
var data =await TaskApiClass.gettasks();

print(data.toString());

  for (var i in data.data['data']) {
      TaskModel taskModel = TaskModel.fromMap(i);
       var d = DateTime.parse(taskModel.dateTime.toString());
        
if(taskModel.email=='moh@g.com'){
 DateTime.parse("2018-02-27 10:09:00");
  // DateFormat.parse(taskModel.dateTime.toString());
  if(d.day == dateTime.day){
 getListTasks.add(taskModel);
  }


  
     
}

    }
    notifyListeners();
// print(data.data['data'][0]['publistDate'].toString());
}


// for task tile
Color taskCompleteColor=Colors.greenAccent;



bool switchValue = true;
changeCardStatus(bool? val){
       switchValue == true
                                        ? taskCompleteColor = Colors.white
                                        : taskCompleteColor =
                                            Color(0xffe91e63);

                                   switchValue = val ?? false;
                                  //  getAllTask();
                                   notifyListeners();

}



saveTask({required BuildContext context, required String title,required String description})async{
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
dateTime: DateTime.now().toString()


);
var data = await TaskApiClass.saveTask(taskModel);

 if(data['success']==true){
  notifyListeners();

  print(data.toString() +"AAAAA");
Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: TaskList()));
 }else{
  
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
  getListTasks.firstWhere((element) {
    return getListTasks.remove(taskid==taskid);
  });
  notifyListeners();
  }
    if(data.data["success"]==false){
    log('not deleted');
  }
}
}


