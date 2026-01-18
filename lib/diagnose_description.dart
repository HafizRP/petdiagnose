import 'package:flutter/material.dart';
import 'db/diagnose.dart';

class DiseaseListPage extends StatefulWidget {
  @override
  _DiseaseListPageState createState() => _DiseaseListPageState();
}

class _DiseaseListPageState extends State<DiseaseListPage> {
  final Color primaryOrange = Colors.orange[800]!;
  final Color lightOrange = Colors.orange[50]!;

  String _searchQuery = '';
  int? _expandedIndex;

  // Data tambahan untuk setiap penyakit
  final Map<String, DiseaseInfo> _diseaseExtras = {
    'Scabies': DiseaseInfo(
      icon: Icons.bug_report_rounded,
      severity: 'Sedang',
      severityColor: Colors.orange,
      contagious: true,
      symptoms: ['G1', 'G3', 'G13'],
      color: Color(0xFFFF6B6B),
    ),
    'Otitis': DiseaseInfo(
      icon: Icons.hearing_rounded,
      severity: 'Ringan-Sedang',
      severityColor: Colors.amber,
      contagious: false,
      symptoms: ['G2', 'G4', 'G5', 'G6', 'G7', 'G8'],
      color: Color(0xFF4ECDC4),
    ),
    'Cacingan': DiseaseInfo(
      icon: Icons.coronavirus_rounded,
      severity: 'Sedang',
      severityColor: Colors.orange,
      contagious: true,
      symptoms: ['G9', 'G10', 'G11', 'G16', 'G18'],
      color: Color(0xFF95E1D3),
    ),
    'Ringworm': DiseaseInfo(
      icon: Icons.circle_outlined,
      severity: 'Sedang',
      severityColor: Colors.orange,
      contagious: true,
      symptoms: ['G12', 'G13', 'G1'],
      color: Color(0xFFFECA57),
    ),
    'Rabies': DiseaseInfo(
      icon: Icons.warning_rounded,
      severity: 'Sangat Berbahaya',
      severityColor: Colors.red,
      contagious: true,
      symptoms: ['G14', 'G15', 'G16', 'G17', 'G18'],
      color: Color(0xFFEE5A6F),
    ),
  };

  List<Map<String, String>> get _filteredDiseases {
    if (_searchQuery.isEmpty) {
      return diseases;
    }
    return diseases.where((disease) {
      return disease['nama']!.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          disease['definisi']!.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // Modern App Bar with gradient
          SliverAppBar(
            expandedHeight: 180,
            floating: false,
            pinned: true,
            backgroundColor: primaryOrange,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Deskripsi Penyakit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [primaryOrange, Colors.orange[600]!],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -30,
                      top: -30,
                      child: Icon(
                        Icons.medical_information_rounded,
                        size: 150,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Search Bar
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                    _expandedIndex =
                        null; // Reset expanded state when searching
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Cari penyakit...',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon: Icon(Icons.search, color: primaryOrange),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear, color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ),

          // Info Banner
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[50]!, Colors.blue[100]!],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue[200]!, width: 1),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue[700], size: 24),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Ditemukan ${_filteredDiseases.length} penyakit. Tap untuk detail lengkap.',
                      style: TextStyle(fontSize: 13, color: Colors.blue[900]),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Disease List
          _filteredDiseases.isEmpty
              ? SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 80,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Tidak ada penyakit ditemukan',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SliverPadding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 24),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final disease = _filteredDiseases[index];
                      final extras = _diseaseExtras[disease['nama']]!;
                      final isExpanded = _expandedIndex == index;

                      return _buildDiseaseCard(
                        disease,
                        extras,
                        index,
                        isExpanded,
                      );
                    }, childCount: _filteredDiseases.length),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildDiseaseCard(
    Map<String, String> disease,
    DiseaseInfo extras,
    int index,
    bool isExpanded,
  ) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: extras.color.withOpacity(0.2),
            blurRadius: isExpanded ? 20 : 10,
            offset: Offset(0, isExpanded ? 8 : 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            // Header Card
            InkWell(
              onTap: () {
                setState(() {
                  _expandedIndex = isExpanded ? null : index;
                });
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      extras.color.withOpacity(0.1),
                      extras.color.withOpacity(0.05),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    // Icon Container
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: extras.color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(extras.icon, color: extras.color, size: 32),
                    ),
                    SizedBox(width: 16),

                    // Disease Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: extras.color,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  disease['kode']!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              if (extras.contagious)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red[50],
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: Colors.red[200]!,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        size: 12,
                                        color: Colors.red[700],
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Menular',
                                        style: TextStyle(
                                          color: Colors.red[700],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            disease['nama']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.local_hospital_rounded,
                                size: 14,
                                color: extras.severityColor,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Tingkat: ${extras.severity}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: extras.severityColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Expand Icon
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: Duration(milliseconds: 300),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: extras.color,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Expanded Content
            AnimatedCrossFade(
              firstChild: SizedBox.shrink(),
              secondChild: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.grey[200], thickness: 1),
                    SizedBox(height: 16),

                    // Definisi
                    _buildSectionHeader(
                      'DEFINISI',
                      Icons.description_rounded,
                      extras.color,
                    ),
                    SizedBox(height: 10),
                    Text(
                      disease['definisi']!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.6,
                      ),
                    ),

                    SizedBox(height: 20),

                    // Gejala Terkait
                    _buildSectionHeader(
                      'GEJALA TERKAIT',
                      Icons.checklist_rounded,
                      extras.color,
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: extras.symptoms.map((symptomCode) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: extras.color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: extras.color.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 14,
                                color: extras.color,
                              ),
                              SizedBox(width: 6),
                              Flexible(
                                child: Text(
                                  symptoms[symptomCode] ?? symptomCode,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 20),

                    // Saran Penanganan
                    _buildSectionHeader(
                      'SARAN PENANGANAN',
                      Icons.medical_services_rounded,
                      extras.color,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            extras.color.withOpacity(0.1),
                            extras.color.withOpacity(0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: extras.color.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.lightbulb_rounded,
                            color: extras.color,
                            size: 20,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              disease['saran']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[800],
                                height: 1.6,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    // Warning Footer
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.amber[200]!, width: 1),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.amber[800],
                            size: 18,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Konsultasikan dengan dokter hewan untuk diagnosis yang akurat',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.amber[900],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

// Model class untuk informasi tambahan penyakit
class DiseaseInfo {
  final IconData icon;
  final String severity;
  final Color severityColor;
  final bool contagious;
  final List<String> symptoms;
  final Color color;

  DiseaseInfo({
    required this.icon,
    required this.severity,
    required this.severityColor,
    required this.contagious,
    required this.symptoms,
    required this.color,
  });
}
