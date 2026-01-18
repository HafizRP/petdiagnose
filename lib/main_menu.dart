import 'package:flutter/material.dart';
import 'diagnosis_page.dart';
import 'diagnose_description.dart';
import 'contact_expert_page.dart';
import 'care_tips_page.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  final Color primaryOrange = Colors.orange[800]!;
  final Color accentOrange = Colors.orange[50]!;

  @override
  void initState() {
    super.initState();
    // Memicu animasi setelah frame pertama dirender
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 1. Animasi Header (Slide Down)
          AnimatedContainer(
            duration: Duration(milliseconds: 800),
            curve: Curves.easeOutBack,
            height: _isVisible ? 220 : 0, // Header muncul memanjang
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryOrange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: SingleChildScrollView(
              // Agar konten tidak error saat height 0
              child: Padding(
                padding: EdgeInsets.only(top: 60, left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Halo, Cat Lovers!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Pantau kesehatan kucing Anda dengan mudah dan cepat.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. Menu Buttons dengan Animasi Staggered (Manual)
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(24),
              children: [
                _buildAnimatedButton(
                  0,
                  "Mulai Konsultasi",
                  "Cek gejala dan diagnosa",
                  Icons.medical_services_rounded,
                  DiagnosisPage(),
                ),
                _buildAnimatedButton(
                  1,
                  "Deskripsi Penyakit",
                  "Pelajari jenis penyakit",
                  Icons.menu_book_rounded,
                  DiseaseListPage(),
                ),
                _buildAnimatedButton(
                  2,
                  "Hubungi Pakar",
                  "Konsultasi dokter hewan",
                  Icons.support_agent_rounded,
                  ContactExpertPage(),
                ),
                _buildAnimatedButton(
                  3,
                  "Tips Perawatan",
                  "Panduan merawat kucing",
                  Icons.lightbulb_rounded,
                  CareTipsPage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedButton(
    int index,
    String title,
    String subtitle,
    IconData icon,
    Widget? target,
  ) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: _isVisible ? 1 : 0,
      curve: Interval(
        0.2 * index,
        1.0,
        curve: Curves.easeInOut,
      ), // Muncul bergantian
      child: AnimatedPadding(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.only(top: _isVisible ? 0 : 50), // Efek slide up
        curve: Interval(0.2 * index, 1.0, curve: Curves.easeOut),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.1),
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => _handleNavigation(context, title, target),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: accentOrange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: primaryOrange, size: 28),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, color: Colors.grey[400]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleNavigation(BuildContext context, String title, Widget? target) {
    if (target != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => target));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Fitur $title segera hadir")));
    }
  }
}
