import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold)), // Replace with actual user name
        actions: [
          IconButton(
            onPressed: () {
              // Action to call the user
            },
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {
              // Action to open menu
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 10, // Example number of messages
              itemBuilder: (context, index) {
                // Example of alternating sender and receiver messages
                final isSenderMessage = index % 2 == 0;
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: isSenderMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSenderMessage ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey.shade300,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(isSenderMessage ? 10 : 1),
                            bottomRight: Radius.circular(isSenderMessage ? 1 : 10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
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
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: isSenderMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          Text(
                            '10:30 AM', // Example time
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
                  icon: Icon(Icons.camera_alt),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
