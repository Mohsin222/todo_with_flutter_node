import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_node/models/task_model.dart';
import 'package:todo_with_node/services/task_api.dart';

class GetTaskProvider extends ChangeNotifier{

  GetTaskProvider(){
    getAllTask();
  }
List<TaskModel> getListTasks =[];
getAllTask()async{
  getListTasks.clear();
var data =await TaskApiClass.gettasks();

  for (var i in data.data['data']) {
      TaskModel taskModel = TaskModel.fromMap(i);

      getListTasks.add(taskModel);
    }
    notifyListeners();
print(getListTasks);
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
                                   getAllTask();
                                   notifyListeners();

}



}