import 'dart:developer';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/models/task_model.dart';
import 'package:todo_with_node/providers/get_task_provider.dart';
import 'package:todo_with_node/services/task_api.dart';
import 'package:todo_with_node/views/add_task.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now();
    print(DateTime.now().add(const Duration(days: 0)));
  }

// Color inccompleteTaskColor=Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: AddTask()));
      },child: Icon(Icons.add),),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(border: Border.all()),

child: CalendarTimeline(
  initialDate: DateTime.now(),
  firstDate: DateTime(2019, 1, 15),
  lastDate:DateTime.now().add(const Duration(days: 365 * 4)),
  onDateSelected: (date) {
    final getDataProvider =Provider.of<GetTaskProvider>(context,listen: false);
    getDataProvider.updateDate(date);
  },
  leftMargin: 20,
  monthColor: Colors.blueGrey,
  dayColor: Colors.teal[200],
  activeDayColor: Colors.white,
  activeBackgroundDayColor: Colors.redAccent[100],
  dotsColor: Color(0xFF333A47),
  // selectableDayPredicate: (date) => date.day != 23,
  locale: 'en_ISO',
),







                // child: CalendarTimeline(
                //   showYears: false,
                //   shrink: false,
                //   initialDate: DateTime.now(),
                //   firstDate: DateTime.now(),
                //   lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
                //   onDateSelected: (date) =>
                //       setState(() => _selectedDate = date),
                //   leftMargin: 20,
                //   monthColor: Color.fromARGB(179, 129, 20, 20),
                //   dayColor: Colors.teal[200],
                //   dayNameColor: const Color(0xFF333A47),
                //   activeDayColor: Colors.white,
                //   activeBackgroundDayColor: Colors.redAccent[100],
                //   dotsColor: const Color(0xFF333A47),
                //   selectableDayPredicate: (date) => date.day != 23,
                //   locale: 'en',
                // ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'HEADING',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '2 Tasks today',
                  style: Theme.of(context).textTheme.headline6!.copyWith(),
                ),
              ),
              SizedBox(
                height: 5,
              ),
       AspectRatio(
    //     constraints: BoxConstraints(
    //       minHeight: 200,
    //       minWidth: 300,

    //       // 
    //     ),
        
    //  height: MediaQuery.of(context).size.height/2,
    // return GridView.builder(
    //             itemCount: 4,
    //             gridDelegate:       SliverGridDelegateWithFixedCrossAxisCount(  
    //                     crossAxisCount: constraints.maxWidth>600?3:constraints.maxWidth>900? 4:1,  
    //                     crossAxisSpacing: 10.0,  
    //                     mainAxisSpacing: 10.0  
    //                 ),   itemBuilder: (context,index){
    //                return TaskSmallCard();
    //                 });
             aspectRatio: 2/3,
         child: LayoutBuilder(builder: (context, constraints){
          return Consumer<GetTaskProvider>(builder: (context,val,child){
       //  height: MediaQuery.of(context).size.height/2,
  if(val.getListTasks.length >0){
      return GridView.builder(
                itemCount: val.getListTasks.length,
                gridDelegate:       SliverGridDelegateWithFixedCrossAxisCount(  
                        crossAxisCount: constraints.maxWidth>600?3:constraints.maxWidth>900? 4:1,  
                        crossAxisSpacing: 10.0,  
                        mainAxisSpacing: 10.0  
                    ),   itemBuilder: (context,index){
                   return TaskSmallCard(index: index,);
                    });
  }else{
    return Center(child: Text('NO DATA',style: Theme.of(context).textTheme.displayMedium,),);
  }
          });
         
         }),
       )
            ],
          ),
        ),
      )),
    );
  }
}



class TaskSmallCard extends StatelessWidget {
  final int index;
  const TaskSmallCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return        Consumer<GetTaskProvider>(builder: (context, val, child) {

      TaskModel taskModel =val.getListTasks[index];
  
  // var format = DateFormat.yMd(taskModel.dateTime);
   DateTime dt1 = DateTime.parse("2021-12-23 11:47:00");
                return 
                  
                  Card(
                    shape: RoundedRectangleBorder(
    side: BorderSide(
     
    ),
     borderRadius: BorderRadius.circular(20.0), 
  ),
                      color: taskModel.status ==true?
                  
                       Color(0xffe91e63):val.taskCompleteColor,
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
                                  log(DateTime.now().toString());
                                  var d = DateTime.parse(taskModel.dateTime.toString());
//                               print(d);
//                               log(DateTime.parse(taskModel.dateTime.toString()).toString());
//                               // print(d is String);
                                    DateTime dateTime =DateTime.now();
//                     var data =          DateTime.parse(taskModel.dateTime.toString()).isAtSameMomentAs(dateTime);
//                     // log(data.toString());
if(d.day == dateTime.day){

  print('TRUE   ');
}else{
      print('FALUE');
}
                
                                }, icon: Icon(Icons.add)),

                                IconButton(onPressed: (){
              showDialog(context: context, builder:(context) {
                return Dialog(
                    shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 200,
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text('Delete Task',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w700),),
                        Expanded(child: Align(
                          alignment: Alignment.center,
                          child: Text('Are you sure to delete this',style: TextStyle(fontSize: 20),))),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Container(
              
                            child: ElevatedButton(onPressed: (){
                              log(taskModel.taskId.toString());
                             
                              val.deleteTask(taskModel.taskId.toString());
                               Navigator.pop(context);
                              // TaskApiClass.deleteTask(taskModel.taskId.toString());
                            }, child: Text('YEs'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10),
                              backgroundColor: Colors.red[400]
                            ),
                            )),TextButton(onPressed: (){}, child: Text('No',style: TextStyle(fontSize: 18)))],
                        ),
                      ],
                    ),
                  ),
                );
              },);
                                }, icon: Icon(Icons.delete_outline_sharp,color: Colors.red[100],size:40 ,))
                              ],
                            ),
                            Container(
                              child: Text(taskModel.email.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 168, 119, 119))),
                            ),
                                  Container(
                              child: Text(
                                
                          // taskModel.dateTime.toString(),
                          DateFormat('yyyy-MM-dd').format(DateTime.parse(taskModel.dateTime.toString()) as DateTime),
                             
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 168, 119, 119))),
                            ),
                            Container(
                              child: Text(
                                taskModel.title.toString(),
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            Container(
                        
                              child: Flexible(
                                flex: 4,
                                child: Text(
                                  "text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popular",
                                  style: TextStyle(fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text('Complete Date',
                                  style: TextStyle(fontSize: 17)),
                            ),
                            Spacer(),
                            //complete status row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(val.switchValue == true
                                      ? 'Complete'
                                      : 'Incomplete'),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: CupertinoSwitch(
                                    // This bool value toggles the switch.

                                    value: val.switchValue,

                                    activeColor: Color.fromARGB(255, 104, 0, 35),

                                    onChanged: (bool? value) {
                                      // This is called when the user toggles the switch.
val.changeCardStatus(value);
                                
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                );
              });
  }
}