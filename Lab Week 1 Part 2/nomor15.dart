/*Sebuah proyek pembangunan rumah memiliki 6 tahap: A (Fondasi), B (Struktur), C
(Atap), D (Dinding), E (Instalasi Listrik), dan F (Finishing). Berikut adalah
ketergantungan antar tahap:
• A harus selesai sebelum B dan D dimulai
• B harus selesai sebelum C dimulai
• D harus selesai sebelum E dimulai
• C dan E harus selesai sebelum F dimulai
Tentukan urutan pengerjaan yang paling efisien!*/

void main() {
  Map<String, List<String>> ketergantungan = {
    'A': [],
    'B': ['A'],
    'C': ['B'],
    'D': ['A'],
    'E': ['D'],
    'F': ['C', 'E'],
  };

  List<String> urutan = [];
  List<String> daftarTahap = ['A', 'B', 'C', 'D', 'E', 'F'];

  while (daftarTahap.isNotEmpty) {
    String tahapSaatIni = daftarTahap.removeAt(0);

    bool bisaSelesai = ketergantungan[tahapSaatIni]!.every((dep) => urutan.contains(dep));

    if (bisaSelesai) {
      urutan.add(tahapSaatIni);
    } else {
      daftarTahap.add(tahapSaatIni);
    }
  }

  print("Urutan pengerjaan: ${urutan.join(' - ')}");
}
