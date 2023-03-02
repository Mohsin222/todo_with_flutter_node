// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class TaskModel {

  late String? title;
  late String? description;
  late bool? status;
 late String? email;
// late DateTime date;
  TaskModel({
    required this.title,
    required this.description,
    required this.status,
    this.email,
    // required this.date,
  });


  TaskModel.fromMap(Map<String,dynamic> map){

title=map['title'];
description=map['description'];
status=map['status'];
email=map["email"];
// date:map["date"];

  }


   Map<String, dynamic> toMap(){
    return {
      'title':title,
      'description':description,
      'status':status,
      'email':email,



    };
   }
}
