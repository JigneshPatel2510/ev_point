import 'package:ev_point/controller/binding_controller.dart';
import 'package:ev_point/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "Gabarito"),
      initialBinding:BindingController(),
      home: const Splash(),

      debugShowCheckedModeBanner: false,
    );
  }
}

