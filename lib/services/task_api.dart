import 'package:dio/dio.dart';
import 'package:todo_with_node/models/task_model.dart';

class TaskApiClass {
  
  
 static gettasks() async {
  List<TaskModel> task = [];
  final dio = Dio();
    final response =
        await dio.get('https://viridian-jellyfish-sock.cyclic.app/task');
//  final  response = await dio.post('https://viridian-jellyfish-sock.cyclic.app/task', data: {'title': "HASSAN", 'status': true});
    print(response.data['data']);

  

    return response;
  }
}
