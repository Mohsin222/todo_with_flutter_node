import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_with_node/components/dialog1.dart';
import 'package:todo_with_node/views/auth/login_screen.dart';
import 'package:todo_with_node/views/auth/signup_screen.dart';

import '../components/button1.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var space = SizedBox(height: 28,);
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
             color: Color(0xff1c1a28),
          image: DecorationImage(image:AssetImage('assets/background1.jpg'),fit: BoxFit.cover),
          
          ),
               
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      
        
        
        child: Container(

   
          child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                     height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

           
                  Container(
                    child: Text('Welcome to \nTodo App',style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                    SizedBox(height: 10,),
                  Container(child: Text('Create Your Daily Task',style: TextStyle(fontSize: 20,letterSpacing: 2,color: Colors.white.withOpacity(0.8)),),),
              
         space,
                    //login button xxxxxxxxxxxxxxxxxxxxxxxxxx
                     
                                Button1(text: 'LOGIN', press: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom,duration: Duration(seconds: 1), child: LoginScreen()));
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                }),
                    
                    space,
                    // sign up button
                                 Button1(text: 'Sign Up'.toUpperCase(),press: (){
                                  // dialog1(press: (){}, dialogTtile: 'TTULE', dialogContent: "aaaa", context: context);
      Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop,duration: Duration(seconds: 1), child: SignUpScreen(), isIos: true));
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
    },),
                                 space,
                ] .animate(interval:300.ms).slideX(),
              ),
            ),
          ),
        )),
    );
  }
}

