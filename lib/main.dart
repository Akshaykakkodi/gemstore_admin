import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/controller/admin_controller.dart';
import 'package:gemstore_admin/login/controller/login_controller.dart';
import 'package:gemstore_admin/login/view/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA_jTUlwVcgM0f4OJW-Al08E38u8JbreZw",
            storageBucket: "gemstore-18325.appspot.com",
            appId: "1:1069341183203:android:e0243890d8232f4c8f49d6",
            messagingSenderId: "1069341183203",
            projectId: "gemstore-18325"));
    runApp(const MyApp());
  } catch (e) {
    log(e.toString());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminController(),
        )
      ],
      child: MaterialApp(
        title: 'Gemstore Admin',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}
