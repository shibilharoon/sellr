import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellr_app/controller/auth_provider.dart';
import 'package:sellr_app/controller/firestore_provider.dart';
import 'package:sellr_app/controller/image_provider.dart';
import 'package:sellr_app/firebase_options.dart';
import 'package:sellr_app/view/auth_gate.dart';
import 'package:sellr_app/view/bottombar.dart';
import 'package:sellr_app/view/home_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProviders(),
        ),
        ChangeNotifierProvider(create: (context) => FirestoreProvider()),
        ChangeNotifierProvider(create: ((context) => ImageProviders())),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: BottomBar()),
    );
  }
}
