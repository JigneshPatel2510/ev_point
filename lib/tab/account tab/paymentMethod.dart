import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_point/tab/account%20tab/add_new_payment.dart';
import 'package:ev_point/tab/account%20tab/review_summary.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  final dynamic stationDetails;
  final dynamic vehicleDetails;
  final dynamic chargerDetails;
  final dynamic bookingDetails;

  const PaymentMethod(
      {super.key,
      this.stationDetails,
      this.vehicleDetails,
      this.chargerDetails,
      this.bookingDetails});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool isFromBooking = true;

  int groupValue = -1;
  Map <String,dynamic> paymentDetails={};

  @override
  void initState() {
    // TODO: implement initState
    getPaymentMethod();
    super.initState();
  }

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
        title: const Text('Payment Method',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.qr_code_scanner_sharp,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: methodsList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200,
                    border: Border.all(width: 1, color: Colors.grey.shade300)),
                child: Center(
                  child: ListTile(
                      leading: Image.network(methodsList[index]['image_path'],
                          height: 60, width: 60),
                      title: Text(methodsList[index]['name'],
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900)),
                      trailing: Radio(
                        activeColor: Colors.green,
                        value: index,
                        groupValue: groupValue,
                        onChanged: (value) {
                          groupValue = index;
                          setState(() {});
                        },
                      )),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNewPayment(),
                    ));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Add New Payment",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            if(groupValue==-1){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select Payment Methods.")));
              return;

            }
            paymentDetails=methodsList[groupValue];


            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewSummary(
                    stationDetails: widget.stationDetails,
                    vehicleDetails: widget.vehicleDetails,
                    chargerDetails: widget.chargerDetails,
                    bookingDetails: widget.bookingDetails,
                    paymentMethods: paymentDetails,

                  ),
                ));
          },
          child: Material(
            borderRadius: BorderRadius.circular(25),
            child: Container(
                height: 50,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                    child: Text("Continue",
                        style: TextStyle(color: Colors.white)))),
          ),
        ),
      ),
    );
  }

  List<dynamic> methodsList = [];

  getPaymentMethod() async {
    QuerySnapshot<Map<String, dynamic>> method =
        await FirebaseFirestore.instance.collection('payment_method').get();
    for (int i = 0; i < method.docs.length; i++) {
      methodsList.add(method.docs[i].data());
    }
    setState(() {});
  }
}
