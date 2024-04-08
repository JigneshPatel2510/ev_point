import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_point/constant/vars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewSummary extends StatefulWidget {
  final dynamic stationDetails;
  final dynamic vehicleDetails;
  final dynamic chargerDetails;
  final dynamic bookingDetails;
  final dynamic paymentMethods;

  const ReviewSummary(
      {super.key,
      this.stationDetails,
      this.vehicleDetails,
      this.chargerDetails,
      this.bookingDetails,
      this.paymentMethods});

  @override
  State<ReviewSummary> createState() => _ReviewSummaryState();
}

class _ReviewSummaryState extends State<ReviewSummary> {
  num totalCost = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalCost = num.parse(widget.chargerDetails['cost_per_min'].toString()) *
        num.parse(widget.bookingDetails['duration'].toString());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text("Review Summary",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text("Vehicle",
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey.shade300)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/ic_car.png",
                      ),
                    ),
                    Container(
                      color: Colors.grey.shade300,
                      width: 1,
                      height: 50,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.vehicleDetails['brand'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      fontSize: 21),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.vehicleDetails['model'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  ".",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    widget.vehicleDetails['trim'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Charging Station",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset(
                          "assets/icons/ic_ev_station_icon_map.png",
                          height: 70,
                          width: 70,
                          color: Colors.green),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.stationDetails['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.stationDetails['address'],
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 11,
                                color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Charger",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.chargerDetails['name'],
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Image.network(
                                widget.chargerDetails['icon_path'],
                                height: 50,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 1,
                        color: Colors.grey.shade300,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Max.Power",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Text(
                                widget.chargerDetails['kw'].toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade200)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Booking Date",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const Spacer(),
                          Text(
                            widget.bookingDetails['date'],
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Time of Arrival",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const Spacer(),
                          Text(
                            widget.bookingDetails['time'],
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Charging Duration",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const Spacer(),
                          Text(
                            widget.bookingDetails['duration'],
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade200)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Amount Estimation",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const Spacer(),
                          Text(
                            "Rs $totalCost",
                            // "Rs ${(int.parse(widget.chargerDetails['cost_per_min']) * int.parse(widget.bookingDetails['duration'])).toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Tax",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const Spacer(),
                          const Text(
                            "Free",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Container(
                          height: 1,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Total Amount",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const Spacer(),
                          Text(
                            "Rs $totalCost",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Selected Payment Method",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ),
              Container(
                height: 80,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200,
                    border: Border.all(width: 1, color: Colors.grey.shade300)),
                child: Center(
                  child: ListTile(
                    leading: Image.network(widget.paymentMethods['image_path'],
                        height: 60, width: 60),
                    title: Text(widget.paymentMethods['name'],
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.info,
                          color: Colors.green,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Your E-wallet will not be charged as long as you haven't charged it at the EV charging station.",
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              BottomAppBar(
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    FirebaseFirestore.instance.collection("booking").add({
                      "user_id": userInfo["id"],
                      "station_id": widget.stationDetails['id'],
                      "charger_id": widget.chargerDetails['id'],
                      "vehicle_id": widget.vehicleDetails['id'],
                      "booking_date": widget.bookingDetails['date'],
                      "arrival_time": widget.bookingDetails['time'],
                      "duration": widget.bookingDetails['duration'],
                      "cost": totalCost,
                      "payment_method": widget.paymentMethods['name'],
                      "status":1,
                    }).then((value) {
                      showSuccessBooking();
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please Try again")));
                    });
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                        margin: const EdgeInsets.all(20),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                            child: Text("Confirm Booking",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 1)))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSuccessBooking() {
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
              "Booking Successful!",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text(
              "You can view booking details on the My Booking menu",
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
                // Navigator.pop(context);

                Get.back();
                Get.back();
                Get.back();
                Get.back();
                Get.back();
                Get.back();


              },
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
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
