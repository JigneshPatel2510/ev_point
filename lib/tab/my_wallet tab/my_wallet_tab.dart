import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_point/tab/my_wallet%20tab/topup.dart';
import 'package:flutter/material.dart';

class MyWalletTab extends StatefulWidget {
  const MyWalletTab({super.key});

  @override
  State<MyWalletTab> createState() => _MYWalletTabState();
}

class _MYWalletTabState extends State<MyWalletTab> {
  List<Map<String,dynamic>> listOfWalletTransaction=[];
 bool isTransactionLoding = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 35,
        title: const Text("My Wallet",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset("assets/images/ic_splash_image.png"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              "assets/icons/ic_search.png",
              color: Colors.black,
              height: 30,
              width: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Opacity(
                          opacity: 0.8,
                          child: Image.asset(
                            "assets/images/green_background.jpg",
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ))),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your Balance",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              Text(
                                "\$950.50",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 27,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Topup_Page(),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 5),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/icons/ic_topup.png",
                                          height: 17, width: 17),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const Text(
                                        "Top up",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 23),
                  ),
                  Spacer(),
                  Text("View All",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.green)),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.green,
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
             isTransactionLoding==true?const Center(child: CircularProgressIndicator()): listOfWalletTransaction.isEmpty
                ? const SizedBox.shrink()
                : ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listOfWalletTransaction.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 80,
                        width: double.maxFinite,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey.shade300)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 28,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: listOfWalletTransaction[index]
                                                              ['type'] ==
                                                          'Add'
                                                      ? Colors.green
                                                      : Colors.red,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 13.0,
                                            ),
                                            child: Text(
                                              listOfWalletTransaction[index]
                                                      ['type'] ??
                                                  "-",
                                              style: TextStyle(
                                                  color: listOfWalletTransaction[index]
                                                              ['type'] ==
                                                          'Add'
                                                      ? Colors.green
                                                      : Colors.red,
                                                  fontSize: 10),
                                            ),
                                          )),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4),
                                          child: Text(
                                            listOfWalletTransaction[index]
                                                    ['message'] ??
                                                '-',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 4),
                                      child: Row(
                                        children: [
                                          Text(
                                            listOfWalletTransaction[index]['date'] ??
                                                '-',
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.5),
                                          ),
                                          // Padding(
                                          //   padding:
                                          //       EdgeInsets.symmetric(horizontal: 4),
                                          //   child: Text(
                                          //     ".",
                                          //     style: TextStyle(
                                          //       color: Colors.grey,
                                          //     ),
                                          //   ),
                                          // ),
                                          // Text(
                                          //   "10:00 AM",
                                          //   style: TextStyle(
                                          //       color: Colors.grey, fontSize: 12.5),
                                          // )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        listOfWalletTransaction[index]['amount'] ??
                                            '-',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: listOfWalletTransaction[index]
                                                        ['type'] ==
                                                    'Add'
                                                ? Colors.green
                                                : Colors.red,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> getMyTransaction() async {

    QuerySnapshot<Map<String, dynamic>> tansactionlist = await FirebaseFirestore.instance.collection("wallet_transaction").get();
    isTransactionLoding=true;
    setState(() {

    });
    listOfWalletTransaction.clear();
    for(int i=0;i<tansactionlist.docs.length;i++){
      var d=tansactionlist.docs[i].data();
      d['id']=tansactionlist.docs[i].id;
      listOfWalletTransaction.add(d);
    }
    isTransactionLoding=false;
    setState(() {});
  }
}
