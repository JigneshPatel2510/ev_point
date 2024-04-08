import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

// ignore: must_be_immutable
class ScanPage extends StatelessWidget {
   ScanPage({super.key});


  ScanController controller = ScanController();
  String qrcode = 'Unknown';
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
         elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back,color: Colors.black)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.white30,
              width: 500, // custom wrap size
              height: 500,
              child: ScanView(
                
                controller:controller ,
// custom scan area, if set to 1.0, will scan full area
                scanAreaScale: 0.7,
                scanLineColor: Colors.green.shade400,
                onCapture: (data) {
                  // do something
                  
                },
                
              ),
            ),
          ),
        ],
      ),
    );
    
  }
  
}
