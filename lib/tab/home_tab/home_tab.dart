
import 'package:ev_point/controller/home_controller.dart';
import 'package:ev_point/tab/home_tab/station_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'package:permission_handler/permission_handler.dart';

class HomeTab extends StatefulWidget {

  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

 HomeController homeController = Get.find();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getTab();
    homeController.stationlist.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeController.showMap
          ? Stack(
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            zoomControlsEnabled: true,
            initialCameraPosition: homeController.kGooglePlex,
            markers: {
              Marker(
                  markerId: const MarkerId("1"),
                  position: const LatLng(21.1702, 72.8311),
                  onTap: () {
                    homeController.showStationDetails(context);
                  })
            },
            onMapCreated: (GoogleMapController controller) {
              homeController.mapController.complete(controller);
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search station",
                        hintStyle: const TextStyle(color: Colors.black26),
                        prefixIcon: const Icon(Icons.search,
                            color: Colors.black26, size: 30),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(14),
                  margin: const EdgeInsets.only(left: 10),
                  child: Image.asset("assets/icons/ic_sliders.png",
                      width: 30, height: 30, color: Colors.green),
                )
              ],
            ),
          )
        ],
      )
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search station",
                        hintStyle: const TextStyle(color: Colors.black26),
                        prefixIcon: const Icon(Icons.search,
                            color: Colors.black26, size: 30),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(left: 10),
                  child: Image.asset("assets/icons/ic_sliders.png",
                      width: 30, height: 30, color: Colors.green),
                )
              ],
            ),
            Expanded(
              child: Obx(()=>ListView.separated(
                itemCount: homeController.searchText.text.isEmpty
                    ? homeController.stationlist.length
                    : homeController.filterStationList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  StationInfo(stationDetails: homeController.stationlist[index]),));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/ic_ev_station_icon_map.png",
                          color: homeController.stationlist[index]['status']=='Available'?  const Color(0xff09BF6b):Colors.red,
                          width: 50,
                          height: 50,
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(homeController.searchText.text.isEmpty
                                    ? homeController.stationlist[index]['name']??""
                                    : homeController.filterStationList[index]),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(homeController.stationlist[index]['address'].toString()??"-",style: TextStyle(color: Colors.grey.shade500),)
                              ],
                            )),
                        const Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.navigate_next),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),)
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Material(
            color: const Color(0xff09BF6b),
            shape: const CircleBorder(),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () async {
                if (await Permission.location.request().isGranted) {
                  homeController.showMap = true;
                  setState(() {});
                } else {
                  homeController.askPermission(context);
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.map, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Material(
            color: const Color(0xff09BF6b),
            shape: const CircleBorder(),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                homeController.showMap = false;
                setState(() {});
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.location_pin, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }





}
