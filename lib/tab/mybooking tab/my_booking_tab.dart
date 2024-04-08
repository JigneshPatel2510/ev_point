import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_point/tab/mybooking%20tab/cancel_booking.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_switch/flutter_switch.dart';

class MyBookingTab extends StatefulWidget {
  const MyBookingTab({super.key});

  @override
  State<MyBookingTab> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBookingTab> {
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookingDetails(status: 1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              "assets/images/ic_splash_image.png",
            ),
          ),
          leadingWidth: 35,
          title: const Text("My Booking",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/icons/ic_search.png",
                color: Colors.black,
                height: 30,
                width: 30,
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.green,
                    onTap: (value) {
                      if (value == 0) {
                        getBookingDetails(status: 1);
                      } else if (value == 1) {
                        getBookingDetails(status: 2);
                      } else {
                        getBookingDetails(status: 3);
                      }
                    },
                    tabs: const [
                      Tab(
                        // icon: Icon(Icons.chat_bubble),
                        text: "Upcoming",
                      ),
                      Tab(
                        // icon: Icon(Icons.video_call),
                        text: "Completed",
                      ),
                      Tab(
                        // icon: Icon(Icons.settings),
                        text: "Canceled",
                      )
                    ],
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 1,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: bookingList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(13),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade200),
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(bookingList[index]
                                                  ['booking_date'] ??
                                              '-'),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(bookingList[index]
                                                  ['arrival_time'] ??
                                              '-'),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text("Remember Me"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    FlutterSwitch(
                                      width: 43,
                                      height: 23.0,
                                      activeColor: Colors.green,
                                      padding: 1.7,
                                      toggleSize: 20,
                                      value: true,
                                      borderRadius: 30,
                                      onToggle: (val) {
                                        status = val;
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            bookingList[index]
                                                        ['station_details']
                                                    ['name'] ??
                                                "-",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                              bookingList[index]
                                                          ['station_details']
                                                      ['address'] ??
                                                  "-",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey.shade500,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  offset: const Offset(2, 3),
                                                  color: Colors.green.shade50,
                                                  spreadRadius: 10)
                                            ],
                                            color: const Color(0xff0DC26F),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Transform.rotate(
                                            angle: 45 * math.pi / 180,
                                            child: const Center(
                                                child: Icon(
                                              Icons.navigation_rounded,
                                              color: Colors.white,
                                              size: 30,
                                              weight: 40,
                                            ))),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            bookingList[index]
                                                        ['charger_details']
                                                    ['name'] ??
                                                "-",
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Image.network(
                                            bookingList[index]
                                                        ['charger_details']
                                                    ['icon_path'] ??
                                                "-",
                                            height: 30,
                                            width: 30,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Max. Power",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${bookingList[index]['charger_details']['kw'] ?? '-'} kW",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Duration",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            bookingList[index]['duration'] +
                                                ' mins'.toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Amount",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Rs.${bookingList[index]['cost'] ?? "-"}",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: InkWell(
                                            onTap: () {
                                              // FirebaseFirestore.instance
                                              //     .collection("booking")
                                              //     .doc(bookingList[index]['id'])
                                              //     .update({"status": 3}).then(
                                              //         (value) {
                                              //   getBookingDetails();
                                              // });
                                              openCancelBookingSheet(id:bookingList[index]['id']);
                                            },
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: Container(
                                              height: 40,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  border: Border.all(
                                                      color: Colors.green)),
                                              child: const Center(
                                                child: Text("Cancel Booking",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Colors.green)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: InkWell(
                                            onTap: () {
                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewSummary(),));
                                            },
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: Container(
                                              width: 140,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color:
                                                      const Color(0xff01B763)),
                                              child: const Center(
                                                child: Text(
                                                  "View",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffE7F7F1),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 3),
                                        child: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Center(
                                              child: Text("i",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10))),
                                        ),
                                      ),
                                      const Flexible(
                                        child: Text(
                                          "Insert the charger connection into your car to  start charging. If you do not charge after 15 minutes from the time, the booking will be automatically cancelled.",
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Dec 17,2024"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("10:00 AM"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                          height: 23,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: const Center(
                                              child: Text(
                                            "Completed",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ))),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "99 Prospect Park W",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text("brooklyn 99 Prospect Park W",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade400,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff0DC26F),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Transform.rotate(
                                          angle: 45 * math.pi / 180,
                                          child: const Center(
                                              child: Icon(
                                            Icons.navigation_rounded,
                                            color: Colors.white,
                                            size: 30,
                                            weight: 40,
                                          ))),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          "Tesla (Plug)",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Image.asset(
                                          "assets/icons/ic_plug1.png",
                                          height: 25,
                                          width: 25,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Column(
                                      children: [
                                        Text(
                                          "Max. Power",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "100 kW",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Duration",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "1 hour",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Amount",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "\$14.25",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: InkWell(
                                            onTap: () {},
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: Container(
                                              height: 40,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  border: Border.all(
                                                      color: Colors.green)),
                                              child: const Center(
                                                child: Text("View",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Colors.green)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            onTap: () {},
                                            child: Container(
                                              width: 140,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color:
                                                      const Color(0xff01B763)),
                                              child: const Center(
                                                child: Text(
                                                  "Book Again",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Container(
                                //   color: const Color(0xffE7F7F1),
                                //   padding: const EdgeInsets.all(10),
                                //
                                //   child: const Row(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Icon(Icons.info, color: Colors.green),
                                //       Flexible(
                                //         child: Text(
                                //             " Insert the charger connection into your car  to  start charging. If you do not charge after 15 minutes from the time, the booking will be automatically cancelled.",
                                //             style: TextStyle(color: Colors.green),
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: cancelbookingList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(cancelbookingList[index]
                                                  ['booking_date'] ??
                                              '-'),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(cancelbookingList[index]
                                                  ['arrival_time'] ??
                                              '-'),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                          height: 23,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: const Center(
                                              child: Text(
                                            "Cancelled",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ))),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cancelbookingList[index]
                                                        ['station_details']
                                                    ['name'] ??
                                                '-',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              cancelbookingList[index]
                                                          ['station_details']
                                                      ['address'] ??
                                                  '-',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade400,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff0DC26F),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Transform.rotate(
                                          angle: 45 * math.pi / 180,
                                          child: const Center(
                                              child: Icon(
                                            Icons.navigation_rounded,
                                            color: Colors.white,
                                            size: 30,
                                            weight: 40,
                                          ))),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            cancelbookingList[index]
                                                        ['charger_details']
                                                    ['name'] ??
                                                '-',
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Image.network(
                                            cancelbookingList[index]
                                                        ['charger_details']
                                                    ['icon_path'] ??
                                                '-',
                                            height: 30,
                                            width: 30,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "Max. Power",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${cancelbookingList[index]['charger_details']['kw']} kW',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Duration",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            cancelbookingList[index]
                                                    ['duration'] +
                                                ' mins'.toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Amount",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Rs.${cancelbookingList[index]['cost']}",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            onTap: () {},
                                            child: Container(
                                              height: 40,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  border: Border.all(
                                                      width: 1.5,
                                                      color: Colors.green)),
                                              child: const Center(
                                                child: Text("View",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Colors.green)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<dynamic> bookingList = [];
  List<dynamic> cancelbookingList = [];
  List<dynamic> completebookingList = [];

  getBookingDetails({status}) async {
    bookingList.clear();
    cancelbookingList.clear();
    completebookingList.clear();
    QuerySnapshot<Map<String, dynamic>> bookingdetail = await FirebaseFirestore
        .instance
        .collection("booking")
        .where("status", isEqualTo: status)
        .get();
    for (int i = 0; i < bookingdetail.docs.length; i++) {
      var data = bookingdetail.docs[i].data();
      data['id'] = bookingdetail.docs[i].id;

      DocumentSnapshot stationDetails = await FirebaseFirestore.instance
          .collection("stations")
          .doc(data['station_id'])
          .get();
      data['station_details'] = stationDetails.data();

      DocumentSnapshot vehicledetail = await FirebaseFirestore.instance
          .collection("vehicle")
          .doc(data['vehicle_id'])
          .get();
      data['vehicle_details'] = vehicledetail.data();

      DocumentSnapshot chargerdetail = await FirebaseFirestore.instance
          .collection("charger")
          .doc(data['charger_id'])
          .get();
      data['charger_details'] = chargerdetail.data();

      if (status == 1) {
        bookingList.add(data);
      } else if (status == 2) {
        completebookingList.add(data);
      } else {
        cancelbookingList.add(data);
      }
    }
    setState(() {});
  }

  void openCancelBookingSheet({id}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 2,
                  width: 30,
                  color: Colors.grey.shade300,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    "Cancel Booking",
                    style: TextStyle(
                        color: Color(0xffF85656),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .5),
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey.shade100,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Text(
                    "Are you sure you want to cancel the booking?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: .5),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.green.shade100,
                          ),
                          child: const Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 15),
                            child: Text("No, Don't Cancel",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600)),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CancelBooking(id:id),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.green),
                          child: const Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 15),
                            child: Text("Yes, Cancel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
