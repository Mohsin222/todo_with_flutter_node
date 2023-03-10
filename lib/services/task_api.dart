import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:todo_with_node/models/task_model.dart';
import 'package:http/http.dart' as http;
import 'package:todo_with_node/models/usermodel.dart';
class TaskApiClass {
  
  
 static gettasks() async {
  List<TaskModel> task = [];
  final dio = Dio();
    final response =
        await dio.get('https://viridian-jellyfish-sock.cyclic.app/task');
//  final  response = await dio.post('https://viridian-jellyfish-sock.cyclic.app/task', data: {'title': "HASSAN", 'status': true});
    // print(response.data['data'][0]['publistDate']+'aaaaaaaaaaaaaaaaaaaa');
    return response;
  }

// TaskModel taskModel
  static saveTask(TaskModel taskModel)async{
    
    var url = Uri.parse('https://viridian-jellyfish-sock.cyclic.app/task');
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


// Delete Task

static deleteTask(String taskid)async{
  var url = Uri.parse('https://viridian-jellyfish-sock.cyclic.app/task/delete/$taskid');
 var response = await http.delete(url);
  if(response.statusCode ==200){

  var decode = jsonDecode(response.body);
  log(response.statusCode);
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
}
