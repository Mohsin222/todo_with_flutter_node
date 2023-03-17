import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/components/dialog1.dart';
import 'package:todo_with_node/models/task_model.dart';
import 'package:todo_with_node/providers/get_task_provider.dart';
import 'package:todo_with_node/services/task_api.dart';

class TaskDetailsScreen extends StatelessWidget {
  final int index;
  const TaskDetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1473081556163-2a17de81fc97?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fGRhcmt8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
                fit: BoxFit.cover)),
        child: Center(
          child: Consumer<GetTaskProvider>(
            builder: (context, value, child) {
              return Consumer<GetTaskProvider>(builder: (context, val, child) {
                TaskModel taskModel = val.getListTasks[index];

                // var format = DateFormat.yMd(taskModel.dateTime);
                DateTime dt1 = DateTime.parse("2021-12-23 11:47:00");

                // val.updateSwitchvalue(taskModel.status!);
                return Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // color: taskModel.status ==true?

                  //  Color(0xffe91e63):val.taskCompleteColor,
                  color: Colors.white.withOpacity(0.3),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Text(
                          taskModel.title.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Flexible(
                          flex: 2,
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white, fontSize: 20),
                            maxLines: 6,
                          ),
                        ),
                        
                      ),
                      SizedBox(height: 10,),
    Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(val.switchValue == true
                                        ? 'Complete'
                                        : 'Incomplete',
                                        style: TextStyle(
                                          color: val.switchValue ==true ?Colors.pink[300]:Colors.white,
                                          fontSize: 17,  fontWeight:FontWeight.bold
                                        ),
                                        ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: CupertinoSwitch(
                                      // This bool value toggles the switch.
                  
                                      value: val.switchValue,
                  
                                      activeColor: Colors.pink[300],
                                      
                  
                                      onChanged: (bool? value) async{
                                        // This is called when the user toggles the switch.
                  // val.changeCardStatus(value, taskModel.taskCompleteDate);
                  // val.updateSwitchvalue(value!);
                  // taskModel.status =val.switchValue;
                  // taskModel.status=value;
                //  val.switchValue=value!;
                dialog1(press: (){
      val.updateTask(context: context,taskId: taskModel.taskId);
    Navigator.pop(context);
                }, dialogTtile: 'UPDATE', dialogContent: 'Are you change the status', context: context);
 
                                  
                                      },
                                    ),
                                  ),
                                ],
                              ),

                      SizedBox(height: 10,),
                      // Dates row
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
           
                        children: [
                             Column(

                                     crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                               
                                  
                                Container(
                                  // alignment: Alignment.centerLeft,
                                  child: Text('Start Time',
                                          style: TextStyle(fontSize: 17,  color: Colors.white,fontWeight:FontWeight.bold),
                                          textAlign: TextAlign.start,
                                          ),
                                ),
                              
                  
                                      Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.parse(taskModel.dateTime.toString())).toString(),
                                        style: TextStyle(fontSize: 13,  color: Colors.white)),
                                  ),
                                ],
                              ),
                                 Column(
                                  
                           crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Dead line',
                                          style: TextStyle(fontSize: 17,  color: Colors.white,fontWeight:FontWeight.bold),
                                        
                                        ),
                                  ),
                  
                                      Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.parse(taskModel.taskCompleteDate.toString())).toString(),
                                        style: TextStyle(fontSize: 13,  color: Colors.white)),
                                  ),
                                ],
                              ),
                        ],
                       ),

                       //xxxxxxxxxxx      // Dates row end xxxxxxxxxxxxxxxxxxxxx
                    ]),
                  ),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
