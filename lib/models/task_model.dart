import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TaskModel {

   String? title;
   String? description;
   bool? status;
 String? email;
 String? taskId;
 String? dateTime;
 String? taskCompleteDate;
// late DateTime date;
  TaskModel({
    required this.title,
    required this.description,
     this.status,
   required this.email,
  required this.taskId,
    // required this.date,
     this.dateTime,
   this.taskCompleteDate
  });


//   TaskModel.fromMap(Map<String,dynamic> map){

// title=map['title'];
// description=map['description'];
// status=map['status'];
// email=map["email"];
// taskId:map["taskid"];
// dateTime:map['publishDate'];

//   }


//    Map<String, dynamic> toMap(){
//     return {
//       'title':title,
//       'description':description,
//       'status':status,
//       'email':email,
//       'taskid':taskId,
//       'publishDate':dateTime
//     };
//    }

 Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'status': status.toString() ,
      'email': email,
      'taskid': taskId,
      'publishDate':dateTime,
      // 'dateTime': dateTime,
      'taskCompleteDate':taskCompleteDate,
    };
  }

factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      status: map['status'] != null ? map['status'] as bool : false,
      email: map['email'] != null ? map['email'] as String : null,
      taskId: map['taskid'] != null ? map['taskid'] as String : null,
      dateTime: map['publishDate'] != null ? map['publishDate'] as String:null,
      // dateTime: map['publishDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['publishDate'] as int) : null,
          taskCompleteDate: map['taskCompleteDate'] != null ? map['taskCompleteDate'] as String : null,
    );
  }


  String toJson() => json.encode(toMap());

 factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}


class T1 {
 String? title;
String? description;
 bool? status;
String? email;
  String? taskId;
 String? dateTime;
 String? taskCompleteDate;
  T1({
    this.title,
    this.description,
    this.status,
    this.email,
    this.taskId,
    this.dateTime, String? taskCompleteDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'status': status,
      'email': email,
      'taskId': taskId,
      'dateTime': dateTime,
      'taskCompleteDate': taskCompleteDate,
    };
  }

  factory T1.fromMap(Map<String, dynamic> map) {
    return T1(
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      status: map['status'] != null ? map['status'] as bool : null,
      email: map['email'] != null ? map['email'] as String : null,
      taskId: map['taskId'] != null ? map['taskId'] as String : null,
      dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
      taskCompleteDate: map['taskCompleteDate'] != null ? map['taskCompleteDate'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory T1.fromJson(String source) => T1.fromMap(json.decode(source) as Map<String, dynamic>);
}
