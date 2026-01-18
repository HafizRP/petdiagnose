import 'package:flutter/material.dart';
import 'diagnosis_page.dart';
import 'diagnose_description.dart';
import 'contact_expert_page.dart';
import 'care_tips_page.dart';
import 'user_guide_page.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  final Color primaryOrange = Colors.orange[800]!;
  final Color accentOrange = Colors.orange[50]!;
  AnimationController? _pulseController;

  @override
  void initState() {
    super.initState();

    // Pulse animation for FAB
    _pulseController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    // Trigger entrance animations
    Future.delayed(Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _pulseController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // Modern Header with Gradient
              SliverAppBar(
                expandedHeight: 280,
                floating: false,
                pinned: true,
                backgroundColor: primaryOrange,
                flexibleSpace: FlexibleSpaceBar(background: _buildHeader()),
              ),

              // Quick Stats Section
              SliverToBoxAdapter(child: _buildQuickStats()),

              // Featured Action Card
              SliverToBoxAdapter(child: _buildFeaturedCard()),

              // Main Menu Grid
              SliverPadding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 100),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  delegate: SliverChildListDelegate([
                    _buildGridMenuItem(
                      0,
                      "Deskripsi\nPenyakit",
                      Icons.menu_book_rounded,
                      DiseaseListPage(),
                      Color(0xFF4ECDC4),
                    ),
                    _buildGridMenuItem(
                      1,
                      "Hubungi\nPakar",
                      Icons.support_agent_rounded,
                      ContactExpertPage(),
                      Color(0xFF95E1D3),
                    ),
                    _buildGridMenuItem(
                      2,
                      "Tips\nPerawatan",
                      Icons.lightbulb_rounded,
                      CareTipsPage(),
                      Color(0xFFFECA57),
                    ),
                    _buildGridMenuItem(
                      3,
                      "Panduan\nPenggunaan",
                      Icons.help_outline_rounded,
                      UserGuidePage(),
                      Color(0xFFFF6B6B),
                    ),
                  ]),
                ),
              ),
            ],
          ),

          // Floating Action Button for Quick Diagnosis
          Positioned(
            bottom: 24,
            right: 24,
            child: _buildFloatingDiagnosisButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryOrange, Colors.orange[600]!, Colors.orange[500]!],
        ),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            right: -50,
            top: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            left: -30,
            bottom: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),

          // Cat paw prints decoration
          Positioned(
            right: 40,
            top: 100,
            child: Icon(
              Icons.pets,
              size: 60,
              color: Colors.white.withOpacity(0.15),
            ),
          ),
          Positioned(
            left: 50,
            bottom: 80,
            child: Icon(
              Icons.pets,
              size: 40,
              color: Colors.white.withOpacity(0.15),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 800),
                    opacity: _isVisible ? 1 : 0,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.pets,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Halo, Cat Lovers! 🐱",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Sistem Pakar Diagnosa Penyakit Kucing",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.95),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 1000),
                    opacity: _isVisible ? 1 : 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Pantau kesehatan kucing Anda dengan mudah dan cepat",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildQuickStats() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 800),
      opacity: _isVisible ? 1 : 0,
      child: Container(
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: _buildStatCard(
                "5",
                "Penyakit",
                Icons.medical_information_rounded,
                Color(0xFF4ECDC4),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                "19",
                "Gejala",
                Icons.checklist_rounded,
                Color(0xFFFECA57),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                "24/7",
                "Akses",
                Icons.access_time_rounded,
                Color(0xFF95E1D3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String value,
    String label,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildFeaturedCard() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      opacity: _isVisible ? 1 : 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [primaryOrange, Colors.orange[600]!],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: primaryOrange.withOpacity(0.4),
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () =>
                _handleNavigation(context, "Mulai Konsultasi", DiagnosisPage()),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.medical_services_rounded,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mulai Konsultasi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Cek gejala dan dapatkan diagnosa",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridMenuItem(
    int index,
    String title,
    IconData icon,
    Widget? target,
    Color color,
  ) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: _isVisible ? 1 : 0,
      curve: Interval(0.1 * index, 1.0, curve: Curves.easeInOut),
      child: AnimatedPadding(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.only(top: _isVisible ? 0 : 30),
        curve: Interval(0.1 * index, 1.0, curve: Curves.easeOut),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 15,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => _handleNavigation(context, title, target),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            color.withOpacity(0.2),
                            color.withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(icon, color: color, size: 40),
                    ),
                    SizedBox(height: 16),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey[800],
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingDiagnosisButton() {
    return AnimatedBuilder(
      animation:
          _pulseController ??
          AnimationController(vsync: this, duration: Duration.zero),
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 + ((_pulseController?.value ?? 0) * 0.1),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: primaryOrange.withOpacity(0.4),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: FloatingActionButton.extended(
              onPressed: () => _handleNavigation(
                context,
                "Mulai Konsultasi",
                DiagnosisPage(),
              ),
              backgroundColor: primaryOrange,
              elevation: 0,
              icon: Icon(Icons.medical_services_rounded, color: Colors.white),
              label: Text(
                'Diagnosa',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleNavigation(BuildContext context, String title, Widget? target) {
    if (target != null) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => target,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Fitur $title segera hadir"),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }
}
