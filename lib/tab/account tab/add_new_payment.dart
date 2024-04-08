import 'package:flutter/material.dart';

class AddNewPayment extends StatefulWidget {
  const AddNewPayment({super.key});

  @override
  State<AddNewPayment> createState() => _AddNewPaymentState();
}

class _AddNewPaymentState extends State<AddNewPayment> {
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
            child: const Icon(Icons.arrow_back_rounded,color: Colors.black)),
        title: const Text("Add New Payment",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black)),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
