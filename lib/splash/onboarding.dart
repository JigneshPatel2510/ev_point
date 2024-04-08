import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:ev_point/splash/page1.dart';
import 'package:ev_point/splash/page2.dart';
import 'package:ev_point/splash/page3.dart';
import 'package:flutter/material.dart';

import '../login & otp/loginpage.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          CarouselIndicator(
            height: 5,
            width: 10,
            color: Colors.green.shade100,
            activeColor: Colors.green,
            count: 3,
            index: currentIndex,
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Material(
                borderRadius: BorderRadius.circular(25),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogInPage(),
                        ));
                  },
                  child: Container(
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.green.shade100),
                    child: const Center(
                      child: Text("Skip",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.green)),
                    ),
                    ),
                ),
              ),
              ),
            
            const SizedBox(width: 25),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Material(
                borderRadius: BorderRadius.circular(25),
                child: InkWell(
                   borderRadius: BorderRadius.circular(25),
                  onTap: (){
                    if (currentIndex == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogInPage(),
                          ));
                    } else {
                      currentIndex = currentIndex + 1;
                      pageController.animateToPage(currentIndex,
                          duration: const Duration(microseconds: 500),
                          curve: Curves.bounceIn);
                      setState(() {});
                    }
                  },
                  child: Container(
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.green),
                    child: const Center(
                      child: Text(
                            "Next",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                    )),
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
