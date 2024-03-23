import 'package:flutter/material.dart';
import 'package:sellr_app/view/home_page.dart';
import 'package:sellr_app/view/widgets/notification_message.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pop(MaterialPageRoute(builder: ((context) => HomePage())));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_rounded,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                NotificationMessageWidget(
                    message: "You have a message by George based..."),
                NotificationMessageWidget(
                    message: "You have a message by George based..."),
                NotificationMessageWidget(
                    message: "You have a message by George based..."),
                NotificationMessageWidget(
                    message: "You have a message by George based..."),
                NotificationMessageWidget(
                    message: "You have a message by George based..."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
