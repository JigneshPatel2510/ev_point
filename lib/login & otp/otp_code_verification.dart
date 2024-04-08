import 'package:country_code_picker/country_code_picker.dart';
import 'package:ev_point/complete_your_profile.dart';
import 'package:ev_point/login%20&%20otp/phone_number.dart';
import 'package:ev_point/station_list_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

// ignore: must_be_immutable
class OtpVerification extends StatefulWidget {
  final String? mobilenumber;
  OtpVerification({super.key, this.mobilenumber});

  OtpTimerButtonController controller = OtpTimerButtonController();

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  bool filledColor = false;

  get controller => null;
final  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    var code="";
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
            )),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                const Text("OTP code verification",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 25)),
                const SizedBox(width: 7),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Image.asset("assets/icons/ic_locked_key.png",
                      height: 50, width: 30),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "We have sent an OTP code to your phone number  +91 8469853502 . Enter the OTP code below to sign in.",
                style:
                    TextStyle(color: Colors.black, fontSize: 15, height: 1.3),
              ),
            ),
            const SizedBox(height: 60),
            OtpTextField(
              // borderColor: Colors.yellow,
              fieldWidth: 40,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 6,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              // enabledBorderColor: Colors.yellow,
              focusedBorderColor: Colors.green,
              //runs when a code is typed in
              onCodeChanged: (value) {

                //handle validation or checks here
              },
              //runs when every text-field is filled
              onSubmit: (value) async{
                code=value;
                try{
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PhoneNumber.verify, smsCode: code);

                  // Sign the user in (or link) with the credential
                  await auth.signInWithCredential(credential);


                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => ProfilePage(mobileNumber: widget.mobilenumber),), (route) => false);
                }
                catch(e){
                  print("Wrong OTP");
              }



                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         title: Text("Verification Code"),
                //         content: Text('Code entered is $verificationCode'),
                //       );
                //     });
              }, // end onSubmit
            ),
            const Padding(
              padding: EdgeInsets.only(top: 35),
              child: Text("Didn't receive email?",
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ),

            const SizedBox(height: 25),
            OtpTimerButton(
              controller: controller,
              height: 60,
              text: const Text(
                'Resend OTP',
              ),
              duration: 60,
              radius: 30,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              buttonType: ButtonType.text_button,
              // or ButtonType.outlined_button
              loadingIndicator: const CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.red,
              ),
              loadingIndicatorColor: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
