import 'package:flutter/material.dart';
import 'package:sellr_app/view/signup_page.dart';

class PhoneAuth extends StatelessWidget {
  const PhoneAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => const SignUp())));
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 380,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/Screenshot__64_-removebg-preview.png",
                  height: 120,
                ),
                const SizedBox(
                  height: 40,
                ),
                // Text(
                //   "Login",
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                // )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 20, 20, 20),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: const Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "OTP VERIFICATION",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter the OTP sent to",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Text("shbl@gmail.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      // Pinput(
                      //   length: 6,
                      //   showCursor: true,
                      //   defaultPinTheme: PinTheme(
                      //     width: 60,
                      //     height: 60,
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         border: Border.all(
                      //             color: const Color.fromARGB(
                      //                 255, 255, 255, 255))),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
