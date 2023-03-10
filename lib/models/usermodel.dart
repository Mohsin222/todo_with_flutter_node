// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: unused_label

class UserModel {

  String? email;
  String? password;
  String? userName;
  String? id;


  UserModel({
    this.email,
    this.password,this.userName,this.id
  });
//for get data
//   UserModel.fromMap(Map<String,dynamic> map){
//         password:map['password'];
//     email=map['email'];

//     userName:map['userName'];
//     id:map['_id'].toString();
//   }

//   Map<String,dynamic> toMap(){
//     return {
// 'email':email,
// 'password':password,
// 'userName':userName,
// '_id':id

//     };
//   }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'userName': userName,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
