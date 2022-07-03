import 'package:flutter/material.dart';
import 'package:statefullectures/ui.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  changeTheme(value){
    isDark=value;
    setState((){});
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:isDark ? ThemeData.dark():ThemeData.light(),
      home:Test(changeTheme,isDark),
    );
  }
}
