import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:portfolio_website/view/Components/home_page.dart';

void main() {
  // Web ke liye URL strategy set karo

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:  DeveloperPortfolio(),
    );
  }
}
