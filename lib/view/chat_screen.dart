import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellr_app/controller/firestore_provider.dart';
import 'package:sellr_app/model/product_model.dart';
import 'package:sellr_app/service/auth_services.dart';
import 'package:sellr_app/service/chat_service.dart';

class ChatScreen extends StatefulWidget {
  final ProductModel productModel;

  const ChatScreen({Key? key, required this.productModel});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messagecontroller = TextEditingController();

  AuthService service = AuthService();

  @override
  void initState() {
    super.initState();
    final currentUserid = service.firebaseAuth.currentUser!.uid;
    Provider.of<FirestoreProvider>(context, listen: false)
        .getMessages(currentUserid, widget.productModel.sellerId!);
    print('UserIds 1 ${currentUserid} 2 ${widget.productModel.sellerId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 60, 27, 14),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 27, 14),
        title: Text("${widget.productModel.sellerName}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white)), // Replace with actual user name
        actions: [
          // IconButton(
          //   onPressed: () {
          //   },
          //   icon: const Icon(Icons.call),
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:
                Consumer<FirestoreProvider>(builder: (context, value, child) {
              return ListView.builder(
                itemCount: value.messages.length,
                itemBuilder: (context, index) {
                  final chats = value.messages[index];
                  DateTime dateTime = chats.time!.toDate();
                  // String formattedTime = DateFormat.jm().format(dateTime);
                  var aligmnet =
                      chats.senderId == service.firebaseAuth.currentUser!.uid
                          ? Alignment.centerRight
                          : Alignment.centerLeft;
                  var bubbleColor =
                      chats.senderId == service.firebaseAuth.currentUser!.uid
                          ? Color.fromARGB(255, 255, 255, 255)
                          : Color.fromARGB(255, 150, 212, 197);
                  var borderRadius =
                      chats.senderId == service.firebaseAuth.currentUser!.uid
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15))
                          : const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(15));
                  if (chats.messagetype == 'text') {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                      child: Align(
                        alignment: aligmnet,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 40,
                            minWidth: 50,
                            maxWidth: 250,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: bubbleColor,
                              borderRadius: borderRadius,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    chats.content!,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Text(
                                        //   formattedTime,
                                        //   style: TextStyle(
                                        //       color: Colors.black.withOpacity(0.7)),
                                        // )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                      child: Align(
                        alignment: aligmnet,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 50,
                            minWidth: 200,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: bubbleColor,
                              borderRadius: borderRadius,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.network(
                                    chats.content!,
                                    height: 300,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Text(
                                        //   formattedTime,
                                        //   style: TextStyle(
                                        //       color: Colors.black.withOpacity(0.7)),
                                        // )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Action to attach image
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: messagecontroller,
                        decoration: const InputDecoration(
                          hintText: 'Type a message...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      sendMessage();
                    },
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  sendMessage() async {
    if (messagecontroller.text.isNotEmpty) {
      await ChatService().sendMessage(
          widget.productModel.sellerId!, messagecontroller.text, 'text');
      messagecontroller.clear();
    }
  }
}
