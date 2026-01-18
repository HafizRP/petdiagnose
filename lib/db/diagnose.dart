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

final Map<String, Map<String, String>> diseaseDetails = {
  "Scabies": {
    "definisi":
        "Penyakit kulit yang disebabkan oleh tungau Sarcoptes scabiei. Sangat menular ke hewan lain.",
    "saran":
        "Mandikan dengan sampo antijamur/antiseptik, berikan obat tetes tengkuk (spot-on), dan jauhkan dari kucing lain.",
  },
  "Otitis": {
    "definisi":
        "Peradangan pada saluran telinga kucing, biasanya karena infeksi bakteri, jamur, atau tungau telinga (ear mites).",
    "saran":
        "Bersihkan telinga dengan cairan pembersih khusus kucing dan berikan tetes telinga sesuai resep dokter hewan.",
  },
  "Cacingan": {
    "definisi":
        "Infeksi parasit cacing di dalam pencernaan yang menyerap nutrisi dari tubuh kucing.",
    "saran":
        "Berikan obat cacing secara rutin (biasanya 3 bulan sekali) dan jaga kebersihan kotak pasir (litter box).",
  },
  "Ringworm": {
    "definisi":
        "Infeksi jamur pada kulit yang membentuk lingkaran merah (bulu rontok melingkar). Bisa menular ke manusia.",
    "saran":
        "Oleskan salep antijamur, berikan vitamin kulit, dan jaga lingkungan agar tidak lembap.",
  },
  "Rabies": {
    "definisi":
        "Penyakit virus fatal yang menyerang sistem saraf pusat. Sangat berbahaya dan menular ke manusia melalui gigitan.",
    "saran":
        "Segera isolasi kucing dan hubungi dokter hewan atau dinas peternakan setempat. Rabies tidak dapat diobati secara mandiri.",
  },
};


final List<Map<String, String>> diseases = [
    {
      "kode": "P1",
      "nama": "Scabies",
      "definisi": "Penyakit kulit yang disebabkan oleh tungau Sarcoptes scabiei. Sangat menular ke hewan lain.",
      "saran": "Mandikan dengan sampo antijamur/antiseptik, berikan obat tetes tengkuk (spot-on), dan jauhkan dari kucing lain."
    },
    {
      "kode": "P2",
      "nama": "Otitis",
      "definisi": "Peradangan pada saluran telinga kucing, biasanya karena infeksi bakteri, jamur, atau tungau telinga (ear mites).",
      "saran": "Bersihkan telinga dengan cairan pembersih khusus kucing dan berikan tetes telinga sesuai resep dokter hewan."
    },
    {
      "kode": "P3",
      "nama": "Cacingan",
      "definisi": "Infeksi parasit cacing di dalam pencernaan yang menyerap nutrisi dari tubuh kucing.",
      "saran": "Berikan obat cacing secara rutin (biasanya 3 bulan sekali) dan jaga kebersihan kotak pasir (litter box)."
    },
    {
      "kode": "P4",
      "nama": "Ringworm",
      "definisi": "Infeksi jamur pada kulit yang membentuk lingkaran merah (bulu rontok melingkar). Bisa menular ke manusia.",
      "saran": "Oleskan salep antijamur, berikan vitamin kulit, dan jaga lingkungan agar tidak lembap."
    },
    {
      "kode": "P5",
      "nama": "Rabies",
      "definisi": "Penyakit virus fatal yang menyerang sistem saraf pusat. Sangat berbahaya dan menular ke manusia melalui gigitan.",
      "saran": "Segera isolasi kucing dan hubungi dokter hewan atau dinas peternakan setempat. Rabies tidak dapat diobati secara mandiri."
    },
  ];