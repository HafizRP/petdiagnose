import 'package:flutter/material.dart';
import 'main_menu.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainMenu()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets, size: 100, color: Colors.orange),
            SizedBox(height: 20),
            Text(
              "Sistem Pakar Penyakit Kucing",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text("Berbasis Forward Chaining"),
          ],
        ),
      ),
    );
  }
}