import 'package:flutter/material.dart';

class ContactExpertPage extends StatelessWidget {
  final Color primaryOrange = Colors.orange[800]!;
  final Color lightOrange = Colors.orange[50]!;

  final List<Map<String, String>> experts = [
    {
      "name": "Drh. Budi Santoso",
      "speciality": "Dokter Hewan Umum",
      "experience": "10 Tahun",
      "rating": "4.9",
      "image": "assets/doctor1.png", // Placeholder, in real app need asset
    },
    {
      "name": "Drh. Siti Aminah",
      "speciality": "Spesialis Bedah",
      "experience": "8 Tahun",
      "rating": "4.8",
      "image": "assets/doctor2.png",
    },
    {
      "name": "Drh. Reza Rahadian",
      "speciality": "Ahli Nutrisi Hewan",
      "experience": "5 Tahun",
      "rating": "4.7",
      "image": "assets/doctor3.png",
    },
    {
      "name": "Drh. Maya Putri",
      "speciality": "Dermatologi Kucing",
      "experience": "12 Tahun",
      "rating": "5.0",
      "image": "assets/doctor4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Hubungi Pakar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryOrange,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
            decoration: BoxDecoration(
              color: primaryOrange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Temukan Dokter Hewan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Konsultasi langsung dengan ahlinya",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: experts.length,
              itemBuilder: (context, index) {
                final expert = experts[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: lightOrange,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.person_outline,
                          size: 40,
                          color: primaryOrange,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expert['name']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              expert['speciality']!,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  expert['rating']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  expert['experience']!,
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.phone, color: primaryOrange),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Menghubungi ${expert['name']}...",
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.message, color: Colors.green),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Membuka chat dengan ${expert['name']}...",
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
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
