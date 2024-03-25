import 'package:flutter/material.dart';

class NotificationMessageWidget extends StatelessWidget {
  final String message;

  const NotificationMessageWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 70,
        width: 350,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 234, 234, 234),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              const Icon(
                Icons.notifications_active_rounded,
                color: Colors.red,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }
}
