import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_point/tab/account%20tab/my_vehicle.dart';
import 'package:ev_point/tab/home_tab/check-ins/charging_now.dart';
import 'package:ev_point/tab/home_tab/check-ins/route_planner.dart';
import 'package:ev_point/tab/home_tab/scan.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scan/scan.dart';
import 'package:share_plus/share_plus.dart';
import '../../constant/vars.dart';
import '../account tab/select_charger.dart';

class StationInfo extends StatefulWidget {
  final dynamic stationDetails;
  const StationInfo({super.key, this.stationDetails});

  @override
  State<StationInfo> createState() => _StationInfoState();
}

class _StationInfoState extends State<StationInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStationCharger();
  }

  List<double> ratingValue = [0.2, 0.1, 0.1, 0.6, 0.8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white30,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                  ),
                ),
                actions: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white30,
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_border_rounded),
                        color: Colors.black),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white30,
                    ),
                    child: Transform.rotate(
                      angle: -45 * math.pi / 180,
                      child: IconButton(
                          onPressed: () {
                            Share.share(
                                'https://www.instagram.com/jigneshpatel2510_/');
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.black,
                            size: 20,
                            weight: 40,
                          )),
                    ),
                  )
                ],
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    // title: Text("Collapsing Toolbar",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 16.0,
                    //     )),
                    background: Image.asset(
                      'assets/images/ic_EVChargingStation.png',
                      fit: BoxFit.cover,
                    )),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                     Text(
                      widget.stationDetails['name'],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.stationDetails['address'],
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '4.5',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RatingBar.builder(
                          itemCount: 5,
                          minRating: 1,
                          initialRating: 4.3,
                          itemSize: 15,
                          allowHalfRating: true,
                          glow: true,
                          glowColor: Colors.amber,
                          glowRadius: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1),
                          direction: Axis.horizontal,
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '(128 reviews)',
                          style: TextStyle(color: Colors.grey.shade500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6)),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text('Available',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.location_pin,
                          color: Colors.blueGrey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '1.6 km',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.car_repair,
                          color: Colors.blueGrey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '5 mins',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
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
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 29, vertical: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Transform.rotate(
                                      angle: -45,
                                      child: const Icon(
                                        Icons.send,
                                        size: 15,
                                        color: Colors.white,
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Get Direction",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RoutePlanner(),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: Colors.green, width: 2)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 33, vertical: 10),
                                child: Center(
                                    child: Text('Route Planner',
                                        style: TextStyle(color: Colors.green))),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    const TabBar(
                      labelColor: Colors.green,
                      indicatorColor: Colors.green,
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: 'Info',
                        ),
                        Tab(
                          text: 'Chargers',
                        ),
                        Tab(
                          text: 'Check-ins',
                        ),
                        Tab(
                          text: 'Reviews',
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    )
                  ]),
                ),
              ),
            ];
          },
          body: SizedBox(
            height: Get.height * 0.30,
            child: TabBarView(children: [
              Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 15),
                        const Text(
                          'About',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 22),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Surat Municipal Corporation has established 50 Public EV Charging Stations to promote Green Energy and to become Electric Vehicle City. Citizen can use SMC EV Charging Stations by paying one of the lowest rate. SMC has also launched EV Policy in this regard.',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Parking',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 17),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Pay',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.grey.shade300,
                                ),
                                const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Cost',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 17),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Payment is required',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      ),
                                    )
                                  ],
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
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.access_time,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Open',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '24 hours',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_up,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.grey.shade300,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Monday',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      Spacer(),
                                      Text(
                                        '00:00-00:00',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Tuesday',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      Spacer(),
                                      Text(
                                        '00:00-00:00',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Wednesday',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      Spacer(),
                                      Text(
                                        '00:00-00:00',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Thursday',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      Spacer(),
                                      Text(
                                        '00:00-00:00',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Friday',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      Spacer(),
                                      Text(
                                        '00:00-00:00',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Saturday',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      Spacer(),
                                      Text(
                                        '00:00-00:00',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Monday',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      Spacer(),
                                      Text(
                                        '00:00-00:00',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Amenities',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black,
                                            fontSize: 20),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.grey.shade300,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.family_restroom,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Restrooms',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.chair,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Lounge area',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.restaurant,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Restaurant',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.wifi,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Wi-Fi',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.live_tv,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Entertainment',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.tire_repair,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Air for Tiers',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.store_outlined,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Shops',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.construction,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Maintenance',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
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
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Location',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: Colors.green,
                            ),
                            Text(
                              'Jahangirpura Community Hall Parking Area',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: BottomAppBar(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(25),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ScanPage(),
                                    ));
                                ScanView(
                                  controller: ScanController(),
                                  scanLineColor: Colors.green.shade400,
                                  onCapture: (data) {},
                                  scanAreaScale: 0.7,
                                );
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green.shade50,
                                      shape: BoxShape.circle),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.qr_code_scanner,
                                        color: Colors.green),
                                  )),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(25),
                                onTap: () async {
                                  var result=await Navigator.push(context, MaterialPageRoute(builder: (context) => const MyVehicle(),));
                                  if(result!=null){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCharger(stationDetails: widget.stationDetails,vehicleDetails: result),));
                                  }
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 70, vertical: 15),
                                      child: Center(
                                          child: Text(
                                        'Book',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                () => ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: chargerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade200)),
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey.shade200)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 5),
                                    child: Text(
                                      '24 hours',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(chargerList[index]['status'] ?? '-',
                                      style: TextStyle(
                                          color: chargerList[index]['status'] ==
                                                  'Available'
                                              ? Colors.green
                                              : Colors.red,
                                          fontSize: 16)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: chargerList[index]['status'] ==
                                                  'Available'
                                              ? Colors.green
                                              : Colors.red,
                                          // borderRadius: BorderRadius.circular(30),
                                          shape: BoxShape.circle),
                                      height: 8,
                                      width: 8,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey.shade300,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          chargerList[index]['name'] ?? '-',
                                          style: TextStyle(
                                              color: Colors.grey.shade500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Image.network(
                                          chargerList[index]['icon_path'] ?? '',
                                          height: 50,
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 70,
                                    width: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Max.Power',
                                            style: TextStyle(
                                                color: Colors.grey.shade500),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            chargerList[index]['kw'].toString(),
                                            style: const TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey.shade300,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff01B763),
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 130, vertical: 15),
                                  child: Text('Book',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                ),
              ),
              Scaffold(
                body: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/ic_add_check-ins.png',
                                color: const Color(0xff12D18E),
                                height: 50,
                                width: 50,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(35),
                                  child: Image.network(
                                    userInfo['profile'] ?? "-",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Jignesh Patel',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Tesla Model 3',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade500),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getDateInFormat(DateTime.now().toString()),
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    getTimeInFormat(DateTime.now().toString()),
                                    style:
                                        TextStyle(color: Colors.grey.shade500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "This charging station is fast and efficient,got my EV charged in no time!",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            height: 30,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                bottomNavigationBar: BottomAppBar(
                  elevation: 0,
                  height: 80,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 2,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    'Check-in',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ChargingNow(
                                                        chargingPage:
                                                            "Charging Now"),
                                              ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: Colors.grey.shade200)),
                                          child: const Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Icon(
                                                    Icons.battery_charging_full,
                                                    color: Colors.green,
                                                    size: 30),
                                              ),
                                              Text('Charging Now',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 15)),
                                              Spacer(),
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.grey,
                                                    size: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ChargingNow(
                                                        chargingPage:
                                                            "Waiting"),
                                              ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: Colors.grey.shade200)),
                                          child: const Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Icon(
                                                    Icons.access_time_filled,
                                                    color: Colors.blueGrey,
                                                    size: 30),
                                              ),
                                              Text('Waiting',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 15)),
                                              Spacer(),
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.grey,
                                                    size: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ChargingNow(
                                                        chargingPage:
                                                            "Successfully Charged"),
                                              ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: Colors.grey.shade200)),
                                          child: Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'assets/images/ic_add_check-ins.png',
                                                    height: 30,
                                                    color:
                                                        const Color(0xff01B763),
                                                  )),
                                              const Text('Successfully Charged',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 15)),
                                              const Spacer(),
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.grey,
                                                    size: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ChargingNow(
                                                        chargingPage:
                                                            "Could Not Charge"),
                                              ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: Colors.grey.shade200)),
                                          child: Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'assets/images/ic_minus_check-in.png',
                                                    height: 30,
                                                    color:
                                                        const Color(0xffF75656),
                                                  )),
                                              const Text('Could Not charge',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 15)),
                                              const Spacer(),
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.grey,
                                                    size: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ChargingNow(
                                                        chargingPage:
                                                            "Leave a Comment"),
                                              ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: Colors.grey.shade200)),
                                          child: Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'assets/images/ic_comment_check-in.png',
                                                    color:
                                                        const Color(0xff1A96F0),
                                                    height: 30,
                                                  )),
                                              const Text('Leave a Comment',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 15)),
                                              const Spacer(),
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.grey,
                                                    size: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xff01B763),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                              child: Text('Check-in',
                                  style: TextStyle(color: Colors.white)))),
                    ),
                  ),
                ),
              ),
              Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    '4.5',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 50),
                                  ),
                                  RatingBar.builder(
                                    itemCount: 5,
                                    itemSize: 25,
                                    minRating: 1,
                                    initialRating: 4.5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1),
                                    glow: true,
                                    glowRadius: 6,
                                    glowColor: Colors.amber,
                                    allowHalfRating: true,
                                    itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: Colors.amber),
                                    onRatingUpdate: (value) {},
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    '(128 views)',
                                  )
                                ],
                              ),
                            ),
                            Container(
                                color: Colors.grey.shade300,
                                height: 150,
                                width: 1),
                            Expanded(
                              child: Column(
                                children: [
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    reverse: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text('${index + 1}',
                                                style: const TextStyle(
                                                    fontSize: 20)),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: LinearProgressIndicator(
                                                  color: Colors.green,
                                                  value: ratingValue[index],
                                                  backgroundColor:
                                                      Colors.grey.shade300,
                                                  minHeight: 4,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Sort by',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 18),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Newest',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: RotatedBox(
                                  quarterTurns: 45,
                                  child: Icon(
                                    Icons.sync_alt_outlined,
                                    color: Colors.green,
                                  )),
                            )
                          ],
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          child: Image.network(
                                            userInfo['profile'] ?? "-",
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Jignesh Patel',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          RatingBar.builder(
                                            itemCount: 5,
                                            allowHalfRating: true,
                                            glowColor: Colors.amber,
                                            glowRadius: 5,
                                            glow: true,
                                            initialRating: 4.5,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            itemSize: 15,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1),
                                            itemBuilder: (context, index) =>
                                                const Icon(Icons.star,
                                                    color: Colors.amber),
                                            onRatingUpdate: (value) {},
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            getDateInFormat(
                                                DateTime.now().toString()),
                                            style: TextStyle(
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            getTimeInFormat(
                                                DateTime.now().toString()),
                                            style: TextStyle(
                                                color: Colors.grey.shade500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "This charging station is fast and efficient,got my EV charged in no time!",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  Divider(
                                    color: Colors.grey.shade300,
                                    height: 30,
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: BottomAppBar(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      openWriteReview(context);
                    },
                    child: Material(
                      // borderRadius: BorderRadius.circular(25),
                      child: Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                              child: Text('Write a Review',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1)))),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  String getDateInFormat(date) {
    return DateFormat('dd, MMM yyyy').format(DateTime.now());
  }

  String getTimeInFormat(date) {
    return DateFormat('kk:mm a').format(DateTime.now());
  }

  RxList<dynamic> chargerList = [].obs;

  getStationCharger() async {
    QuerySnapshot<Map<String, dynamic>> chargertab =
        await FirebaseFirestore.instance.collection('charger').get();
    for (int i = 0; i < chargertab.docs.length; i++) {
      chargerList.add(chargertab.docs[i].data());
    }
    setState(() {});
  }

  void openWriteReview(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,

      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade400),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('Write a Review',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 1.2)),
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Give it a star',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2),
                        ),
                      ),
                      RatingBar.builder(
                        itemCount: 5,
                        itemSize: 50,
                        minRating: 1,
                        initialRating: 3.5,
                        glow: true,
                        glowRadius: 6,
                        glowColor: Colors.amber,
                        allowHalfRating: true,
                        unratedColor: Colors.grey.shade200,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                        itemBuilder: (context, index) => const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber),
                        onRatingUpdate: (value) {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'comment',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                      const TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 2,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {},
                child: Material(
                  // borderRadius: BorderRadius.circular(25),
                  child: Container(
                      margin: const EdgeInsets.all(20),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                          child: Text('Submit',
                              style: TextStyle(
                                color: Colors.white,
                              )))),
                ),
              )

            ],
          ),
        );
      },
    );
  }
}
