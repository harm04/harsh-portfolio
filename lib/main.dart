import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:harsh_profile/pages/mobile/mobhome.dart';
import 'package:harsh_profile/pages/web/webhome.dart';
import 'package:harsh_profile/responsive/responsive.dart';

import 'package:rive/rive.dart';

void main() async {
  await RiveFile.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCdioVMsPveOU5NzjnaZu_A2u6efJlh83U",
          authDomain: "harsh-project-8cafb.firebaseapp.com",
          projectId: "harsh-project-8cafb",
          storageBucket: "harsh-project-8cafb.appspot.com",
          messagingSenderId: "941202859013",
          appId: "1:941202859013:web:9569d9bcb7929df2dba86c"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harsh Profile',
      theme: ThemeData.dark(),
      home: const ResponsiveLayout(
        mobScaffold: MobHomePage(),
        webScaffold: WebHomePage(),
      ),
      // home:const AdminPanel(),

      debugShowCheckedModeBanner: false,
    );
  }
}
