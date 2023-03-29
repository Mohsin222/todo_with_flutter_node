import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/components/button1.dart';
import 'package:todo_with_node/components/dialog1.dart';
import 'package:todo_with_node/components/text_field.dart';
import 'package:todo_with_node/models/task_model.dart';
import 'package:todo_with_node/providers/add_task_provider.dart';
import 'package:todo_with_node/providers/auth_provider.dart';
import 'package:todo_with_node/providers/get_task_provider.dart';
import 'package:todo_with_node/services/task_api.dart';

import '../constants/image_paths.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  DateTime? completeDate =DateTime.now();

  DateTime curentDate = DateTime.now();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    completeDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesPath.backgroundImage),
                fit: BoxFit.cover)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                   IconButton(onPressed: (){
                    Navigator.pop(context);
                    }, icon:    Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ))
                    ],
                  ),
                  Container(
                    child: Text(
                      'ADD TASK',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  fieldsHeading('Title'),
                  Container(
                    // padding: EdgeInsets.all(5),
                    height: 55,

                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: textDecoration(lableText: 'Enter Yout Title'),
                    ),
                  ),

                  SizedBox(
                    height: 12,
                  ),
                  fieldsHeading('Description'),

                  TextFormField(
          
              
                    cursorColor: Colors.white,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.white),
                    controller: descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: textDecoration(
                        lableText: 'Enter Yout Title',
                        paddingVertical: 100,
                        paddingHorizontal: 10),
                  ),

             SizedBox(height: 12,),
                                        Text(completeDate.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                                        SizedBox(height: 12,),
                  Button1(text: 'Pick DateTime', press: () {
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
                                   completeDate = date;
                                 });
                               },
                               onConfirm: (date) {
                                 print('confirm $date');
                                 completeDate = date;
                               },
                               currentTime: DateTime.now(),
                               onCancel: () {
                                 setState(() {
                                   completeDate = DateTime.now();
                                 });
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
                               completeDate = date;
                             });
                           }, onConfirm: (date) {
                             print('confirm $date');
                             completeDate = date;
                           },
                               currentTime: DateTime.now(),
                               locale: LocaleType.en);
                         },),
    
                  SizedBox(
                    height: 44,
                  ),
                  // save button
                  Button1(text: 'SAVE', press: () async {
                      if (completeDate!.toUtc().isAfter(curentDate.toUtc())) {
                        print('its good +++++');
                        final saveTask = Provider.of<AddTaskProvider>(
                            context,
                            listen: false);
                        await saveTask.saveTask(
                            context: context,
                            title: titleController.text.trim(),
                            description: descriptionController.text.trim(),
                            completeDate: completeDate.toString());
                        // TaskModel taskModel = TaskModel(
                        //   title: 'a',
                        //   description: 'aa',
                        //   email: 'avav',
                        //   taskId: '1',
                        // );
                      } else {
                        print('not good -=--');
                        dialog1(
                            press: () {},
                            dialogTtile: 'Date Error',
                            dialogContent:
                                'Complete date must me greater then current time',
                            context: context);
                      }

                      //  TaskApiClass.saveTask(taskModel);
                      //  TaskApiClass.saveTask();
                      //       if (_formKey.currentState!.validate()) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      //       }
                    },),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
