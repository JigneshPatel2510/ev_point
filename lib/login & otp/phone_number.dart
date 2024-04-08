import 'package:country_code_picker/country_code_picker.dart';
import 'package:ev_point/login%20&%20otp/otp_code_verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  static String verify='';

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  bool isRemember = false;
  var phone = "";
  var countryCode = "+91";
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text("Hello there",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 25)),
                    // SizedBox(width: 10),
                    Image.asset("assets/icons/ic_wave_hand.png",
                        height: 50, width: 30),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10, right: 10),
                child: Text(
                    "Enter your phone number. you will receive an OTP code in the next step to sign in."),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Phone Number",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // color: Colors.blue.shade200,
                height: 50,
                child: Row(
                  children: [
                     CountryCodePicker(
                      onChanged: (CountryCode value) {
                        countryCode=value.dialCode!;
                      },
                      initialSelection: 'भारत',
                      favorite: ['+91', 'भारत'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          phone = value;
                        },
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone Number",
                            counterText: ""),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 1,
                color: Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: isRemember,
                      activeColor: Colors.green,
                      onChanged: (bool? value) {
                        isRemember = value!;
                        setState(() {});
                      },
                    ),
                    const Text("Remember me")
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 1,
                color: Colors.grey.shade200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Can't access your phone number?",
                  style: TextStyle(color: Colors.grey.shade400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Use email to sign in",
                  style: TextStyle(
                      color: Colors.green.shade400,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: const Text(
                          "or continue with",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        )),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade400, width: 1),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 50,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/icons/ic_google.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade400, width: 1),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 50,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Image.asset(
                        "assets/icons/ic_apple.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade400, width: 1),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 50,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/icons/ic_facebook.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 110),
                height: 1,
                color: Colors.grey.shade200,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25)),
                  width: double.maxFinite,
                child: TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber:countryCode+phone,
                        timeout: const Duration(seconds: 60),
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          PhoneNumber.verify=verificationId;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpVerification(mobilenumber:countryCode+phone ),
                              ));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
