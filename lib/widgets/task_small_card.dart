import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/components/dialog1.dart';
import 'package:todo_with_node/providers/get_task_provider.dart';
import 'package:todo_with_node/services/task_api.dart';
import 'package:todo_with_node/views/task_details_screen.dart';

import '../models/task_model.dart';

class TaskSmallCard extends StatelessWidget {
  final int index;
  const TaskSmallCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return        Consumer<GetTaskProvider>(builder: (context, val, child) {

      TaskModel taskModel =val.getListTasks[index];
  
  // var format = DateFormat.yMd(taskModel.dateTime);
  //  DateTime dt1 = DateTime.parse("2021-12-23 11:47:00");
                return 
                  
                  GestureDetector(
                    onTap: (){
  Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: TaskDetailsScreen(index: index,)));

                    },
                    child: Card(
                      
                      shape: RoundedRectangleBorder(
                        
                      side: BorderSide(
                       
                      ),
                       borderRadius: BorderRadius.circular(20.0), 
                    ),
                        // color: taskModel.status ==true?
                    
                        //  Color(0xffe91e63):val.taskCompleteColor,
                        color: Colors.white.withOpacity(0.3),
                        child: Container(
                        // constraints: BoxConstraints(minHeight: 200),
                          padding: EdgeInsets.all(10),
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                         
                            children: [
                  
                              Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(onPressed: (){
      
                  TaskApiClass.updateTask('');
                                  
                                  }, icon: Icon(Icons.add)),
                  
                                  IconButton(onPressed: (){
                  
                           dialog1(context: context,dialogTtile: 'DELETE DIALOG',dialogContent: 'Are you sure to delete this',press: (){
                    log(taskModel.taskId.toString());
                               
                                val.deleteTask(taskModel.taskId.toString());
                                 Navigator.pop(context);
                           });         
                               
                                  }, icon: Icon(Icons.delete_outline_sharp,color: Colors.red[100],size:40 ,))
                                ],
                              ),
                              Container(
                                child: Text(taskModel.email.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white)),
                              ),
                                    Container(
                                child: Text(
                                  
                            // taskModel.dateTime.toString(),
                            DateFormat('yyyy-MM-dd').format(DateTime.parse(taskModel.dateTime.toString()) as DateTime),
                               
                                    style: TextStyle(
                                        fontSize: 15,
                                       color: Colors.white)),
                              ),
                              Container(
                                child: Text(
                                  taskModel.title.toString(),
                                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(  color: Colors.white),
                                ),
                              ),
                              Container(
                          
                                child: Flexible(
                                  flex: 4,
                                  child: Text(
                                    taskModel.description.toString(),
                                    style: TextStyle(fontSize: 15,  color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 6,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Dead line',
                                        style: TextStyle(fontSize: 17,  color: Colors.white)),
                                  ),
                  
                                      Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(taskModel.taskCompleteDate.toString(),
                                        style: TextStyle(fontSize: 13,  color: Colors.white)),
                                  ),
                                ],
                              ),
                              Spacer(),
                              //complete status row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(taskModel.status == true
                                        ? 'Complete'
                                        : 'Incomplete',style: TextStyle(fontSize: 24,color: Colors.white),),
                                  ),
                  //                 Container(
                  //                   alignment: Alignment.centerRight,
                  //                   child: CupertinoSwitch(
                  //                     // This bool value toggles the switch.
                  
                  //                     value: val.switchValue,
                  
                  //                     activeColor: Color.fromARGB(255, 104, 0, 35),
                  
                  //                     onChanged: (bool? value) {
                  //                       // This is called when the user toggles the switch.
                  // val.changeCardStatus(value, taskModel.taskCompleteDate);
                                  
                  //                     },
                  //                   ),
                  //                 ),
                                ],
                              ),
                            ],
                          ),
                        ),
                                  ),
                  );
              });
  }
}