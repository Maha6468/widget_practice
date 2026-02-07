import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice/Normal_widget/container_All.dart';

import 'Normal_widget/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create:(_)=>PageProvider(),
      child: MyApp(),),);
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
      home:ButtonNavigation_P()
    );
  }
}
