import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_node/models/task_model.dart';
import 'package:todo_with_node/providers/add_task_provider.dart';
import 'package:todo_with_node/providers/auth_provider.dart';
import 'package:todo_with_node/providers/get_task_provider.dart';
import 'package:todo_with_node/views/auth/login_screen.dart';
import 'package:todo_with_node/views/auth/signup_screen.dart';
import 'package:todo_with_node/views/calender.dart';
import 'package:todo_with_node/views/homepage.dart';
import 'package:todo_with_node/views/starting_screen.dart';
import 'package:todo_with_node/views/tasklist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

         ChangeNotifierProvider(create: (_) => GetTaskProvider()),
         ChangeNotifierProvider(create: (_) => AddTaskProvider()),
                  ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    
  child: MaterialApp(
      title: 'TODO WITH NODEJS',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
   primarySwatch: Colors.blue,
        primaryColor: Color(0xfffcfcfc)
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: StartingScreen(),
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }

  final dio = Dio();
  List<TaskModel> task=[];
 getHttp() async {
  final response = await dio.get('https://viridian-jellyfish-sock.cyclic.app/task');
//  final  response = await dio.post('https://viridian-jellyfish-sock.cyclic.app/task', data: {'title': "HASSAN", 'status': true});
  // print(response.data['data']);



  for(var i  in response.data['data']){
    // TaskModel taskModel =TaskModel.fromMap(i);

      // task.add(taskModel);

  }
  print(task);
  setState(() {
    
  });

  



  
}

sendData()async{
    final  response = await dio.post('https://viridian-jellyfish-sock.cyclic.app/task', data: {'title': "AMLA", 'status': true});

    setState(() {
      
    });
}

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            sendData();
          }, icon: Icon(Icons.send))
        ],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("MOBS"),
      ),
      body: ListView.builder(
        itemCount: task.length,
        itemBuilder: ((context, index) {
        TaskModel taskModel =task[index];
        return Container(
          height: 299,
          width: 299,
          color: Colors.red,
          // child: Text(task.length.toString(),style: TextStyle(fontSize: 50,color: Colors.black),)

         child: Text(taskModel.title.toString(),style: TextStyle(fontSize: 50,color: Colors.black),)
          
        

          
          );
      })),
      
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          getHttp();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
