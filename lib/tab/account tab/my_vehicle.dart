import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_point/add_vehicle_select_brand.dart';
import 'package:ev_point/constant/vars.dart';
import 'package:flutter/material.dart';

class MyVehicle extends StatefulWidget {
  const MyVehicle({super.key});

  @override
  State<MyVehicle> createState() => _MyVehicleState();
}

class _MyVehicleState extends State<MyVehicle> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyVehicle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: const Icon(Icons.arrow_back, color: Colors.black)),
        leadingWidth: 40,
        title: const Text("My Vehicle",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SelectBrand(isFromMyVehicle: true),
                    )).then((value) {
                      getMyVehicle();
                });
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: myVehicle.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              Navigator.pop(context,myVehicle[index]);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Dismissible(
                direction: DismissDirection.endToStart,
                 onDismissed: (direction) {
                  try{
                    FirebaseFirestore.instance.collection("vehicle").doc(myVehicle[index]['id']).delete().then((value) {
                      debugPrint("Success");
                    }).onError((error, stackTrace) {
                      debugPrint("Failed");
                    });
                  }catch(e){
                    debugPrint("Error$e");
                  }



                 },

                 key: UniqueKey(),
                background: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:  Row(mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                            child: const Icon(Icons.delete,color: Colors.white,)),
                      ],
                    )),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/ic_car.png"),
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
                                    myVehicle[index]['brand']??"-",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                        fontSize: 21),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green,
                                    ),
                                    height: 20,
                                    width: 50,
                                    child: const Center(
                                        child: Text("In Use",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                            ))),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    myVehicle[index]['model']??'-',
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
                                      myVehicle[index]['trim']??'-',
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


                      const Padding(
                        padding: EdgeInsets.only(right: 17,left: 8),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> myVehicle = [];

  Future<void> getMyVehicle() async {
    QuerySnapshot<Map<String, dynamic>> vehicleList = await FirebaseFirestore
        .instance
        .collection("vehicle")
        .where("userId", isEqualTo: userInfo['id'])
        .get();
    myVehicle.clear();
    for (int i = 0; i < vehicleList.docs.length; i++) {
      var data=vehicleList.docs[i].data();
      data['id']=vehicleList.docs[i].id;
      myVehicle.add(data);
    }

    setState(() {});
    debugPrint("");
  }
}
