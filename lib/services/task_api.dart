import 'dart:convert';
import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:todo_with_node/models/task_model.dart';
import 'package:http/http.dart' as http;
import 'package:todo_with_node/models/usermodel.dart';
class TaskApiClass {
  static String apiUrl ="https://adorable-teal-wetsuit.cyclic.app";
  
 static gettasks() async {
  List<TaskModel> task = [];
  final dio = Dio();
    final response =
        await dio.get('$apiUrl/task');
//  final  response = await dio.post('https://viridian-jellyfish-sock.cyclic.app/task', data: {'title': "HASSAN", 'status': true});
    // print(response.data['data'][0]['publistDate']+'aaaaaaaaaaaaaaaaaaaa');
    return response;
  }

// TaskModel taskModel
  static saveTask(TaskModel taskModel)async{
    
    var url = Uri.parse('$apiUrl/task');
    var response = await http.post(url,body:taskModel.toMap()
    
    
// "title":title,
//     "email":"moh@g.com",
//     "description":descrip,
//     "status":false


//     }
    );
print(response.statusCode.toString()+'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
   
if(response.statusCode ==200){

  var decode = jsonDecode(response.body);
print(response);
    return decode;
}else{
  print(response);
    var decode = jsonDecode(response.body);
  // log(decode.toString()+'fassaaa');
  return decode;
}
 
}


// Update Task
static updateTask(String taskid)async{
 var url = Uri.parse('$apiUrl/task/update/ddd0fbd0-c02f-11ed-aa9e-f15d0d760e2c');
  var response = await http.patch(url,body: {
    "title":"ALPHA"
  });

    if(response.statusCode ==200){

  var decode = jsonDecode(response.body);
  log(response.statusCode.toString());
print(decode);
    return decode;
}else{
  print(response.statusCode);
    var decode = jsonDecode(response.body);
    print(decode.toString());
  // log(decode.toString()+'fassaaa');
  return decode;
}


  
}

// Delete Task

static deleteTask(String taskid)async{
  var url = Uri.parse('$apiUrl/task/delete/$taskid');
 var response = await http.delete(url);
  if(response.statusCode ==200){

  var decode = jsonDecode(response.body);
  log(response.statusCode.toString());
print(decode);
    return decode;
}else{
  print(response);
    var decode = jsonDecode(response.body);
    print(decode.toString());
  // log(decode.toString()+'fassaaa');
  return decode;
}
}


static updateOnlyTaskStatus({required bool switchValue,required TaskModel taskModel})async{

  log(taskModel.status.toString());
   var url = Uri.parse('$apiUrl/task/update/${taskModel.taskId}');
  var response = await http.patch(url,body: taskModel.toMap());


  log(response.statusCode.toString());

      if(response.statusCode ==200){

  var decode = jsonDecode(response.body);
  log(response.statusCode.toString());
print(decode);
    return decode;
}else{
  print(response.statusCode);
    var decode = jsonDecode(response.body);
    print(decode.toString());
  // log(decode.toString()+'fassaaa');
  return decode;
}
}
}
