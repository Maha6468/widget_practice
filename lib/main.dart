import 'package:flutter/material.dart';
import 'package:widget_practice/Button_all_practice/buttonNavigaton.dart';
import 'package:widget_practice/Normal_widget/container_All.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:MyCoursesPage()
    );
  }
}
