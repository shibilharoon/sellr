import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellr_app/view/bottombar.dart';
import 'package:sellr_app/view/home_page.dart';
import 'package:sellr_app/view/login_screen.dart';
import 'package:sellr_app/view/phone_auth_page.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const LoginPage())));
                },
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset(
                  "assets/image/Screenshot__67_-removebg-preview.png",
                  height: 120,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Email",
                style: TextStyle(color: Colors.white),
              ),
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter your email address",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 139, 139, 139))),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Name",
                style: TextStyle(color: Colors.white),
              ),
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter your name",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 139, 139, 139))),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Password",
                style: TextStyle(color: Colors.white),
              ),
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter your email password",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 139, 139, 139))),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => BottomBar())));
                },
                child: Container(
                  height: 50,
                  width: 335,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 199, 112, 13),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                "or",
                style: TextStyle(color: Colors.white),
              )),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => PhoneAuth())));
                },
                child: Container(
                    width: 335,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 169, 21, 21),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Login Using Phone",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: 335,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.google),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Login Using Google",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
