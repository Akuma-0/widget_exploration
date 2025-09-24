import 'package:flutter/material.dart';
import 'package:widget_exploration/features/home/ui/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Exploration',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
