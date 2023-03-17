import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/components/dialog1.dart';
import 'package:todo_with_node/components/text_field.dart';
import 'package:todo_with_node/models/task_model.dart';
import 'package:todo_with_node/providers/auth_provider.dart';
import 'package:todo_with_node/providers/get_task_provider.dart';
import 'package:todo_with_node/services/task_api.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
 final _formKey = GlobalKey<FormState>();

 TextEditingController titleController= TextEditingController();

TextEditingController descriptionController =TextEditingController();

DateTime? completeDate ;

DateTime curentDate=DateTime.now();


@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    completeDate= DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Container(height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50,),
                     Container(
                                
                                  // padding: EdgeInsets.all(5),
                                  height: 55,
                                  
                                  child:TextFormField(
                                    controller: titleController,
                                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                                    },
                            decoration:  textDecoration( lableText: 'Enter Yout Title' , prefixIcon: Icon(Icons.mail)),
                          ),),
      
                          SizedBox(height: 44,),
                               Container(
                                
                                  // padding: EdgeInsets.all(5),
                                 
                           
                                  
                                  child:TextFormField(
                                    controller: descriptionController,
                                      validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter some text';
                                                      }
                                                      return null;
                                    },
                                                          decoration: InputDecoration(
                                                                     border: OutlineInputBorder(),
                                                            contentPadding: const EdgeInsets.symmetric(vertical: 100,horizontal: 10),
                                                      labelText: 'Enter Description'
                                                      
                                                          )
                                                          
                                                        ),),
      
         SizedBox(height: 44,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            Text(completeDate.toString()),
             ElevatedButton(
    onPressed: () {
      // time picker
       DatePicker.showTimePicker(context, showTitleActions: true,
                      onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  
                        setState(() {
                                completeDate=date;
                        });
                  }, onConfirm: (date) {
                    print('confirm $date');
                        completeDate=date;
                  }, currentTime: DateTime.now());

      // date picker
        DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2024, 6, 7), onChanged: (date) {
                                print('change $date');
                                setState(() {
                                  completeDate=date;
                                });
                                
                              }, onConfirm: (date) {
                                print('confirm $date');
                                        completeDate=date;
                              }, currentTime: DateTime.now(), locale: LocaleType.en);
                        
    },
    child: Text(
        'Pick Date',
        style: TextStyle(color: Colors.white),
    )),

         

           ],
         ),
                TextButton(
                onPressed: () {
                 
                  
                },
                child: Text(
                  'show time picker',
                  style: TextStyle(color: Colors.blue),
                )),
            SizedBox(height: 44,),
                                                        // save button
                                                          Container(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: ElevatedButton(onPressed: ()async{

                          if(completeDate!.toUtc().isAfter(curentDate.toUtc())){
                            print('its good +++++');
                                 final authProvider= Provider.of<GetTaskProvider>(context,listen: false);
                                     await  authProvider.saveTask(context: context,title: titleController.text.trim(),description: descriptionController.text.trim() , completeDate: completeDate.toString());
                     TaskModel taskModel = TaskModel(title: 'a', description: 'aa', email: 'avav', taskId: '1', );
                          }else{
                                          print('not good -=--');
                                          dialog1(press: (){}, dialogTtile: 'Date Error', dialogContent: 'Complete date must me greater then current time', context: context);
                          }
                       
                 
              
                        //  TaskApiClass.saveTask(taskModel);
                            //  TaskApiClass.saveTask();
                      //       if (_formKey.currentState!.validate()) {
                          
                        
                                  ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      //       }
                        },child: Text('LOGIN'),),
                       ),
              
            ],
          ),
        ),
      ),
      )),
    );
  }
}