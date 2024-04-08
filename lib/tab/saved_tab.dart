import 'package:ev_point/items/station_item.dart';
import 'package:flutter/material.dart';

class SavedTab extends StatelessWidget {
  const SavedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 35,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset("assets/images/ic_splash_image.png",
              height: 20, width: 20),
        ),
        title: const Text("Saved",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700)),
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
      ),
      body: ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return StationItem(index: index);
        },
      ),
    );
  }
}
