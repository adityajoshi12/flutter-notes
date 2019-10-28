import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning/util_widgets/bottom_navigation.dart';
import 'package:learning/util_widgets/bubble_bottom_nav.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MaterialApp(
      // Title
      title: "Using Tabs",
      // Home
      debugShowCheckedModeBanner: false,
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  @override
  Widget build(BuildContext context) {
    return BubbleBottomNav();
  }
}

