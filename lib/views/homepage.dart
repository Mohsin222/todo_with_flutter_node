import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),backgroundColor: Color(0xffe91e63),),
      backgroundColor: Theme.of(context).primaryColor,

      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text('Hi Buddy',style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black,fontWeight: FontWeight.w500),),
              ),
                 Container(
                child: Text('This is your Todos',style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black,fontWeight: FontWeight.w500),),


              ),
              SizedBox(height: 40,),
              // Expanded(child: GridView.builder(
              //      itemCount: 20,  
              //   gridDelegate: 
              //   SliverGridDelegateWithFixedCrossAxisCount(  
              //     crossAxisCount: 2,  
              //     crossAxisSpacing: 4.0,  
              //     mainAxisSpacing: 4.0  
              // ),  
              //    itemBuilder: (context,index){
              //     return Material(
              //       elevation: 10,
              //       child: Container(
              //         width: 100,
              //         height: 100,
              //         color: Colors.white,
              //       ),
              //     );
              //    }))

              Expanded(child: LayoutBuilder(builder: (context, constraints) {
      return      GridView.builder(
                   itemCount: 20,  
                gridDelegate: 
                SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: constraints.maxWidth>600?3:constraints.maxWidth>900? 4:2,  
                  crossAxisSpacing: 10.0,  
                  mainAxisSpacing: 10.0  
              ),  
                 itemBuilder: (context,index){
                  return Material(
                        color: Colors.white,
                    elevation: 20,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      width: 100,
                      height: 100,
                  
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
Container(
    color: Colors.purpleAccent,
 padding: EdgeInsets.all(8),
  child: Text('MY WORLD')),

  Container(
    alignment: Alignment.center,
    child: Text('My NAME IS KHAN',maxLines: 2,
    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
    ),
  ),

  // date
Container(
    alignment: Alignment.center,
    child: Text(DateTime.now().toString(),
    style: TextStyle(fontSize: 10,fontWeight: FontWeight.w200),
    ),
  ),
                        ],
                      ),
                    ),
                  );
                 });
              },))
            ],
          ),
        ),
      ),
      
    );
  }
}