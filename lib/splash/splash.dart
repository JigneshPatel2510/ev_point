import 'package:ev_point/constant/vars.dart';
import 'package:ev_point/splash/onboarding.dart';
import 'package:ev_point/station_list_display.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Splash extends StatefulWidget {
   const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/images/ic_splash_image.png",width: 120,height: 170),
          ),
           const Text("EVPoint",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30),)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      bool isLogin=GetStorage().read('isLogin')??false;
      if(isLogin){
        userInfo=GetStorage().read("userInfo")??{};
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const StationList(),));

      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const OnBoarding(),));
      }

    });
  }
}
