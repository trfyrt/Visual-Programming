/*Bayangkan Anda memiliki 5 tugas dengan prioritas yang berbeda-beda: Tugas A harus
diselesaikan sebelum Tugas B, Tugas C harus selesai setelah Tugas A dan B, tetapi
sebelum Tugas D. Tugas E bisa diselesaikan kapan saja. Tentukan urutan yang tepat
untuk menyelesaikan semua tugas tersebut agar efisien!*/

void main() {
  Map<String, List<String>> ketergantungan = {
    'A': [],        
    'B': ['A'],     
    'C': ['A', 'B'], 
    'D': ['C'],     
    'E': []         
  };

  List<String> urutan = [];
  List<String> daftarTugas = ['A', 'B', 'C', 'D', 'E']; 

  while (daftarTugas.isNotEmpty) {
    String tugasSaatIni = daftarTugas.removeAt(0);

    bool bisaSelesai = ketergantungan[tugasSaatIni]!.every((dep) => urutan.contains(dep));

    if (bisaSelesai || tugasSaatIni == 'E') {
      urutan.add(tugasSaatIni);
    } else {
      daftarTugas.add(tugasSaatIni);
    }
  }

  print("Urutan tugas: ${urutan.join(' - ')}");
}
