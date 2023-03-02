class UserModel{

  late String? email;
  late String? password;
  late String? userName;
  late String? id;


  UserModel({
    this.email,
    this.password,this.userName,this.id
  });
//for get data
  UserModel.fromMap(Map<String,dynamic> map){
    email=map['email'];
    password:map['password'];
    userName:map['userName'];
    id:map['id'];
  }

  Map<String,dynamic> toMap(){
    return {
'email':email,
'password':password,
'userName':userName,
'id':id

    };
  }
}