import 'package:flutter/material.dart';
import 'package:sellr_app/view/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 20, 20, 20),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(color: Colors.white),
                    ),
                    Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter your email address",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 139, 139, 139))),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(color: Colors.white),
                    ),
                    Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.remove_red_eye),
                              hintText: "Enter password",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(
                                      255, 139, 139, 139))),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const SignUp())));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color.fromARGB(255, 186, 117, 22),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
