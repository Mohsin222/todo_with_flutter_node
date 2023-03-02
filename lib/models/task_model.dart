// ignore_for_file: public_member_api_docs, sort_constructors_first

class TaskModel {

  late String? title;
  late String? description;
  late bool? status;
 late String? email;
 String? taskId;
 DateTime? dateTime;
// late DateTime date;
  TaskModel({
    required this.title,
    required this.description,
    required this.status,
   required this.email,
  required this.taskId,
    // required this.date,
    required this.dateTime
  });


  TaskModel.fromMap(Map<String,dynamic> map){

title=map['title'];
description=map['description'];
status=map['status'];
email=map["email"];
taskId:map["taskid"];
dateTime:map['publistDate'];

  }


   Map<String, dynamic> toMap(){
    return {
      'title':title,
      'description':description,
      'status':status,
      'email':email,
      'taskid':taskId,
      'publistDate':dateTime
    };
   }
}
