import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sellr_app/controller/auth_provider.dart';
import 'package:sellr_app/view/otp.dart';
import 'package:sellr_app/view/widgets/custom_phone.dart';
import 'package:sellr_app/view/widgets/custom_textfield.dart';

class PhoneAuthPage extends StatelessWidget {
  PhoneAuthPage({super.key});

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AuthProviders>(context, listen: false);

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
                    height: 30,
                  ),
                  Text(
                    "Enter your Phone Number",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 40, bottom: 10),
                      child:
                          CustomPhoneField(phonecontroller: phonecontroller)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: CustomTextField(
                        icons: Icons.person,
                        hintText: "enter your name",
                        controller: namecontroller),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: CustomTextField(
                        icons: Icons.mail,
                        hintText: "enter your email",
                        controller: emailcontroller),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      String countrycode = "+91";
                      String phonenumber = countrycode + phonecontroller.text;
                      if (phonenumber.length == 13) {
                        pro.signInWithPhone(phonenumber, namecontroller.text,
                            emailcontroller.text, context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Please enter a 10-digit phone number.'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 199, 112, 13),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          "Send OTP",
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
            ),
          ],
        ),
      ),
    );
  }
}
