// Kelas Location untuk menyimpan lokasi dan tetangganya beserta jaraknya
class Location {
  String name;  // Nama lokasi
  Map<String, int> neighbors;  // Tetangga dari lokasi beserta jaraknya

  // Konstruktor untuk inisialisasi nama dan tetangga
  Location(this.name, this.neighbors);
}

// Kelas MapGraph untuk menyimpan graf dan fungsi-fungsi terkait TSP
class MapGraph {
  Map<String, Location> locations = {};  // Peta untuk menyimpan semua lokasi

  // Fungsi untuk menambahkan lokasi baru ke dalam graf
  void addLocation(Location location) {
    locations[location.name] = location;
  }

  // Fungsi untuk menghitung total jarak dari jalur yang diberikan
  int calculatePathDistance(List<String> path) {
    int totalDistance = 0;

    // Menghitung jarak antara dua lokasi berturut-turut dalam jalur
    for (int i = 0; i < path.length - 1; i++) {
      String current = path[i];  // Lokasi saat ini
      String next = path[i + 1];  // Lokasi berikutnya
      totalDistance += locations[current]!.neighbors[next]!;  // Menambahkan jarak antara dua lokasi
    }

    // Menambahkan jarak dari lokasi terakhir kembali ke lokasi awal (untuk melengkapi siklus)
    totalDistance += locations[path.last]!.neighbors[path.first]!;
    return totalDistance;
  }

  // Fungsi untuk menghasilkan semua permutasi dari daftar lokasi yang diberikan
  List<List<String>> permute(List<String> nodes) {
    // Basis rekursif: jika hanya ada satu node, kembalikan node itu
    if (nodes.length == 1) {
      return [nodes];
    }

    List<List<String>> permutations = [];  // Menyimpan semua permutasi

    // Untuk setiap node dalam daftar, ambil node pertama dan permutasikan sisanya
    for (int i = 0; i < nodes.length; i++) {
      List<String> remaining = List.from(nodes);  // Salin daftar node
      String first = remaining.removeAt(i);  // Ambil node pertama
      List<List<String>> subPermutations = permute(remaining);  // Permutasikan node yang tersisa

      // Gabungkan node pertama dengan semua permutasi dari node yang tersisa
      for (List<String> subPermutation in subPermutations) {
        permutations.add([first] + subPermutation);
      }
    }
    return permutations;  // Kembalikan semua permutasi
  }

  // Fungsi untuk menyelesaikan masalah TSP
  List<String> solveTSP(String start) {
    // Ambil semua lokasi kecuali lokasi awal
    List<String> nodes = locations.keys.where((node) => node != start).toList();

    // Buat semua permutasi dari lokasi-lokasi yang akan dikunjungi
    List<List<String>> permutations = permute(nodes);

    int minDistance = 999999;  // Inisialisasi jarak minimum dengan nilai besar
    List<String> bestPath = [];  // Menyimpan jalur terbaik (dengan jarak terpendek)

    // Periksa setiap permutasi untuk menemukan jalur terpendek
    for (var permutation in permutations) {
      List<String> path = [start] + permutation;  // Tambahkan lokasi awal di depan jalur
      int distance = calculatePathDistance(path);  // Hitung total jarak jalur

      // Jika jarak jalur ini lebih kecil dari jarak minimum, perbarui jalur terbaik
      if (distance < minDistance) {
        minDistance = distance;
        bestPath = path;
      }
    }

    bestPath.add(start);  // Tambahkan lokasi awal di akhir jalur (kembali ke awal)
    print('Minimum distance: $minDistance');  // Cetak jarak minimum
    return bestPath;  // Kembalikan jalur terbaik
  }
}

// Fungsi utama untuk menjalankan program
void main() {
  var mapGraph = MapGraph();  // Membuat objek MapGraph

  // Menambahkan lokasi-lokasi ke graf beserta tetangganya dan jaraknya
  mapGraph.addLocation(Location('A', {'B': 8, 'C': 3, 'D': 4, 'E': 10}));
  mapGraph.addLocation(Location('B', {'A': 8, 'C': 5, 'D': 2, 'E': 7}));
  mapGraph.addLocation(Location('C', {'A': 3, 'B': 5, 'D': 1, 'E': 6}));
  mapGraph.addLocation(Location('D', {'A': 4, 'B': 2, 'C': 1, 'E': 3}));
  mapGraph.addLocation(Location('E', {'A': 10, 'B': 7, 'C': 6, 'D': 3}));

  // Memulai solusi TSP dari lokasi 'A'
  var tspPath = mapGraph.solveTSP('A');

  // Cetak jalur TSP optimal (terpendek)
  print('Optimal TSP path: ${tspPath.join(' -> ')}');
}
