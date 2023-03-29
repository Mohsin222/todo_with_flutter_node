import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/components/button1.dart';
import 'package:todo_with_node/components/dialog1.dart';
import 'package:todo_with_node/models/task_model.dart';
import 'package:todo_with_node/providers/get_task_provider.dart';
import 'package:todo_with_node/services/task_api.dart';

import '../components/text_field.dart';
import '../constants/image_paths.dart';

class TaskDetailsScreen extends StatefulWidget {
  final int index;
  const TaskDetailsScreen({super.key, required this.index});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}
TextEditingController titleController =TextEditingController();
TextEditingController descriptionController =TextEditingController();
class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
    void _show({required TaskModel taskModel ,required BuildContext ctx, required VoidCallback press}) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white.withOpacity(0.3),
        context: ctx,
           shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical( 
            top: Radius.circular(25.0),
          ),
        ),
        builder: (ctx) => Container(
          decoration: BoxDecoration(
                  // color: Colors.black,
            // image: DecorationImage(image: AssetImage(ImagesPath.backgroundImage)),
            ),
              width: 300,
              height: MediaQuery.of(ctx).size.height/2,
        
              alignment: Alignment.center,
              child: Column(children: [
                Container(
                  // height: 55,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: TextEditingController(text: taskModel.title),
                               cursorColor: Colors.white,
                                               style:  TextStyle(color: Colors.white),

                    decoration: textDecoration(lableText: taskModel.title.toString()),
                    onChanged: (val){
                      taskModel.title= val;
                    },
                  ),
                ),
                SizedBox(height: 12,),
                       Container(
                  // height: 55,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                       cursorColor: Colors.white,
                                               style:  TextStyle(color: Colors.white),
                    controller: TextEditingController(text: taskModel.description),

                       onChanged: (val){
                      taskModel.description= val;
                    },
                    
                                        decoration: textDecoration(lableText: '',
                                              paddingVertical: 50,
                        paddingHorizontal: 10,
                     
                                        ),
                  ),
                ),
Text(taskModel.taskCompleteDate!),
          Container(
                  // height: 55,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                  
                               cursorColor: Colors.white,
                                               style:  TextStyle(color: Colors.white),
                                               
                     controller: TextEditingController(text: taskModel.taskCompleteDate),
                     onChanged: (val){
                      taskModel.taskCompleteDate =val;
                     },
                    decoration: textDecoration(lableText: taskModel.title.toString(),
                       suffixIcon: IconButton(onPressed:press, icon: Icon(Icons.arrow_drop_down))
                    ),
                  ),
                ),
        //  Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [Text("Date"),
        //   IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down))
        //   ],
        //  ),
        
             ElevatedButton(
      child: Text(
        "Buy now".toUpperCase(),
        style: TextStyle(fontSize: 14)
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: Colors.white)
          )
        )
      ),
      onPressed: () => null
    )
              ]),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

   
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1473081556163-2a17de81fc97?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fGRhcmt8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
                fit: BoxFit.cover)),
        child: Center(
          child: Consumer<GetTaskProvider>(
            builder: (context, value, child) {
              return Consumer<GetTaskProvider>(builder: (context, val, child) {
                TaskModel taskModel = val.getListTasks[widget.index];

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
                          Consumer<GetTaskProvider>(
                          
                            builder: (context, value,child) {
                              return IconButton(
                                onPressed: () {
                                  _show(taskModel: taskModel,ctx:context,press: (){
                                    // time picker
                               DatePicker.showTimePicker(context,
                                    theme: DatePickerTheme(backgroundColor: Colors.white,
                                        //  itemStyle: TextStyle(color: Colors.black),
                                        //  doneStyle: TextStyle(color: Colors.white),
                                        //  headerColor: Colors.white.withOpacity(0.6)
                                         ),
                                   showTitleActions: true,
                                   onChanged: (date) {
                                     print('change $date in time zone ' +
                                         date.timeZoneOffset.inHours.toString());
                          
                                
                                   setState(() {
                                         value.selectedDate = date;
                                   });
                                   
                                   },
                                   onConfirm: (date) {
                                     print('confirm $date');
                             setState(() {
                                       value.selectedDate = date;
                             });
                                   },
                                   currentTime: DateTime.now(),
                                   onCancel: () {
                            
                                       value.selectedDate = DateTime.parse(taskModel.taskCompleteDate!);
                            
                                   });


                                                // date picker
                           DatePicker.showDatePicker(context,
                                     theme: DatePickerTheme(backgroundColor: Colors.white,
                                    //  itemStyle: TextStyle(color: Colors.black),
                                    //  doneStyle: TextStyle(color: Colors.white),
                                    //  headerColor: Colors.white.withOpacity(0.6)
                                     ),
                               showTitleActions: true,
                               minTime: DateTime.now(),
                               maxTime: DateTime(2024, 6, 7),
                               onChanged: (date) {
                             print('change $date');
                  
                             setState(() {
                                 value.selectedDate = date;
                             });
                        
                           }, onConfirm: (date) {
                             print('confirm $date');
                          setState(() {
                               value.selectedDate = date;
                          });
                           },
                               currentTime:DateTime.parse(taskModel.taskCompleteDate!),
                               locale: LocaleType.en);
                            
                                  });



                      
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              );
                            }
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
                                    child: Text(taskModel.status == true
                                        ? 'Complete'
                                        : 'Incomplete',
                                        style: TextStyle(
                                          color: taskModel.status ==true ?Colors.pink[300]:Colors.white,
                                          fontSize: 17,  fontWeight:FontWeight.bold
                                        ),
                                        ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: CupertinoSwitch(
                                      // This bool value toggles the switch.
                  
                                      value: taskModel.status!,
                  
                                      activeColor: Colors.pink[300],
                                      
                  
                                      onChanged: (bool? value) async{
                  
               
                dialog1(press: (){
 taskModel.status=value;
 
      val.updateTask(context: context,taskModel: taskModel);
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
