import 'package:flutter/material.dart';

class ListView_All extends StatefulWidget {
  const ListView_All({super.key});

  @override
  State<ListView_All> createState() => _ListView_AllState();
}

class _ListView_AllState extends State<ListView_All>with SingleTickerProviderStateMixin {
late TabController _tabController;

  @override
  void initState(){
    _tabController=TabController(length: 3, vsync: this);
    super .initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.cyanAccent,
         // toolbarHeight: 100.1,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30)
            )
          ),
          leading: Icon(Icons.menu),
          actions: [
            Icon(Icons.add_a_photo_outlined),
            SizedBox(width: 10,),
            Icon(Icons.favorite),
            SizedBox(width: 10,),
            Icon(Icons.add_alert_sharp),
            SizedBox(width: 10,)
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.account_balance),),
              Tab(icon:Icon(Icons.account_circle_outlined)),
              Tab(icon:Icon(Icons.add_alert_outlined)),
            ],
          )
        ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text("Account Balance Page")),
          Center(child: Text("Account Circle Page")),
          Center(child: Text("Alert Page")),
        ],
      ),
    );
  }
}
