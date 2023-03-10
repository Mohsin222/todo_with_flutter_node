import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_with_node/views/auth/login_screen.dart';
import 'package:todo_with_node/views/auth/signup_screen.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 10),
        
        
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 48,),
                Container(
                  child: Text('Welcome to Todo App',style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black,),),
                ),
            
            SizedBox(height: 100,),

                Container(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                  child: ElevatedButton(onPressed: (){
Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: LoginScreen()));
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  }, child: Text('LOGIN'))),

                  SizedBox(height: 48,),

                               Container(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: SignUpScreen(), isIos: true));
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                  }, child: Text('SignUp')))
              ],
            ),
          ),
        )),
    );
  }
}