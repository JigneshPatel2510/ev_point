import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_point/constant/vars.dart';
import 'package:flutter/material.dart';

class Topup_Page extends StatefulWidget {
  const Topup_Page({super.key});

  @override
  State<Topup_Page> createState() => TopUp_PageState();
}

class TopUp_PageState extends State<Topup_Page> {
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text('Top Up Wallet',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Text(
              "Enter the amount of top up",
              style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: amount,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 10,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            amount.text = "\$10";
                            setState(() {});
                          },
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.green, width: 1.4)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 5),
                              child: Center(
                                  child: Text("\$10",
                                      style: TextStyle(color: Colors.green))),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            amount.text = "\$100";
                            setState(() {});
                          },
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.green, width: 1.4)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Center(
                                  child: Text("\$100",
                                      style: TextStyle(color: Colors.green))),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            amount.text = "\$500";
                            setState(() {});
                          },
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.green, width: 1.4)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Center(
                                  child: Text("\$500",
                                      style: TextStyle(color: Colors.green))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(width: 15),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            amount.text = "\$20";
                            setState(() {});
                          },
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.green, width: 1.4)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 5),
                              child: Center(
                                  child: Text("\$20",
                                      style: TextStyle(color: Colors.green))),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            amount.text = "\$200";
                            setState(() {});
                          },
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.green, width: 1.4)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Center(
                                  child: Text("\$200",
                                      style: TextStyle(color: Colors.green))),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            amount.text = "\$750";
                            setState(() {});
                          },
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.green, width: 1.4)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Center(
                                  child: Text("\$750",
                                      style: TextStyle(color: Colors.green))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(width: 15),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            amount.text = "\$50";
                            setState(() {});
                          },
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.green, width: 1.4)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 5),
                              child: Center(
                                  child: Text("\$50",
                                      style: TextStyle(color: Colors.green))),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            amount.text = "\$250";
                            setState(() {});
                          },
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.green, width: 1.4)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Center(
                                  child: Text("\$250",
                                      style: TextStyle(color: Colors.green))),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            amount.text = "\$1000";
                            setState(() {});
                          },
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.green, width: 1.4)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Center(
                                  child: Text("\$1000",
                                      style: TextStyle(color: Colors.green))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            InkWell(
              onTap: () {
                FirebaseFirestore.instance
                    .collection("wallet_transaction")
                    .add({
                  'userId': userInfo['id'],
                  'type': 'Add',
                  'amount': amount.text,
                  'message': "Added in wallet",
                  'date': DateTime.now().toString()
                }).then((value) async {
                  debugPrint("Success");
                  DocumentSnapshot user = await FirebaseFirestore.instance
                      .collection("users")
                      .doc(userInfo['id'])
                      .get();
                  Map<String, dynamic> u = user.data() as Map<String, dynamic>;
                  String p = u['wallet'] ?? "0";
                  int pAmt = int.parse(p.replaceAll("\$", ""));
                  debugPrint(p);

                  int enterAmount = int.parse(amount.text.replaceAll("\$", ""));
                  int tAm = pAmt + enterAmount;
// int update=p.toString().replaceAll("$", "");

                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(userInfo['id'])
                      .update({'wallet': tAm.toString()}).then((value) {
                    debugPrint("Wallet Updated");
                  }).onError((error, stackTrace) {
                    debugPrint("Wallet Update Failed");
                  });
                }).onError((error, stackTrace) {
                  debugPrint("Failed");
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: const Color(0xff01b763),
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child:
                      Text('Continue', style: TextStyle(color: Colors.white)),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
