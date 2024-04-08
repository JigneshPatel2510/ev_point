import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_point/tab/account%20tab/booking.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SelectCharger extends StatefulWidget {
  final dynamic stationDetails;
  final dynamic vehicleDetails;

  const SelectCharger({super.key, this.stationDetails, this.vehicleDetails});

  @override
  State<SelectCharger> createState() => _SelectChragerState();
}

class _SelectChragerState extends State<SelectCharger> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStationCharger();
  }

  int groupValue = -1;

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
        title: const Text("Select Charger",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
      ),
      body: ListView.separated(
        itemCount: chargerList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chargerList[index]['name'] ?? '-',
                                style: TextStyle(color: Colors.grey.shade500),
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Max.Power',
                                  style: TextStyle(color: Colors.grey.shade500),
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
                        Radio(
                          value: index,
                          groupValue: groupValue,
                          onChanged: (value) {
                            groupValue = index;
                            setState(() {});
                          },
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
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 15,
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () {
            if (groupValue == -1) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please select Charger.")));
              return;
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Booking(
                    stationDetails: widget.stationDetails,
                    vehicleDetails: widget.vehicleDetails,
                    chargerDetails: chargerList[groupValue],
                  ),
                ));
            // if(groupValue==-1){
            //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select Charger.")));
            //   return;
            // }
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewSummary(stationDetails: widget.stationDetails,vehicleDetails: widget.vehicleDetails,chargerDetails: chargerList[groupValue],)));
          },
          child: Material(
            borderRadius: BorderRadius.circular(25),
            child: Container(
                height: 50,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), color: Colors.green),
                child: const Center(
                    child:
                        Text("Continue", style: TextStyle(color: Colors.white)))),
          ),
        ),
      ),
    );
  }

  RxList<dynamic> chargerList = [].obs;

  getStationCharger() async {
    QuerySnapshot<Map<String, dynamic>> chargertab =
        await FirebaseFirestore.instance.collection('charger').get();
    for (int i = 0; i < chargertab.docs.length; i++) {
      var data=chargertab.docs[i].data();
      data['id']=chargertab.docs[i].id;
      chargerList.add(data);
    }
    setState(() {});
  }
}
