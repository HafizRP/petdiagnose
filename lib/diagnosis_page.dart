import 'package:flutter/material.dart';
import 'db/diagnose.dart'; // Pastikan file ini berisi symptoms dan diseaseDetails

class DiagnosisPage extends StatefulWidget {
  @override
  _DiagnosisPageState createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  final Color primaryOrange = Colors.orange[800]!;

  // State untuk kuesioner
  int currentQuestionIndex = 0;
  Set<String> selectedSymptoms = {};
  bool isFinished = false;
  bool isAnalyzing = false;

  // Hasil Diagnosa
  String diagnosisResult = "";
  Map<String, dynamic> diagnosisAdvice = {};

  void nextQuestion(String code, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedSymptoms.add(code);
      } else {
        selectedSymptoms.remove(code);
      }

      if (currentQuestionIndex < symptoms.length - 1) {
        currentQuestionIndex++;
      } else {
        isFinished = true;
        processDiagnosis();
      }
    });
  }

  void resetQuis() {
    setState(() {
      currentQuestionIndex = 0;
      selectedSymptoms.clear();
      isFinished = false;
      diagnosisResult = "";
    });
  }

  void processDiagnosis() async {
    setState(() => isAnalyzing = true);
    await Future.delayed(Duration(seconds: 2)); // Efek loading simulasi AI

    setState(() {
      isAnalyzing = false;
      List<String> results = [];
      List<String> combinedDefinisi = [];
      List<String> combinedSaran = [];

      // Logic Forward Chaining (Tetap sama dengan sebelumnya)
      if (selectedSymptoms.containsAll(['G1', 'G2', 'G3', 'G4']))
        results.add("Scabies (P1)");
      if (selectedSymptoms.containsAll(['G5', 'G6', 'G7', 'G8']))
        results.add("Otitis (P2)");
      if (selectedSymptoms.containsAll([
        'G9',
        'G10',
        'G11',
        'G12',
        'G17',
        'G19',
      ]))
        results.add("Cacingan (P3)");
      if (selectedSymptoms.containsAll(['G1', 'G13', 'G14']))
        results.add("Ringworm (P4)");
      if (selectedSymptoms.containsAll(['G15', 'G16', 'G18', 'G19']))
        results.add("Rabies (P5)");

      if (results.isNotEmpty) {
        diagnosisResult =
            "Terdeteksi ${results.length} Kemungkinan:\n" + results.join(", ");
        for (String res in results) {
          String diseaseKey = res.split(" (").first;
          if (diseaseDetails.containsKey(diseaseKey)) {
            combinedDefinisi.add(
              "• $diseaseKey: ${diseaseDetails[diseaseKey]!['definisi']}",
            );
            combinedSaran.add(
              "• $diseaseKey: ${diseaseDetails[diseaseKey]!['saran']}",
            );
          }
        }
        diagnosisAdvice = {
          "definisi": combinedDefinisi.join("\n\n"),
          "saran": combinedSaran.join("\n\n"),
        };
      } else {
        diagnosisResult = "Penyakit tidak dikenali.";
        diagnosisAdvice = {
          "definisi": "Gejala tidak memenuhi kriteria sistem pakar.",
          "saran": "Segera bawa kucing Anda ke dokter hewan terdekat.",
        };
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(
          "Kuesioner Kesehatan Kucing",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildProgressBar(),
          Expanded(
            child: isFinished ? _buildResultScreen() : _buildQuestionScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    double progress = (currentQuestionIndex + 1) / symptoms.length;
    return Column(
      children: [
        LinearProgressIndicator(
          value: isFinished ? 1.0 : progress,
          backgroundColor: Colors.orange[100],
          color: primaryOrange,
          minHeight: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            isFinished
                ? "Analisis Selesai"
                : "Pertanyaan ${currentQuestionIndex + 1} dari ${symptoms.length}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionScreen() {
    String code = symptoms.keys.elementAt(currentQuestionIndex);
    String question = symptoms[code]!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets, size: 80, color: primaryOrange.withOpacity(0.2)),
            SizedBox(height: 30),
            Text(
              "Apakah kucing Anda mengalami:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Text(
              question,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: _buildAnswerButton(
                    "TIDAK",
                    Colors.red[400]!,
                    () => nextQuestion(code, false),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildAnswerButton(
                    "YA",
                    Colors.green[500]!,
                    () => nextQuestion(code, true),
                  ),
                ),
              ],
            ),
            if (currentQuestionIndex > 0)
              TextButton(
                onPressed: () => setState(() => currentQuestionIndex--),
                child: Text(
                  "Kembali ke pertanyaan sebelumnya",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    if (isAnalyzing) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: primaryOrange),
            SizedBox(height: 20),
            Text(
              "Menganalisis Gejala...",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HASIL DIAGNOSA",
                  style: TextStyle(
                    color: primaryOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                Text(
                  diagnosisResult,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[700],
                  ),
                ),
                SizedBox(height: 20),
                _buildInfoSection("DEFINISI", diagnosisAdvice["definisi"]),
                SizedBox(height: 20),
                _buildInfoSection("SARAN PENANGANAN", diagnosisAdvice["saran"]),
              ],
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: resetQuis,
            icon: Icon(Icons.refresh),
            label: Text("MULAI ULANG KONSULTASI"),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryOrange,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 5),
        Text(content, style: TextStyle(fontSize: 14, height: 1.5)),
      ],
    );
  }
}
