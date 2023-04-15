// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/components/button1.dart';
import 'package:todo_with_node/providers/auth_provider.dart';
import 'package:todo_with_node/views/auth/login_screen.dart';

import '../../components/text_field.dart';



class SignUpScreen extends StatefulWidget {


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
    final _formKey = GlobalKey<FormState>();

TextEditingController emailController= TextEditingController();

TextEditingController passwordController =TextEditingController();

TextEditingController userNameController= TextEditingController();

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      
            child: Container(
                 decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(image: AssetImage('assets/background1.jpg'),fit: BoxFit.cover)),
              child: Consumer<AuthProvider>(
             
                builder: (context, value,child) {
                  return LoadingOverlay(
                    isLoading: value.loading,
                    child: Container(
                         margin: EdgeInsets.symmetric(horizontal: 10),
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Form(
                            key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // logo
                              // Container(
                              //   height: 50,
                              //                   color: Colors.red,
                              //   child: SvgPicture.asset('/assets/logo.svg',color: Colors.black,),),
                              Container(
                               height: 50,
                                child: SvgPicture.network('/assets/logo.svg',color: Colors.white,)),
                              SizedBox(height: 12,),
                              // heading
                              Container(
                          
                                // height: 24,
                                child: Text('Sing Up to App',style: TextStyle(fontSize: 24,color: Colors.white),),),
                                  SizedBox(height: 4,),
                                    Container(
                                // height: 24,
                                child: Text('We re happy to see you here',style: TextStyle(fontSize: 16,color: Colors.white),),),
                                  
                                  
                                           SizedBox(height: 12,),
                                           //email section start
                                              fieldsHeading('Email'),
                                  SizedBox(height: 8,),
                                Container(
                                
                                  // padding: EdgeInsets.all(5),
                                  height: 55,
                                  
                                  child:TextFormField(
                 
                                               style:  TextStyle(color: Colors.white),
                                     cursorColor: Colors.white,
                                    controller: emailController,
                                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                                    },
                            decoration:  textDecoration( lableText: 'Enter Yout Email' , prefixIcon: Icon(Icons.mail)),
                          ),),
                             //  email Section end xxxxxxxxxxxxxxxx
                              SizedBox(height: 16,),
                                                   //  password Section  
                                  
                                                    fieldsHeading('Password'),
                                             
                                  SizedBox(height: 8,),
                                Container(
                         
                                  height: 55,
                                  
                                  child: TextFormField(
                                      style:  TextStyle(color: Colors.white),
                                     cursorColor: Colors.white,
                                    controller: passwordController,
                                                        validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                                    },
                                                 decoration: textDecoration(lableText: 'Enter your UserName',prefixIcon: Icon(Icons.lock)),  
                           
                          ),),
                                           //  password  Section end xxxxxxxxxxxxxxxx
                          SizedBox(height: 16,),
                                  
                                  
                                  
                                  
                                           //  userName Section 
                                                       fieldsHeading('User Name'),   
                             
                                  SizedBox(height: 8,),
                                Container(
                                
                             
                                  height: 55,
                                  
                                  child: TextFormField(
                                     cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white),
                                    controller: userNameController,
                                                        validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                                    },
                                  
                              // decoration: textDecoration(lableText: 'Enter your UserName'),   
                              decoration: textDecoration(lableText: 'Enter username',prefixIcon: Icon(Icons.person))  
                                    
                                     
                          ),),
                                           //  userName  Section end xxxxxxxxxxxxxxxx
                           SizedBox(height: 72,),
                                  
                          //  login button
                    
                           Button1(text: 'SIGN UP', press: (){
    if (_formKey.currentState!.validate()) {
                                      
                                  value.signUp(userName: userNameController.text.trim(), email: emailController.text.trim(), password: passwordController.text.trim() ,context: context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                                }
                           }),
                          //  Spacer(),
                                SizedBox(height: 34,),
                                         Container(
                                // height: 24,
                                child: Text('Already Have an account',style: TextStyle(fontSize: 16,color: Colors.white),),),
                                            InkWell(
                                          onTap: (){
                                   Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop,duration: Duration(seconds: 1), child: LoginScreen()));            
                                          },
                                          child: Container(
                                                
                                                                    child: Text('Login ',style: TextStyle(fontSize: 18,color: Colors.white),),),
                                        ),
                                SizedBox(height: 34,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                     
                    ),
            ),
      ),
      
    );
  }

  // fieldsHeading(String headingText){
  //   return        Container(
  //             //  email Section
  //                   child: Align(
  //                     alignment: Alignment.centerLeft,
  //                     child: Text(headingText,style: TextStyle(fontSize: 16,color: Colors.white),)),);
  // }

  //  textDecoration({required String lableText, Icon? prefixIcon}){
  //  return InputDecoration(
  //                 prefix: Icon ==null ?null:prefixIcon,
  //                   border: OutlineInputBorder(),
  //            hintText: 'aa',
  //                 labelText: lableText,
  //               );
  //  }
}

// class Txt_Field extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final Icon prefixIcon;
//   final Function(String val) press;
//   const Txt_Field({

//     required this.controller,
//     required this.labelText,
//     required this.prefixIcon,
//     required this.press,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       validator: press(''),
//                 decoration:  InputDecoration(
//     prefix: Icon(Icons.mail) ==null ?null :Icon(Icons.mail),
//                     border: OutlineInputBorder(),
//                   labelText: 'Enter your Email',
//                 ),
//               );
//   }
// }
