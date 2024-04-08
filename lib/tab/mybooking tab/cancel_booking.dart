import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelBooking extends StatefulWidget {
  final String id;
  const CancelBooking({super.key, required this.id});

  @override
  State<CancelBooking> createState() => _CancelBookingState();
}

class _CancelBookingState extends State<CancelBooking> {
  int groupValue = -1;
  List<String> reasonOfCancellation = [
    "I encountered an unexpected circumstance",
    "I had a schedule change",
    "I found an alternative charging option",
    "Inconvenient location",
    "I'm having a technical problem",
    "High charge cost",
    "Weather conditions",
    "Lack of amenities",
    "unavailability of changing spot",
    "Parking availability",
    "others"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text("Cancel Booking",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Choose the reason for your cancellation:",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: reasonOfCancellation.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text(reasonOfCancellation[index]),
                  value: index,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = index;
                      setState(() {});
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: InkWell(
          onTap: () {
            FirebaseFirestore.instance
                .collection("booking")
                .doc(widget.id)
                .update({"status": 3}).then(
                    (value) {
                      showSuccessCancellation();
            });

          },
          borderRadius: BorderRadius.circular(25),
          child: Material(
            borderRadius: BorderRadius.circular(25),
            child: Container(
                margin: const EdgeInsets.all(20),
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff01B763),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                    child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontWeight: FontWeight.w600),
                ))),
          ),
        ),
      ),
    );
  }
  void showSuccessCancellation() {
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
              "assets/images/ic_booking successful.png",
            ),
            const Text(
              "Successful Cancellation!",
              style: TextStyle(
                  fontSize: 21,
                  color: Colors.green,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text(
                  "Your booking has been successfully cancelled.",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
        actions: <Widget>[
          Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {


                Get.back();
                Get.back();
                Get.back();
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff01B763),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    child: Text("okay", style: TextStyle(color: Colors.white)),
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
