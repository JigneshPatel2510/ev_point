import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 450,
            child: Image.asset("assets/images/ic_page3.png"),
          ),
          Text("Make payments safely &\n  quickly with EVpoint",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur\n adipiscing elit, sed do eiusmod tempor...",
                style: TextStyle(fontSize: 15)),
          ),
          // SizedBox(height: 20),
          // CarouselIndicator(
          //   height: 5,
          //   width: 10,
          //   color: Colors.green.shade100,
          //   activeColor: Colors.green,
          //   count: 3,
          //   index: 2,
          // ),
        ],
      ),
      backgroundColor: Colors.white,
      // bottomNavigationBar: BottomAppBar(
      //   height: 100,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(bottom: 10),
      //         child: Container(
      //           height: 50,
      //           width: 140,
      //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.green.shade100),
      //           child: TextButton(
      //             onPressed: () {
      //               Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage(),));
      //             },
      //             child: Text("Skip",
      //                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900,color: Colors.green)),
      //           ),
      //         ),
      //       ),
      //       SizedBox(width: 25),
      //       Padding(
      //         padding: const EdgeInsets.only(bottom: 10),
      //         child: Container(
      //           width: 140,
      //           height: 50,
      //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.green),
      //           child: TextButton(
      //               onPressed: () {
      //                 Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage(),));
      //               },
      //               child: Text(
      //                 "Next",
      //                 style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15,color: Colors.white),
      //               )),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
