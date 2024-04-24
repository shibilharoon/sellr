import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sellr_app/model/chat_model.dart';

class ChatService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Reference firebseStorage = FirebaseStorage.instance.ref();
  String downloadUrl = '';
  sendMessage(String recieverId, String message, String messagetype) async {
    final String currentUserId = firebaseAuth.currentUser!.uid;
    final String currentUserEmail = firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    ChatModel chatModel = ChatModel(
        messagetype: messagetype,
        content: message,
        senderId: currentUserId,
        senderEmailId: currentUserEmail,
        time: timestamp,
        recieverId: recieverId);
    List ids = [currentUserId, recieverId];
    ids.sort();
    String chatroomid = ids.join('_');
    await firebaseFirestore
        .collection('chats')
        .doc(chatroomid)
        .collection('message')
        .add(chatModel.toJson());
  }

  sendImageMessage(String recieverId, image) async {
    Reference childFolder = firebseStorage.child('images');
    Reference? imageUpload =
        childFolder.child("${DateTime.now().millisecond}.jpg");
    try {
      await imageUpload.putFile(image);
      downloadUrl = await imageUpload.getDownloadURL();
      sendMessage(recieverId, downloadUrl, 'image');
    } catch (e) {
      throw Exception(e);
    }
  }
}
