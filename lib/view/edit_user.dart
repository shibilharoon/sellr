import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sellr_app/controller/firestore_provider.dart';
import 'package:sellr_app/controller/image_provider.dart';
import 'package:sellr_app/model/user_model.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({required this.currentUser, super.key});
  UserModel? currentUser;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userImageController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userPlaceController = TextEditingController();
  TextEditingController userBioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              updateUserInfo();
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Consumer<ImageProviders>(
          builder: (context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      value.selectImage(source: ImageSource.gallery);
                    },
                    child: Container(
                      height: 200,
                      width: 330,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: value.selectedImage != null
                                  ? FileImage(File(value.selectedImage!.path))
                                  : const AssetImage(
                                          "assets/image/add image png.png")
                                      as ImageProvider),
                          color: Color.fromARGB(255, 219, 217, 216),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: userEmailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: userPhoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: userPlaceController,
                    decoration: const InputDecoration(
                      labelText: 'Place',
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: userBioController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Bio',
                      prefixIcon: Icon(Icons.info),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateUserInfo() async {
    final firePro = Provider.of<FirestoreProvider>(context, listen: false);
    final imagepro = Provider.of<ImageProviders>(context, listen: false);
    await firePro.addProfileImage(
        username: userNameController.text,
        fileimage: File(imagepro.selectedImage!.path));

    firePro.updateUserInfo(
        name: userNameController.text,
        email: userEmailController.text,
        image: firePro.service.downloadUrl!,
        number: userPhoneController.text,
        place: userPlaceController.text,
        bio: userBioController.text);
  }
}
