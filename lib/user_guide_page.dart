import 'package:flutter/material.dart';

class UserGuidePage extends StatefulWidget {
  @override
  _UserGuidePageState createState() => _UserGuidePageState();
}

class _UserGuidePageState extends State<UserGuidePage> {
  final Color primaryOrange = Colors.orange[800]!;
  final Color accentOrange = Colors.orange[50]!;
  int _selectedSection = 0;

  final List<GuideSection> _sections = [
    GuideSection(
      title: "Mulai Konsultasi",
      icon: Icons.medical_services_rounded,
      steps: [
        GuideStep(
          stepNumber: 1,
          title: "Pilih Menu Konsultasi",
          description:
              "Dari halaman utama, tap tombol 'Mulai Konsultasi' untuk memulai proses diagnosa.",
          icon: Icons.touch_app_rounded,
        ),
        GuideStep(
          stepNumber: 2,
          title: "Jawab Pertanyaan",
          description:
              "Sistem akan menanyakan gejala-gejala yang dialami kucing Anda. Jawab dengan jujur dan teliti untuk hasil yang akurat.",
          icon: Icons.question_answer_rounded,
        ),
        GuideStep(
          stepNumber: 3,
          title: "Lihat Hasil Diagnosa",
          description:
              "Setelah menjawab semua pertanyaan, sistem akan memberikan hasil diagnosa penyakit beserta tingkat kepercayaan.",
          icon: Icons.assignment_turned_in_rounded,
        ),
        GuideStep(
          stepNumber: 4,
          title: "Ikuti Saran Perawatan",
          description:
              "Baca dengan seksama saran perawatan yang diberikan dan konsultasikan dengan dokter hewan jika diperlukan.",
          icon: Icons.health_and_safety_rounded,
        ),
      ],
    ),
    GuideSection(
      title: "Deskripsi Penyakit",
      icon: Icons.menu_book_rounded,
      steps: [
        GuideStep(
          stepNumber: 1,
          title: "Akses Daftar Penyakit",
          description:
              "Tap menu 'Deskripsi Penyakit' untuk melihat daftar lengkap penyakit kucing yang ada dalam sistem.",
          icon: Icons.list_alt_rounded,
        ),
        GuideStep(
          stepNumber: 2,
          title: "Pilih Penyakit",
          description:
              "Pilih penyakit yang ingin Anda pelajari untuk melihat informasi detail.",
          icon: Icons.search_rounded,
        ),
        GuideStep(
          stepNumber: 3,
          title: "Pelajari Detail",
          description:
              "Baca informasi lengkap tentang gejala, penyebab, dan cara penanganan penyakit tersebut.",
          icon: Icons.info_rounded,
        ),
      ],
    ),
    GuideSection(
      title: "Hubungi Pakar",
      icon: Icons.support_agent_rounded,
      steps: [
        GuideStep(
          stepNumber: 1,
          title: "Buka Menu Pakar",
          description:
              "Tap 'Hubungi Pakar' untuk melihat daftar dokter hewan dan klinik yang tersedia.",
          icon: Icons.contact_page_rounded,
        ),
        GuideStep(
          stepNumber: 2,
          title: "Pilih Kontak",
          description:
              "Pilih dokter hewan atau klinik yang ingin Anda hubungi berdasarkan lokasi dan ketersediaan.",
          icon: Icons.phone_in_talk_rounded,
        ),
        GuideStep(
          stepNumber: 3,
          title: "Hubungi Langsung",
          description:
              "Gunakan informasi kontak yang tersedia untuk menghubungi pakar secara langsung.",
          icon: Icons.call_rounded,
        ),
      ],
    ),
    GuideSection(
      title: "Tips Perawatan",
      icon: Icons.lightbulb_rounded,
      steps: [
        GuideStep(
          stepNumber: 1,
          title: "Jelajahi Tips",
          description:
              "Buka menu 'Tips Perawatan' untuk melihat berbagai panduan merawat kucing yang sehat.",
          icon: Icons.explore_rounded,
        ),
        GuideStep(
          stepNumber: 2,
          title: "Pilih Kategori",
          description:
              "Pilih kategori tips yang sesuai dengan kebutuhan Anda, seperti nutrisi, grooming, atau kesehatan umum.",
          icon: Icons.category_rounded,
        ),
        GuideStep(
          stepNumber: 3,
          title: "Terapkan Tips",
          description:
              "Baca dan terapkan tips yang diberikan untuk menjaga kesehatan dan kebahagiaan kucing Anda.",
          icon: Icons.check_circle_rounded,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryOrange,
        elevation: 0,
        title: Text(
          'Panduan Penggunaan',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Row(
        children: [
          // Sidebar untuk memilih section
          Container(
            width: 120,
            decoration: BoxDecoration(
              color: accentOrange,
              border: Border(
                right: BorderSide(color: Colors.orange[200]!, width: 1),
              ),
            ),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16),
              itemCount: _sections.length,
              itemBuilder: (context, index) {
                final section = _sections[index];
                final isSelected = _selectedSection == index;
                return _buildSidebarItem(section, index, isSelected);
              },
            ),
          ),

          // Content area
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _buildSectionContent(_sections[_selectedSection]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(GuideSection section, int index, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSection = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? primaryOrange : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(
              section.icon,
              color: isSelected ? Colors.white : primaryOrange,
              size: 28,
            ),
            SizedBox(height: 8),
            Text(
              section.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionContent(GuideSection section) {
    return SingleChildScrollView(
      key: ValueKey(_selectedSection),
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: accentOrange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(section.icon, color: primaryOrange, size: 32),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Panduan langkah demi langkah',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 32),

          // Steps
          ...section.steps.asMap().entries.map((entry) {
            final step = entry.value;
            final isLast = entry.key == section.steps.length - 1;
            return _buildStepCard(step, isLast);
          }).toList(),

          // Bottom tip
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue[200]!, width: 1),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.tips_and_updates_rounded,
                  color: Colors.blue[700],
                  size: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Tips: Gunakan fitur ini secara berkala untuk memantau kesehatan kucing Anda!',
                    style: TextStyle(fontSize: 13, color: Colors.blue[900]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard(GuideStep step, bool isLast) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step number indicator
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: primaryOrange,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryOrange.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '${step.stepNumber}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 60,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [primaryOrange, primaryOrange.withOpacity(0.3)],
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 16),

          // Step content
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: accentOrange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(step.icon, color: primaryOrange, size: 24),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          step.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Model classes
class GuideSection {
  final String title;
  final IconData icon;
  final List<GuideStep> steps;

  GuideSection({required this.title, required this.icon, required this.steps});
}

class GuideStep {
  final int stepNumber;
  final String title;
  final String description;
  final IconData icon;

  GuideStep({
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.icon,
  });
}
