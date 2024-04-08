import 'package:ev_point/complete_your_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

// ignore: must_be_immutable
class OtpVerification2 extends StatefulWidget {
  OtpVerification2({super.key});

  OtpTimerButtonController controller = OtpTimerButtonController();

  @override
  State<OtpVerification2> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification2> {
  bool filledColor = false;

  get controller => null;

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
                "We have sent an OTP code to phone number +91 846 985 3502. Enter the OTP code below to continue.",
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
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every text-field is filled
              onSubmit: (String verificationCode) {
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
            Container(
              margin: const EdgeInsets.only(top: 220,right: 5,left: 5),
              decoration: BoxDecoration(
                  color: Colors.green ,
                  borderRadius: BorderRadius.circular(25)
              ),
              width:double.maxFinite,
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
              }, child: const Text("Continue",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),)
              ),


            ),
          ],
        ),
      ),
    );
  }
}
