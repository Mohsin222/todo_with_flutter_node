import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';


dialog1 ({required VoidCallback press, required String dialogTtile, required String dialogContent ,required BuildContext context})async{
  return     showDialog(context: context, builder:(context) {
                return Dialog(
                  backgroundColor: Colors.white.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 200,
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(dialogTtile,style: TextStyle(fontSize: 27,color: Colors.white,fontWeight: FontWeight.w700),),
                        Expanded(child: Align(
                          alignment: Alignment.center,
                          child: Text(dialogContent,style: TextStyle(fontSize: 20,color: Colors.white),))),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Container(
              
                            child: ElevatedButton(onPressed: press, child: Text('YES'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10),
                              backgroundColor: Colors.white.withOpacity(0.6)
                            ),
                            )),TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Text('No',style: TextStyle(fontSize: 18,color: Colors.white)))],
                        ),
                      ],
                    ),
                  ),
                );
              },);
}









dialog2 ({ required String dialogTtile, required String dialogContent ,required BuildContext context})async{
  return     showDialog(context: context, builder:(context) {
                return Dialog(
                  backgroundColor: Colors.white.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 200,
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(dialogTtile,style: TextStyle(fontSize: 27,color: Colors.white,fontWeight: FontWeight.w700),),
                        Expanded(child: Align(
                          alignment: Alignment.center,
                          child: Text(dialogContent,style: TextStyle(fontSize: 20,color: Colors.white),))),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Text('OK',style: TextStyle(fontSize: 18,color: Colors.white)))],
                        ),
                      ],
                    ),
                  ),
                );
              },);
}