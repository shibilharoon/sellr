import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sellr_app/controller/auth_provider.dart';
import 'package:sellr_app/view/bottombar.dart';

class OtpPage extends StatelessWidget {
  OtpPage(
      {super.key,
      required this.email,
      required this.name,
      required this.verificationid});
  final String verificationid;
  final String? name;
  final String? email;
  final TextEditingController otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
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
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 600,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 20, 20, 20),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter the OTP we have sent to your",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Phone number",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Pinput(
                          controller: otpcontroller,
                          length: 6,
                          showCursor: true,
                          defaultPinTheme: const PinTheme(
                              textStyle:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              width: 50,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          verifyOtp(context);
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 199, 112, 13),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              "Verify OTP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
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
    );
  }

  void verifyOtp(BuildContext context) {
    Provider.of<AuthProviders>(context, listen: false)
        .verifyOtp(verificationid, otpcontroller.text, () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomBar(),
          ));
    }, name!, email!);
  }
}
