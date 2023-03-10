import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TaskModel {

   String? title;
   String? description;
   bool? status;
 String? email;
 String? taskId;
 String? dateTime;
// late DateTime date;
  TaskModel({
    required this.title,
    required this.description,
     this.status,
   required this.email,
  required this.taskId,
    // required this.date,
     this.dateTime
  });


//   TaskModel.fromMap(Map<String,dynamic> map){

// title=map['title'];
// description=map['description'];
// status=map['status'];
// email=map["email"];
// taskId:map["taskid"];
// dateTime:map['publistDate'];

//   }


//    Map<String, dynamic> toMap(){
//     return {
//       'title':title,
//       'description':description,
//       'status':status,
//       'email':email,
//       'taskid':taskId,
//       'publistDate':dateTime
//     };
//    }

 Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      // 'status': status,
      'email': email,
      'taskid': taskId,
      // 'publistDate':DateTime.now(),
      // 'dateTime': dateTime?.millisecondsSinceEpoch,
    };
  }

factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      status: map['status'] != null ? map['status'] as bool : false,
      email: map['email'] != null ? map['email'] as String : null,
      taskId: map['taskid'] != null ? map['taskid'] as String : null,
      dateTime: map['publistDate'] != null ? map['publistDate'] as String:null
      // dateTime: map['publistDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['publistDate'] as int) : null,
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
  T1({
    this.title,
    this.description,
    this.status,
    this.email,
    this.taskId,
    this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'status': status,
      'email': email,
      'taskid': taskId,
      'publistDate':dateTime
      
      // 'dateTime': dateTime?.millisecondsSinceEpoch,
    };
  }

  factory T1.fromMap(Map<String, dynamic> map) {
    return T1(
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      status: map['status'] != null ? map['status'] as bool : false,
      email: map['email'] != null ? map['email'] as String : null,
      taskId: map['taskid'] != null ? map['taskid'] as String : null,
      dateTime: map['publistDate'] != null ? map['publistDate'] as String:null
      // dateTime: map['publistDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['publistDate'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory T1.fromJson(String source) => T1.fromMap(json.decode(source) as Map<String, dynamic>);
}
