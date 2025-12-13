import 'package:flutter/material.dart';

class DiagnosisPage extends StatefulWidget {
  @override
  _DiagnosisPageState createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  final Map<String, String> symptoms = {
    'G1': 'Bulu rontok hingga botak',
    'G2': 'Kerak disekitar telinga',
    'G3': 'Kulit Bersisi',
    'G4': 'Gatal disekitar telinga',
    'G5': 'Sering menggelengkan kepala',
    'G6': 'Menggaruk telinga hingga luka',
    'G7': 'Cairan ditelinga berbau tak sedap',
    'G8': 'Kepala miring tidak bisa berjalan lurus',
    'G9': 'Kurus tapi perut buncit',
    'G10': 'Diare',
    'G11': 'Ada cacing pada kotoran atau saat muntah',
    'G12': 'Kebotakan berbentuk lingkaran',
    'G13': 'Sering menggaruk badan',
    'G14': 'Agresif',
    'G15': 'Sensitif',
    'G16': 'Tidak nafsu makan',
    'G17': 'Gelisah',
    'G18': 'Badan lemah',
    'G19': 'Gejala Tambahan (G19)',
  };

  Set<String> selectedSymptoms = {};
  String diagnosisResult = "";

  void processDiagnosis() {
    setState(() {
      if (selectedSymptoms.containsAll(['G1', 'G2', 'G3', 'G4'])) {
        diagnosisResult = "Hasil: Scabies (P1)";
      } else if (selectedSymptoms.containsAll(['G5', 'G6', 'G7', 'G8'])) {
        diagnosisResult = "Hasil: Otitis (P2)";
      } else if (selectedSymptoms.containsAll(['G9', 'G10', 'G11', 'G12', 'G17', 'G19'])) {
        diagnosisResult = "Hasil: Cacingan (P3)";
      } else if (selectedSymptoms.containsAll(['G1', 'G13', 'G14'])) {
        diagnosisResult = "Hasil: Ringworm (P4)";
      } else if (selectedSymptoms.containsAll(['G15', 'G16', 'G18', 'G19'])) {
        diagnosisResult = "Hasil: Rabies (P5)";
      } else {
        diagnosisResult = "Penyakit tidak dikenali. Mohon pilih gejala lain.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konsultasi Penyakit")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Pilih gejala yang tampak pada kucing Anda:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView(
              children: symptoms.keys.map((code) {
                return CheckboxListTile(
                  title: Text(symptoms[code]!),
                  subtitle: Text(code),
                  value: selectedSymptoms.contains(code),
                  onChanged: (val) {
                    setState(() {
                      val! ? selectedSymptoms.add(code) : selectedSymptoms.remove(code);
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: processDiagnosis,
                  child: Text("Diagnosa Sekarang"),
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
                ),
                if (diagnosisResult.isNotEmpty) ...[
                  SizedBox(height: 15),
                  Text(
                    diagnosisResult,
                    style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}