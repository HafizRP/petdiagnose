import 'package:flutter/material.dart';

class UserGuidePage extends StatefulWidget {
  @override
  _UserGuidePageState createState() => _UserGuidePageState();
}

class _UserGuidePageState extends State<UserGuidePage>
    with SingleTickerProviderStateMixin {
  final Color primaryOrange = Colors.orange[800]!;
  final Color accentOrange = Colors.orange[50]!;
  late TabController _tabController;

  final List<GuideSection> _sections = [
    GuideSection(
      title: "Mulai Konsultasi",
      icon: Icons.medical_services_rounded,
      color: Color(0xFFFF6B6B),
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
      color: Color(0xFF4ECDC4),
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
          title: "Cari atau Pilih Penyakit",
          description:
              "Gunakan search bar untuk mencari penyakit tertentu, atau scroll untuk melihat semua penyakit yang tersedia.",
          icon: Icons.search_rounded,
        ),
        GuideStep(
          stepNumber: 3,
          title: "Pelajari Detail",
          description:
              "Tap pada card penyakit untuk melihat informasi lengkap tentang definisi, gejala terkait, dan cara penanganan.",
          icon: Icons.info_rounded,
        ),
      ],
    ),
    GuideSection(
      title: "Hubungi Pakar",
      icon: Icons.support_agent_rounded,
      color: Color(0xFF95E1D3),
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
      color: Color(0xFFFECA57),
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
  void initState() {
    super.initState();
    _tabController = TabController(length: _sections.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            color: primaryOrange,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.6),
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
              tabs: _sections.map((section) {
                return Tab(
                  icon: Icon(section.icon, size: 22),
                  text: section.title,
                );
              }).toList(),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _sections.map((section) {
          return _buildSectionContent(section);
        }).toList(),
      ),
    );
  }

  Widget _buildSectionContent(GuideSection section) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header Card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  section.color.withOpacity(0.15),
                  section.color.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: section.color.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: section.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(section.icon, color: section.color, size: 32),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${section.steps.length} langkah mudah',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          // Steps
          ...section.steps.asMap().entries.map((entry) {
            final step = entry.value;
            final isLast = entry.key == section.steps.length - 1;
            return _buildStepCard(step, section.color, isLast);
          }).toList(),

          SizedBox(height: 16),

          // Bottom tip
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue[200]!, width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.tips_and_updates_rounded,
                  color: Colors.blue[700],
                  size: 22,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Tips: Gunakan fitur ini secara berkala untuk memantau kesehatan kucing Anda!',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue[900],
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildStepCard(GuideStep step, Color color, bool isLast) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step number indicator with connecting line
          Column(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
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
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 50,
                  margin: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [color, color.withOpacity(0.3)],
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 12),

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
                    color: Colors.grey.withOpacity(0.08),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(step.icon, color: color, size: 20),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          step.title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    step.description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      height: 1.5,
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
  final Color color;
  final List<GuideStep> steps;

  GuideSection({
    required this.title,
    required this.icon,
    required this.color,
    required this.steps,
  });
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
