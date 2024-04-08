import 'package:ev_point/add_vehicle_select_brand.dart';
import 'package:ev_point/station_list_display.dart';
import 'package:flutter/material.dart';

class AddVehicle extends StatelessWidget {
  const AddVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:const Icon(Icons.arrow_back,color:Colors.black,))
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),

          child: Column(

            children: [
              const SizedBox(height: 25),
              const Text("Personalize your experience by adding a vehicle 🚘",style: TextStyle(fontSize: 33,height: 1.3,fontWeight: FontWeight.w600),),
              const SizedBox(height: 20),
              const Text("Your vehicle is used to determine compatible charging stations.",style: TextStyle(fontSize: 17)),
              Image.asset("assets/images/ic_add_vehicle.png",)
            ],
          ),
        ),
      ),

      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Material(
              borderRadius: BorderRadius.circular(25),
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StationList(),));

                },
                child: Container(
                  height: 50,
                  width: 150,
                  margin: const EdgeInsets.only(left: 15,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green.shade100),
                  child: const Center(
                    child: Text("Add Later",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.green)),
                  ),
                ),
              ),
            ),
        ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Material(
                borderRadius: BorderRadius.circular(25),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectBrand(),));
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.green),
                    child: const Center(
                      child: Text("Add Vehicle",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
