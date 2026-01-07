import 'package:flutter/material.dart';

class Drawer_Practice extends StatefulWidget {
  const Drawer_Practice({super.key});

  @override
  State<Drawer_Practice> createState() => _Drawer_PracticeState();
}

class _Drawer_PracticeState extends State<Drawer_Practice> {
  final GlobalKey<ScaffoldState> _globalKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("Drawer"),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(onPressed: (){
          _globalKey.currentState!.openDrawer();
        }, icon: Icon(Icons.access_alarm)),
      ),
      //endDrawer: Drawer(),

      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/0/0d/Facebook_logo_%28June_30%2C_2015%29.png',
              ),

              Card(
                child: ListTile(
                  title: Text("This is listtile ",),
                  tileColor: Colors.green,
                  textColor: Colors.white,
                  subtitle: Text("This is subtitle made by Maha "),
                  leading: Icon(Icons.accessibility_rounded),
                  trailing: Icon(Icons.access_alarm),
              ),),
          Card(
            child: ListTile(
              title: Text("This is listtile ",),
              tileColor: Colors.green,
              textColor: Colors.white,
              subtitle: Text("This is subtitle made by Maha "),
              leading: Icon(Icons.accessibility_rounded),
              trailing: Icon(Icons.access_alarm),
            ),),
            ],
          ),
        ),
      ),


    );
  }
}
