import 'package:ev_point/complete_your_profile.dart';
import 'package:ev_point/constant/vars.dart';
import 'package:ev_point/tab/account%20tab/Security.dart';
import 'package:ev_point/tab/account%20tab/language.dart';
import 'package:ev_point/tab/account%20tab/my_vehicle.dart';
import 'package:ev_point/tab/account%20tab/paymentMethod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 35,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left:10),
          child: Image.asset("assets/images/ic_splash_image.png"),
        ),
        title: const Text("Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10 ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1.5),

              ),
                child: const Icon(Icons.more_horiz_outlined,color: Colors.black, size:17,)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.network(userInfo['profile']??"-",width: 70,height: 70,fit: BoxFit.cover,),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(userInfo['name']??"-",style: const TextStyle(color:Colors.black, fontWeight: FontWeight.w600,fontSize: 14),),
                        ),
                        const SizedBox(height:06,),
                        Text(userInfo['mobileNumber']??"-",style: const TextStyle(color: Colors.grey,fontSize: 14),)
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right:10 ),
                    child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 18,),
                  )

                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(height: 10),
               ListTile(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const MyVehicle(),));
                 },
                 leading: const Icon(Icons.car_repair,),
                 title:const Text("My Vehicle",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500 ),),
                 trailing: const Icon(Icons.arrow_forward_ios,size: 18),
               ),

               ListTile(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentMethod(),));
                 },
                 leading: const Icon(Icons.payment,),
                 title:const Text("Payment Methods",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500 ),),
                 trailing:const Icon(Icons.arrow_forward_ios,size: 18),
               ),


              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(height: 10),
               ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(isFromSetting: true),));
                  },
                leading:const Icon(Icons.person_outline,),
                title: const Text("Personal Info",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500 ),),
                trailing:const Icon(Icons.arrow_forward_ios,size: 18),
              ),
               ListTile(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const Security(),));
                 },
                 leading:const Icon(Icons.security_sharp,),
                 title: const Text("Security",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500 ),),
                 trailing:const Icon(Icons.arrow_forward_ios,size: 18),

               ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const Language(),));
                },
                leading:const Icon(Icons.language,),
                title:const Row(
                  children: [
                    Text("Language",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500 ),),
                    Spacer(),
                    Text("English (US)",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500 ),),
                  ],
                ),

                trailing:  const Icon(Icons.arrow_forward_ios,size: 18),

              ),
              const SizedBox(height:10,),
               ListTile(

                leading:const Icon(Icons.remove_red_eye_outlined,),
                title:Row(
                  children: [
                    const Text("Dark Mode",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500 ),),
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

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),const SizedBox(height: 10),

              ListTile(
                onTap: (){},
                leading:const Icon(Icons.help_center,),
                title:const Text("Help Center",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500 ),),
                trailing:const Icon(Icons.arrow_forward_ios,size: 18),

              ),
              ListTile(
                onTap: (){},
                leading:const Icon(Icons.lock_outline,),
                title: const Text("Privacy Policy",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500 ),),
                trailing: const Icon(Icons.arrow_forward_ios,size: 18),

              ),
              ListTile(
                onTap: (){},
                leading: const Icon(Icons.info_outline,),
                title: const Text("About EVPoint",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500 ),),
                trailing: const Icon(Icons.arrow_forward_ios,size: 18),

              ),
              ListTile(
                onTap: (){},
                leading:const Icon(Icons.logout,),
                title: const Text("Log Out",style: TextStyle(fontSize:17,fontWeight: FontWeight.w500,color: Colors.red ),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
