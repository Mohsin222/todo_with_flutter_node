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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.3),
        onPressed: (){
        
        Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop,duration: Duration(seconds: 1), child: AddTask()));
      },child: Icon(Icons.add),),
      body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1473081556163-2a17de81fc97?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fGRhcmt8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),fit: BoxFit.cover)),
        // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: ListView(
          children: [
            Consumer<GetTaskProvider>(
       
              builder: (context, value,child) {
                return Container(
                  height: 200,
                  decoration: BoxDecoration(border: Border.all()),
            
            child: CalendarTimeline(
              initialDate:value.dateTime,
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
            
            
            
            
            
            
            
                    
                );
              }
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
       Consumer<GetTaskProvider>(builder:(context, value, child) {
         return      Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '${value.getListTasks.length} Tasks ',
                style: Theme.of(context).textTheme.headline6!.copyWith(  color: Colors.white),
              ),
            );
       },),
            SizedBox(
              height: 5,
            ),
       Container(
        // height: MediaQuery.of(context).size.height,
        height: 1000,
 
         child: LayoutBuilder(builder: (context, constraints){
        return Consumer<GetTaskProvider>(builder: (context,val,child){
   
  if(val.getListTasks.length >0){
      return GridView.builder(
        physics:NeverScrollableScrollPhysics(),
              itemCount: val.getListTasks.length,
              gridDelegate:       SliverGridDelegateWithFixedCrossAxisCount(  
                      crossAxisCount: constraints.maxWidth>600?3:constraints.maxWidth>900? 4:1,  
                      crossAxisSpacing: 10.0,  
                      mainAxisSpacing: 10.0  
                  ),   itemBuilder: (context,index){
                 return TaskSmallCard(index: index,);
  
                
                  });
  }else{
    return Center(child: Text('NO DATA',style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white),),);
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



