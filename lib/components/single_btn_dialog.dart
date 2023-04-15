import 'package:flutter/material.dart';

singleButtonDialog ({required VoidCallback press, required String dialogTtile, required String dialogContent ,required BuildContext context})async{
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
                            Container(
              
                            child: ElevatedButton(onPressed: press, child: Text('YES'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10),
                              backgroundColor: Colors.white.withOpacity(0.6)
                            ),
                            ))
                            ],
                        ),
                      ],
                    ),
                  ),
                );
              },);
}