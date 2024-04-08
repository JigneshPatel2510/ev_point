import 'package:ev_point/select_vehicle.dart';
import 'package:flutter/material.dart';

class Trim extends StatefulWidget {
  final String? vehicle;
  final String? model;
  final bool? isFromMyVehicle;
  const Trim({super.key,this.vehicle,this.model,this.isFromMyVehicle});

  @override
  State<Trim> createState() => _TrimState();
}

class _TrimState extends State<Trim> {

  List<String> trimList=['40','40w/Supercharger','60','60w/Supercharger','85','P85','85D','P85D','70D'];

  List<String> filtertrimList = [];
  TextEditingController searchText=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back,color: Colors.black),),
        title: const Text("Trim",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
      ),
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: searchText.text.isEmpty?const Color(0xffF5F5F5):const Color(0xffECFCF6),
                border: Border.all(color: searchText.text.isEmpty?Colors.transparent:const Color(0xff02B864)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Image.asset(
                      "assets/icons/ic_search.png",
                      color: Colors.grey.shade400,
                      width: 27,
                      height: 27,
                    ),
                  ),
                  Expanded(
                      child: TextField(
                        controller: searchText,
                        onChanged: (value){
                          filtertrimList.clear();
                          for(int i=0;i<trimList.length;i++){
                            if(trimList[i].toLowerCase().contains(value.toLowerCase())){
                              filtertrimList.add(trimList[i]);
                            }
                          }
                          setState(() {

                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                        ),
                      ))
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchText.text.isEmpty?trimList.length:filtertrimList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.only(right: 16,left: 26),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  SelectedVehicle(vehicle: widget.vehicle,model: widget.model,trim:searchText.text.isEmpty?trimList[index]:filtertrimList[index],isFromMyVehicle: widget.isFromMyVehicle, ),));
                  },
                  title: Text(searchText.text.isEmpty?trimList[index]:filtertrimList[index]),
                 trailing: const Icon(Icons.navigate_next),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
