import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_point/constant/vars.dart';
import 'package:ev_point/station_list_display.dart';
import 'package:flutter/material.dart';

class SelectedVehicle extends StatelessWidget {
  final String? vehicle;
  final String? model;
  final String? trim;
  final bool? isFromMyVehicle;

  const SelectedVehicle(
      {super.key, this.vehicle, this.model, this.trim, this.isFromMyVehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Image.asset("assets/images/ic_add_vehicle.png"),
            InkWell(
              onTap: () {},
              child: Container(
                height: 170,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade100),
                child: Column(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                      vehicle ?? "-",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ))),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 1,
                        color: Colors.grey.shade300),
                    Expanded(
                        child: Center(
                            child: Text(
                      model ?? "-",
                      style: const TextStyle(color: Colors.black),
                    ))),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 1,
                        color: Colors.grey.shade300),
                    Expanded(
                        child: Center(
                            child: Text(
                      trim ?? "-",
                      style: const TextStyle(color: Colors.black),
                    ))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        child: Material(
          color: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: InkWell(
            onTap: () {
              if (isFromMyVehicle == null) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (ctx) => AlertDialog(
                    // title: const Text("Alert Dialog Box"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26)),

                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/ic_showdialog.png",
                        ),
                        const Text(
                          "Sign up Successful!",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.green,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      Center(
                        child: TextButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("vehicle")
                                .add({
                              'brand': vehicle ?? "-",
                              'model': model ?? "-",
                              'trim': trim ?? "-",
                              'userId': userInfo['id'] ?? "-",
                            }).then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const StationList(),
                                  ));
                            });
                          },
                          child: const Text("okay"),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                FirebaseFirestore.instance.collection("vehicle").add({
                  'brand': vehicle ?? "-",
                  'model': model ?? "-",
                  'trim': trim ?? "-",
                  'userId': userInfo['id'] ?? "-",
                }).then((value) {

                });
              }
            },
            borderRadius: BorderRadius.circular(25),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              height: 50,
              width: 320,
              child: const Center(
                child: Text("Add this vehicle",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
