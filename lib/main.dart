import 'package:flutter/material.dart';
import 'package:portfolio/ui/home.dart';
import 'package:portfolio/utils/screen/screen_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: const Color(0xFF2c2f32),
      theme: ThemeData(brightness: Brightness.light),
      home: const MyAppChild(),
    );
  }
}

class MyAppChild extends StatefulWidget {
  const MyAppChild({super.key});

  @override
  MyAppChildState createState() => MyAppChildState();
}

class MyAppChildState extends State<MyAppChild> {
  @override
  Widget build(BuildContext context) {
    // instantiating ScreenUtil singleton instance, as this will be used throughout
    // the app to get screen size and other stuff
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return const HomePage();
  }
}
