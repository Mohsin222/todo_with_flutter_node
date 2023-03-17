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
import 'package:todo_with_node/widgets/task_small_card.dart';

import '../components/dialog1.dart';

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
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1473081556163-2a17de81fc97?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fGRhcmt8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),fit: BoxFit.cover)),
        // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: ListView(
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
  activeBackgroundDayColor: Colors.white.withOpacity(0.6),
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
                    .copyWith(  color: Colors.white),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '2 Tasks today',
                style: Theme.of(context).textTheme.headline6!.copyWith(  color: Colors.white),
              ),
            ),
            SizedBox(
              height: 5,
            ),
       Container(
        height: MediaQuery.of(context).size.height,
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
          //  aspectRatio: 2/3,
              // aspectRatio: 4/3,
         child: LayoutBuilder(builder: (context, constraints){
        return Consumer<GetTaskProvider>(builder: (context,val,child){
       //  height: MediaQuery.of(context).size.height/2,
  if(val.getListTasks.length >0){
      return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
              itemCount: val.getListTasks.length,
              gridDelegate:       SliverGridDelegateWithFixedCrossAxisCount(  
                      crossAxisCount: constraints.maxWidth>600?3:constraints.maxWidth>900? 4:1,  
                      crossAxisSpacing: 10.0,  
                      mainAxisSpacing: 10.0  
                  ),   itemBuilder: (context,index){
                 return TaskSmallCard(index: index,);
                return Container(
                  height: 60,
                  width: 47,
                  color: Color.fromARGB(255, 68, 133, 68),
                  child: Column(
                    children: [
                      Text('TITLE'),
                      Container(child: Text('dESVRTO AMRA AOR ALDN ALF A LAD')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          Column(
                            children: [
                        Text(DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()),
                               Text('Start'),
                            ],
                          ),
                            Column(
                            children: [
                        Icon(Icons.delete,size: 35,color: Colors.red,),
                               Text('Delete'),
                            ],
                          ),
                                 Column(
                            children: [
                              Text(DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()),
                               Text('End'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
                  });
  }else{
    return Center(child: Text('NO DATA',style: Theme.of(context).textTheme.displayMedium,),);
  }
        });
         
         }),
       )
          ],
        ),
      )),
    );
  }
}



