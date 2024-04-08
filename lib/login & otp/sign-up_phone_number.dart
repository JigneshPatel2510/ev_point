
import 'package:ev_point/otp_verification_2.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class SignUpPhoneNumber extends StatefulWidget {
  const SignUpPhoneNumber({super.key});

  @override
  State<SignUpPhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<SignUpPhoneNumber> {
  bool isRemember = false;
  var phone='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
          color: Colors.transparent,
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
                padding: EdgeInsets.only(left: 20, top: 10,right: 10),
                child: Text(
                    "Please enter your phone number. you will receive an OTP code in the next step for the verification process."),
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
                      onChanged: print,
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'भारत',
                      favorite: ['+39','FR'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          phone=value;
                        },
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone Number",
                            counterText: ""
                        ),
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
              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Checkbox(value: isRemember,
                      activeColor: Colors.green,


                      onChanged: (bool? value) {

                        isRemember=value!;
                        setState(() {

                        });
                      },),

                    RichText(
                      text: const TextSpan(
                        style: TextStyle(height: 1.3),
                        children: <TextSpan>[
                          TextSpan(text:"I agree to EVPoint ",style: TextStyle(color: Colors.black,fontFamily: "Gabarito")),
                          TextSpan(text:"Public Agreement,",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,fontFamily: "Gabarito")),
                          TextSpan(text:" Terms,",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,fontFamily: "Gabarito")),
                          TextSpan(text:"\n Private Policy",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600,fontFamily: "Gabarito")),
                          TextSpan(text:", and confirm that I am over 17\n years old.",style: TextStyle(color: Colors.black,fontFamily: "Gabarito")),
                        ],
                      ),
                    ),




                  ],
                ),
              ),


              Container(
                margin: const EdgeInsets.only(top: 330,right: 15,left: 15),
                decoration: BoxDecoration(
                    color: Colors.green ,
                    borderRadius: BorderRadius.circular(25)
                ),
                width:double.maxFinite,
                child: TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerification2(),));
                },
                    child: const Text("Continue",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),)
                ),


              ),
            ],
          ),
        ),
      ),
    );
  }
}
