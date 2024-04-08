import 'package:ev_point/constant/asstes.dart';
import 'package:ev_point/constant/text.dart';
import 'package:ev_point/login%20&%20otp/phone_number.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset("assets/images/ic_loginpagephoto.png",
                    width: 270, height: 270),
              ),
            ],
          ),
          const Text("Let's you in",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
          const SizedBox(height: 20),
          buttonWithIconTitle(
              image: googleIcon, title: continueWithGoogle, onTap: () {}),
          const SizedBox(height: 20),
          buttonWithIconTitle(
              image: facebookIcon, title: continueWithFacebook, onTap: () {}),
          const SizedBox(height: 20),
          buttonWithIconTitle(
              image: appleIcon, title: continueWithApple, onTap: () {}),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      "or",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
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
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhoneNumber(),
                    ));
              },
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

                decoration: BoxDecoration(
                    color: Colors.green.shade500,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 1, color: Colors.grey.shade200)),
                // width: 330,
                // height: 60,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign in with Phone Number",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  const PhoneNumber(),
                          ));
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.green),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonWithIconTitle(
      {required String image, required String title, Function? onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          onTap!;
        },
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 1, color: Colors.grey.shade200)),
          // width: 330,
          // height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 20),
              Text(title,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w900)),
            ],
          ),
        ),
      ),
    );
  }
}
