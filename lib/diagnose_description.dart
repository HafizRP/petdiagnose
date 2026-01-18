import 'package:flutter/material.dart';
import 'db/diagnose.dart'; // Pastikan list 'diseases' ter-import dari sini

class DiseaseListPage extends StatelessWidget {
  // Primary Orange Color Palette
  final Color primaryOrange = Colors.orange[800]!;
  final Color lightOrange = Colors.orange[50]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang putih bersih
      appBar: AppBar(
        title: Text("Deskripsi Penyakit", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: primaryOrange,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header Dekoratif
          Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              color: primaryOrange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 20),
              itemCount: diseases.length,
              itemBuilder: (context, index) {
                final item = diseases[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey[200]!),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Theme(
                    // Menghilangkan garis divider bawaan ExpansionTile
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      iconColor: primaryOrange,
                      collapsedIconColor: Colors.grey,
                      leading: CircleAvatar(
                        backgroundColor: lightOrange,
                        child: Text(
                          item['kode']!,
                          style: TextStyle(
                            color: primaryOrange, 
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),
                        ),
                      ),
                      title: Text(
                        item['nama']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 16,
                          color: Colors.black87
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(color: Colors.grey[100], thickness: 1),
                              SizedBox(height: 10),
                              
                              // Sektor Definisi
                              _buildSectionTitle("DEFINISI"),
                              SizedBox(height: 6),
                              Text(
                                item['definisi']!,
                                style: TextStyle(
                                  fontSize: 14, 
                                  color: Colors.black87, 
                                  height: 1.5
                                ),
                              ),
                              
                              SizedBox(height: 18),
                              
                              // Sektor Saran
                              _buildSectionTitle("SARAN PENANGANAN"),
                              SizedBox(height: 6),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: lightOrange,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  item['saran']!,
                                  style: TextStyle(
                                    fontSize: 14, 
                                    color: Colors.orange[900], 
                                    height: 1.5
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget untuk judul bagian agar konsisten
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 11, 
        fontWeight: FontWeight.bold, 
        color: Colors.grey[600],
        letterSpacing: 1.1,
      ),
    );
  }
}