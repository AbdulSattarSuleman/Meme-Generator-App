import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meme_generator/resources/style_manger.dart';
import 'package:meme_generator/views/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.deepPurple,
          Colors.blueAccent,
        ])),
        child: Center(
            child: Text("Meme Generator App",
                style: StyleManager.styleManagerMethod(
                    25.0, Colors.white, FontWeight.bold, FontStyle.italic))),
      ),
    );
  }
}
