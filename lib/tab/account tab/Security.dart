import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_rounded, color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Security",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
      ),
      body:  Column(
        children: [
          ListTile(
            title: Row(
              children: [
                const Text("Remember Me",style: TextStyle(fontWeight: FontWeight.w600,)),
                const Spacer(),
                FlutterSwitch(
                  width: 43,
                  height: 23.0,
                  activeColor: Colors.green,
                  padding: 1.7,
                  toggleSize: 20,
                  value: true,
                  borderRadius: 30,
                  onToggle: (val) {
                    status = val;
                    setState(() {

                    });
                  },
                ),
              ],
            ),

          ),
          ListTile(
            title: Row(
              children: [
                const Text("Biometric ID",style: TextStyle(fontWeight: FontWeight.w600,)),
                const Spacer(),
                FlutterSwitch(
                  width: 43,
                  height: 23.0,
                  activeColor: Colors.green,
                  padding: 1.7,
                  toggleSize: 20,
                  value: true,
                  borderRadius: 30,
                  onToggle: (val) {
                    status = val;
                    setState(() {

                    });
                  },
                ),
              ],
            ),

          ),
          ListTile(
            title: Row(
              children: [
                const Text("Face ID",style: TextStyle(fontWeight: FontWeight.w600,)),
                const Spacer(),
                FlutterSwitch(
                  width: 43,
                  height: 23.0,
                  activeColor: Colors.green,
                  padding: 1.7,
                  toggleSize: 20,
                  value: true,
                  borderRadius: 30,
                  onToggle: (val) {
                    status = val;
                    setState(() {

                    });
                  },
                ),
              ],
            ),

          ),
          ListTile(
            title: Row(
              children: [
                const Text("SMS Authenticator",style: TextStyle(fontWeight: FontWeight.w600,)),
                const Spacer(),
                FlutterSwitch(
                  width: 43,
                  height: 23.0,
                  activeColor: Colors.green,
                  padding: 1.7,
                  toggleSize: 20,
                  value: true,
                  borderRadius: 30,
                  onToggle: (val) {
                    status = val;
                    setState(() {

                    });
                  },
                ),
              ],
            ),

          ),
          ListTile(
            title: Row(
              children: [
                const Text("Google Authenticator",style: TextStyle(fontWeight: FontWeight.w600,)),
                const Spacer(),
                FlutterSwitch(
                  width: 43,
                  height: 23.0,
                  activeColor: Colors.green,
                  padding: 1.7,
                  toggleSize: 20,
                  value: true,
                  borderRadius: 30,
                  onToggle: (val) {
                    status = val;
                    setState(() {

                    });
                  },
                ),
              ],
            ),

          ),
          const ListTile(
            title: Text("Device Management",style: TextStyle(fontWeight: FontWeight.w600,)),
            trailing: Icon(Icons.arrow_forward_ios,color: Colors.black),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: (){

            },
            child: Container(padding: const EdgeInsets.symmetric(horizontal: 100,vertical:17),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(30),

              ),
              child: const Text("Change Password",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,letterSpacing: 0.7)),
            ),
          )

        ],
      ),
    );
  }
}
