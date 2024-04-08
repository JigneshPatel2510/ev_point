
import 'package:ev_point/tab/account%20tab/account_tab.dart';
import 'package:ev_point/tab/mybooking%20tab/my_booking_tab.dart';
import 'package:ev_point/tab/my_wallet%20tab/my_wallet_tab.dart';
import 'package:ev_point/tab/saved_tab.dart';
import 'package:ev_point/tab/home_tab/home_tab.dart';
import 'package:flutter/material.dart';

class StationList extends StatefulWidget {
  const StationList({super.key});

  @override
  State<StationList> createState() => _StationListState();
}



class _StationListState extends State<StationList> {




  List<Widget> listOfWidget=[const HomeTab(),const SavedTab(),const MyBookingTab(),const MyWalletTab(),const AccountTab()];

  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:listOfWidget[currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.blue),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: Colors.transparent,
        onTap: (int index){
          currentIndex=index;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, color: Colors.grey.shade400),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/ic_save_icon.png",
                color: Colors.grey.shade400, height: 20, width: 20),
            label: "Saved",

          ),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/ic_check.png",
                  height: 20, width: 20, color: Colors.grey.shade400),
              label: "My Booking"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined,
                  color: Colors.grey.shade400),
              label: "My Wallet"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined,
                  color: Colors.grey.shade400),
              label: "Account"),
        ],
      ),
    );
  }



}
