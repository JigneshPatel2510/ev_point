import 'package:ev_point/controller/home_controller.dart';
import 'package:get/get.dart';

class BindingController  implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() =>HomeController(),fenix: false ,);
  }

}