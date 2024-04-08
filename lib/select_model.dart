import 'package:ev_point/trim.dart';
import 'package:flutter/material.dart';

class SelectModel extends StatefulWidget {
  final String? vehicle;
  final bool? isFromMyVehicle;
  const SelectModel({super.key,this.vehicle,this.isFromMyVehicle});

  @override
  State<SelectModel> createState() => _SelectModelState();
}

class _SelectModelState extends State<SelectModel> {

  List<String> modelList =['Roadster','Model S','Model X','Model 3','Model Y'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
        leadingWidth: 35,
        title:const Text("Select Model",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
      ),
       body: Column(
         children: [
           Expanded(
               child: ListView.builder(
                 itemCount: modelList.length,
                 shrinkWrap: true,
                 itemBuilder: (context,index) {
                   return ListTile(
                     contentPadding: const EdgeInsets.only(left:26,right:16),
                     onTap: (){
                       Navigator.push( context, MaterialPageRoute(builder: (context) =>  Trim(vehicle: widget.vehicle,model:modelList[index],isFromMyVehicle: widget.isFromMyVehicle),));
                     },
                     title: Text(modelList[index]),
                     trailing: const Icon(Icons.navigate_next),
                   );
                 },
               )
           ),
         ],
       ),


    );
  }
}
