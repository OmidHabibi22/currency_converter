import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() {
  runApp(const BitcoinApp());
}

class BitcoinApp extends StatelessWidget {
  const BitcoinApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PriceScreen(),
    );
  }
}


