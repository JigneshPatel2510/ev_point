import 'package:flutter/material.dart';

class RoutePlanner extends StatefulWidget {
  const RoutePlanner({super.key});

  @override
  State<RoutePlanner> createState() => _RoutePlannerState();
}

class _RoutePlannerState extends State<RoutePlanner> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back,color: Colors.black)),
        title: const Text('Route Search',style: TextStyle(letterSpacing: 0.5,fontWeight: FontWeight.w900,color: Colors.black)),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("From",style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            TextField(
              decoration:InputDecoration(
                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff01B763))),

                suffixIcon: const Icon(Icons.location_on_rounded,color: Color(0xff01B763),),
                hintText: 'Choose Staring Point',
                hintStyle: TextStyle(fontWeight: FontWeight.w600,color: Colors.grey.shade400)
              ),
            ),const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("To",style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            TextField(
              decoration:InputDecoration(
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff01B763))),

                  suffixIcon: const Icon(Icons.location_on_rounded,color: Color(0xff01B763),),
                  hintText: 'Choose Destination',
                  hintStyle: TextStyle(fontWeight: FontWeight.w600,color: Colors.grey.shade400)
              ),
            )

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child:Container(
            height: 50,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
              color: const Color(0xff01B763)),
              child: const Center(child: Text('Search',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.5),))) ),
    );
  }
}
