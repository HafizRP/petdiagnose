import 'package:flutter/material.dart';

class CareTipsPage extends StatelessWidget {
  final Color primaryOrange = Colors.orange[800]!;
  final Color lightOrange = Colors.orange[50]!;

  final List<Map<String, String>> tips = [
    {
      "title": "Nutrisi Seimbang",
      "description":
          "Pastikan kucing Anda mendapatkan asupan protein yang cukup. Hindari memberikan makanan manusia yang mengandung bawang atau cokelat.",
      "icon": "assets/food.png",
    },
    {
      "title": "Vaksinasi Rutin",
      "description":
          "Vaksinasi penting untuk mencegah penyakit berbahaya seperti Rabies dan Panleukopenia. Konsultasikan jadwalnya dengan dokter hewan.",
      "icon": "assets/vaccine.png",
    },
    {
      "title": "Perawatan Bulu",
      "description":
          "Sisir bulu kucing secara rutin untuk mencegah hairball dan menjaga kulit tetap sehat, terutama untuk kucing berbulu panjang.",
      "icon": "assets/grooming.png",
    },
    {
      "title": "Kebersihan Litter Box",
      "description":
          "Bersihkan kotak pasir setidaknya dua kali sehari agar kucing nyaman dan terhindar dari penyakit saluran kemih.",
      "icon": "assets/litterbox.png",
    },
    {
      "title": "Aktivitas Fisik",
      "description":
          "Ajak kucing bermain setidaknya 15-30 menit sehari untuk mencegah obesitas dan stres.",
      "icon": "assets/play.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Tips Perawatan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryOrange,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: primaryOrange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Panduan Perawatan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Tips harian untuk kesehatan kucing",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.pets,
                  color: Colors.white.withOpacity(0.3),
                  size: 60,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: tips.length,
              itemBuilder: (context, index) {
                final tip = tips[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.05),
                        blurRadius: 15,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: lightOrange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.lightbulb_outline,
                              color: primaryOrange,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              tip['title']!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        tip['description']!,
                        style: TextStyle(
                          color: Colors.grey[700],
                          height: 1.5,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
