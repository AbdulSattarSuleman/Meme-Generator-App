import 'package:flutter/material.dart';
import 'package:meme_generator/resources/theme_manager.dart';
import 'package:meme_generator/views/splash_screen.dart';

void main() {
  runApp(const MemeGenerator());
}

class MemeGenerator extends StatelessWidget {
  const MemeGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mene Generator App",
      home: const SplashScreen(),
      theme: ThemeManger().applicationTheme(),
    );
  }
}
