import 'dart:async';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  bool showMap = false;
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  List<String> filterStationList = [];
  TextEditingController searchText = TextEditingController();

  void askPermission(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        // title: const Text("Alert Dialog Box"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/ic_location_permission_dialog.png",
            ),
            const Text(
              "Enable Location",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Material(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    onTap: () async {
                      Navigator.pop(context as BuildContext);
                      if (await Permission.location.request().isGranted) {
                        showMap = true;
                      } else {
                        debugPrint("Disable");
                      }
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text("Enable Location",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Material(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(24),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context as BuildContext);
                    },
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text("Cancel",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void showStationDetails(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            elevation: 0.0,
            // title: Center(child: Text("Evaluation our APP")),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "99 Prospect Park W",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      fontSize: 25),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("brooklyn 99 Prospect Park W",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          // SizedBox(width:5,),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(30)),
                            child: Transform.rotate(
                                angle: 45 * math.pi / 180,
                                child: const Center(
                                    child: Icon(
                                  Icons.navigation,
                                  color: Colors.white,
                                  size: 30,
                                  weight: 40,
                                ))),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text('4.3'),
                          const SizedBox(
                            width: 10,
                          ),
                          RatingBar.builder(
                            itemSize: 15,
                            initialRating: 4.3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text("(107 reviews)"),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                  child: Text("In Use",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)))),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.location_pin),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "1.9 km",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(Icons.car_repair),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "7 mins",
                            style: TextStyle(color: Colors.grey.shade700),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Image.asset("assets/icons/ic_plug1.png",
                                    height: 30, width: 30),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset("assets/icons/ic_plug2.png",
                                    height: 30, width: 30),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset("assets/icons/ic_plug3.png",
                                    height: 30, width: 30),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "3 Charger",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.green,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.green)),
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text("View",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.green)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                width: 140,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.green),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Book",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ));
      },
    );
  }



  RxList<dynamic> stationlist = [].obs;

  getTab() async {
    QuerySnapshot<Map<String, dynamic>> tab =
        await FirebaseFirestore.instance.collection('stations').get();
    for (int i = 0; i < tab.docs.length; i++) {
      var data=tab.docs[i].data();
      data['id']=tab.docs[i].id;
      stationlist.add(data);
    }
  }
}
