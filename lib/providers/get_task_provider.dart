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
    _resetSelectedDate();
  }
  // for task tile
Color taskCompleteColor=Colors.greenAccent;
 DateTime dateTime =DateTime.now();
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

  // set initial date when ap is start
    DateTime? selectedDate;
   
  void _resetSelectedDate() {
    selectedDate = DateTime.now();
    print(DateTime.now().add(const Duration(days: 0)));
  }


 
List<TaskModel> getListTasks =[];
//get all task
void getAllTask()async{
  getListTasks.clear();
var data =await TaskApiClass.gettasks();



 

  for (var i in data.data['data']) {
      TaskModel taskModel = TaskModel.fromMap(i);

        
if(taskModel.email==userModel.email){
     
  // log("${DateTime.parse(taskModel.dateTime.toString()).day}");

  if(DateTime.parse(taskModel.dateTime.toString()).day == dateTime.day){

 getListTasks.add(taskModel);
  }else{
    // log('FALESSSSS');
  }



  
     
}

    }
    notifyListeners();
// print(data.data['data'][0]['publistDate'].toString());
}

//get all task  end xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx





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

updateTaskStatus({required TaskModel taskModel,  required BuildContext context})async{
  if(switchValue == true){
    switchValue =false;
    notifyListeners();
  }else{
    switchValue =true;
    notifyListeners();
  }
 var data = await  TaskApiClass.updateOnlyTaskStatus(switchValue: switchValue,taskModel: taskModel);


  if(data['success']==true){
      getAllTask();
      notifyListeners();
// Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: TaskList()));
  }else{
    dialog1(press: (){},context: context,dialogContent:data['error'].toString(),dialogTtile: 'ERROR' );
  }
}

updateTask({required TaskModel taskModel,  required BuildContext context})async{
  try {

  notifyListeners();
 var data = await  TaskApiClass.updateOnlyTaskStatus(switchValue: switchValue,taskModel: taskModel);


  if(data['success']==true){
   
      getAllTask();
      notifyListeners();

Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: TaskList()));
  }else{
   
    dialog1(press: (){},context: context,dialogContent:data['error'].toString(),dialogTtile: 'ERROR' );
  }
  } catch (e) {
     dialog1(press: (){},context: context,dialogContent:e.toString(),dialogTtile: 'ERROR' );
  }

}





//delete task
void deleteTask(String taskid, BuildContext context)async{
  var data  = await TaskApiClass.deleteTask(taskid) ;

  if(data["success"]==true){
  // getListTasks.firstWhere((element) {
  //   return getListTasks.remove(taskid==taskid);
  // });

  getListTasks.removeWhere((element) => element.taskId==taskid);
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TaskList()));
  notifyListeners();
  }
    if(data.data["success"]==false){
    log('not deleted');
  }
}
}


