import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() => runApp(CatExpertSystem());

class CatExpertSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diagnosa Penyakit Kucing',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
