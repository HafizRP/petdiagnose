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
    // Durasi splash screen 3 detik
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainMenu()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Warna Orange yang sama dengan Main Menu
    final Color primaryOrange = Colors.orange[800]!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Dekorasi Background (Opsional: Lingkaran halus di pojok)
          Positioned(
            top: -50,
            right: -50,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.orange[50],
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon Logo dengan Container agar lebih menonjol
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.pets, size: 100, color: primaryOrange),
                ),
                SizedBox(height: 24),

                // Judul Utama
                Text(
                  "CAT HEALTH",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: primaryOrange,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 8),

                // Sub-judul
                Text(
                  "Sistem Pakar Penyakit Kucing",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  "Metode Forward Chaining",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                    letterSpacing: 0.5,
                  ),
                ),

                SizedBox(height: 50),

                // Indikator Loading yang senada
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    color: primaryOrange,
                    strokeWidth: 3,
                  ),
                ),
              ],
            ),
          ),

          // Teks di bagian bawah
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "v1.0.0",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
