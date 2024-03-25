import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold)), // Replace with actual user name
        actions: [
          // IconButton(
          //   onPressed: () {
          //   },
          //   icon: const Icon(Icons.call),
          // ),
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 10, 
              itemBuilder: (context, index) {
                final isSenderMessage = index % 2 == 0;
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: isSenderMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSenderMessage ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey.shade300,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(isSenderMessage ? 10 : 1),
                            bottomRight: Radius.circular(isSenderMessage ? 1 : 10),
                            topLeft: const Radius.circular(10),
                            topRight: const Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Message $index',
                              style: TextStyle(color: isSenderMessage ? Colors.white : Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: isSenderMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: const [
                          Text(
                            '10:30 AM', 
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey.shade200,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Action to attach image
                  },
                  icon: const Icon(Icons.camera_alt),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
