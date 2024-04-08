import 'package:flutter/material.dart';

class ChargingNow extends StatefulWidget {
  final String chargingPage;
  const ChargingNow({super.key,required this.chargingPage});

  @override
  State<ChargingNow> createState() => _ChargingNowState();
}

class _ChargingNowState extends State<ChargingNow> {
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
        title:
             Text(widget.chargingPage, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              const Text('Vehicle',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600),),
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.grey.shade100,
                  border: Border.all(color: Colors.grey.shade300)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/ic_car.png",),
                    ),
                    Container(
                      color: Colors.grey.shade300,
                      width: 1,
                      height: 50,
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Tesla",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      fontSize: 21),
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Model S",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  ".",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    "40",
                                    style: TextStyle(
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
                      padding: EdgeInsets.all(10),
                      child: Text("Change",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.green,fontSize:16),),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Comment',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600),),
              const SizedBox(height: 10,),
              const TextField(

                decoration: InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                style: TextStyle(fontWeight: FontWeight.w600,),
                maxLines:3,
              ),
              const SizedBox(height: 20,),
              if(widget.chargingPage == "Charging Now")...[
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Max kW',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600),),
                    // const SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ]else if(widget.chargingPage=="Waiting")...[
                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('I will be here for',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600),),
                                  // const SizedBox(height: 20,),
                                  DropdownButtonFormField(items: const [
                                    DropdownMenuItem(
                                        value:'15 Mins' ,
                                        child: Text('15 Mins',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)),
                                    DropdownMenuItem(
                                        value: '30 Mins',
                                        child: Text('30 Mins',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)),
                                    DropdownMenuItem(
                                        value: '45 Mins',
                                        child: Text('45 Mins',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)),
                                    DropdownMenuItem(
                                        value: '1 Hour',
                                        child: Text('1 Hour',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)),
                                    DropdownMenuItem(
                                        value: '1/2 Hour',
                                        child: Text('1/2 Hour',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)),
                                    DropdownMenuItem(
                                        value: '2 Hours',
                                        child: Text('2 Hours',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)),

                                  ],
                                    decoration: const InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                                    onChanged:(value) {

                                  },)
                                ],
                              ),
              ]else if(widget.chargingPage=="Successfully Charged")...[
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Max kW',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600),),
                    // const SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ]else if(widget.chargingPage=="Could Not Charge")...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Problem',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600),),
                    const SizedBox(height: 20,),
                    DropdownButtonFormField(items: const [
                      DropdownMenuItem(
                          value: 'Could not activate',
                          child: Text('Could not activate',style: TextStyle(fontWeight: FontWeight.w600),)),
                      DropdownMenuItem(
                          value: 'I am in hurry!!',
                          child: Text('I am in hurry!!',style: TextStyle(fontWeight: FontWeight.w600),)),
                      DropdownMenuItem(
                          value: 'Station in maintenance!!',
                          child: Text('Station in maintenance',style: TextStyle(fontWeight: FontWeight.w600),)),
                      DropdownMenuItem(
                          value: 'Charger Could not work properly!!',
                          child: Text('Charger Could not work properly!!',style: TextStyle(fontWeight: FontWeight.w600),)),
                    ], onChanged: (value) {

                    },
                    decoration: const InputDecoration(focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                    )
                  ],
                ),
              ]else if(widget.chargingPage=="Leave a Comment  ")...[]








            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(height: 80,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(child: Text('Submit',style: TextStyle(color: Colors.white)))),
      ),
    );
  }
}
