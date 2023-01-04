import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macos/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Brain Storm",
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      initialRoute: "/",
    );
  }
}
