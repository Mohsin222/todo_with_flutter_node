import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/components/button1.dart';

import '../../components/text_field.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

      final _formKey = GlobalKey<FormState>();

TextEditingController emailController= TextEditingController(text: 'moh@g.com');

TextEditingController passwordController =TextEditingController(text: '123456');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
           decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/background1.jpg'),fit: BoxFit.cover)),
          child: Consumer<AuthProvider>(
           
            builder: (context, value,child) {
              return LoadingOverlay(
                color: Colors.black,
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

                        children: [
                
                          Container(
                           height: 50,
                            child: SvgPicture.asset('assets/logo.svg',color: Colors.white,)),
                          SizedBox(height: 12,),
                          // heading
                          Container(
                      
                            // height: 24,
                            child: Text('Login to App',style: TextStyle(fontSize: 24,color: Colors.white),),),
                              SizedBox(height: 4,),
                                Container(
                            // height: 24,
                            child: Text('We re happy to see you back again',style: TextStyle(fontSize: 16,color: Colors.white),),),
                              
                              
                                       SizedBox(height: 12,),
                                       //email section start
                                          fieldsHeading('Email'),
                              SizedBox(height: 8,),
                            Container(
                            
                              // padding: EdgeInsets.all(5),
                              height: 55,
                              
                              child:TextFormField(
                                 cursorColor: Colors.white,
                                style:  TextStyle(color: Colors.white),
                                
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
                                 cursorColor: Colors.white,
                                               style:  TextStyle(color: Colors.white),
                                // initialValue: ,
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
                                
                                
                                
                                
                      
                       SizedBox(height: 72,),
                                
                      //  login button
               
                       Button1(text: 'LOGIN', press: (){
                           value.login( email: emailController.text.trim(), password: passwordController.text.trim(),context: context);
                      
                           //       if (_formKey.currentState!.validate()) {
                          
                        
                      //             ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );
                      //       }
                       }),
                      //  Spacer(),
                            SizedBox(height: 34,),
                                     Container(

                            child: Text('Dont have account',style: TextStyle(fontSize: 16,color: Colors.white),),),
                                        Container(
        
                            child: Text('Sign Up',style: TextStyle(fontSize: 18,color: Colors.white),),),
                            SizedBox(height: 34,),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
               
            ),
        )
      ),
    );
  }

    
}