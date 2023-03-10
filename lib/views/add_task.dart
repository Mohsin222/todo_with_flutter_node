import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/components/text_field.dart';
import 'package:todo_with_node/models/task_model.dart';
import 'package:todo_with_node/providers/auth_provider.dart';
import 'package:todo_with_node/providers/get_task_provider.dart';
import 'package:todo_with_node/services/task_api.dart';

class AddTask extends StatelessWidget {
 final _formKey = GlobalKey<FormState>();


 TextEditingController titleController= TextEditingController();

TextEditingController descriptionController =TextEditingController();

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
                                                        // save button
                                                          Container(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: ElevatedButton(onPressed: ()async{
                            final authProvider= Provider.of<GetTaskProvider>(context,listen: false);
                 
                      await  authProvider.saveTask(context: context,title: titleController.text.trim(),description: descriptionController.text.trim() );
                        //  TaskModel taskModel = TaskModel(title: 'a', description: 'aa', email: 'avav', taskId: '1', );
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