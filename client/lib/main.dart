import 'package:client/screens/work_add_edit.dart';
import 'package:flutter/material.dart';

import 'screens/work_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' :(context) => const WorkList(),
        '/add-work' :(context) => const WorkAddEdit(),
        '/edit-work' :(context) => const WorkAddEdit()
      },
    );
  }
}


