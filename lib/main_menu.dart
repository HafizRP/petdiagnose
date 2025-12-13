import 'package:flutter/material.dart';
import 'diagnosis_page.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu Utama")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _menuButton(context, "Mulai Konsultasi", Icons.search, DiagnosisPage()),
            _menuButton(context, "Deskripsi Kucing & Penyakit", Icons.book, null),
            _menuButton(context, "Hubungi Pakar", Icons.person, null),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(BuildContext context, String title, IconData icon, Widget? target) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {
          if (target != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => target));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Fitur $title segera hadir")));
          }
        },
      ),
    );
  }
}