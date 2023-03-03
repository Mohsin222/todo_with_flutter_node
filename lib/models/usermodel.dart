// ignore_for_file: unused_label

class UserModel{

  String? email;
  String? password;
  String? userName;
  String? id;


  UserModel({
    this.email,
    this.password,this.userName,this.id
  });
//for get data
  UserModel.fromMap(Map<String,dynamic> map){
        password:map['password'];
    email=map['email'];

    userName:map['userName'];
    id:map['_id'].toString();
  }

  Map<String,dynamic> toMap(){
    return {
'email':email,
'password':password,
'userName':userName,
'_id':id

    };
  }
}