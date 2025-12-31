import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ButtonNavigation_P extends StatefulWidget {
  const ButtonNavigation_P({super.key});

  @override
  State<ButtonNavigation_P> createState() => _ButtonNavigation_PState();
}

class _ButtonNavigation_PState extends State<ButtonNavigation_P> {
  var currentindex = 0;
  final controller=LiquidController();
  final pages=[
    Container(color: Colors.amber,child: Center(child: Text('maha')),),
    Container(color: Colors.green,),
    Container(color: Colors.purple,),
    Container(color: Colors.white,),
    Container(color: Colors.black,),
  ];


  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonNavigation"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body:Stack(
        children: [
          LiquidSwipe(pages: pages,
            liquidController:controller,
            enableLoop: true,
            slideIconWidget: Icon(
              Icons.arrow_back_ios,color: Colors.white,

            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(onPressed: (){},
                    child: Text("Skip")),


                // AnimatedSmoothIndicator(
                //   activeIndex:controller.currentPage,
                //   count: pages.length,
                //   effect: WormEffect(),
                // ),



                TextButton(onPressed: (){},
                    child: Text("Next")),
              ],
            ),
          )
        ],
      ),



      bottomNavigationBar: BottomNavigationBar(
          items:[
            BottomNavigationBarItem(
                icon: Icon(Icons.home,color: Colors.cyan,),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined,color: Colors.cyan,),
                label: "People"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo_outlined,color: Colors.cyan,),
                label: "Camera"
            ),
          ]
      ),
    );
  }
}