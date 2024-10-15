import 'dart:io';
import 'dart:math';
import 'dart:async';

// Kelas Point untuk merepresentasikan titik pada peta
class Point {
  int x, y; // Koordinat x dan y
  Point(this.x, this.y); // Konstruktor untuk menginisialisasi titik
}

// Kelas Cicak untuk merepresentasikan karakter cicak dalam permainan
class Cicak {
  List<Point> badan;  // Daftar segmen tubuh cicak, setiap segmen direpresentasikan sebagai Point
  String arah;       // Arah gerakan cicak (atas, bawah, kiri, kanan)
  int panjangBadan;  // Panjang tubuh cicak, berapa banyak segmen yang dimiliki

  // Konstruktor untuk menginisialisasi atribut cicak
  Cicak(Point start) 
      : badan = [start], // Memulai cicak dengan satu segmen di titik awal
        arah = 'kanan', // Arah awal cicak
        panjangBadan = 1; // Panjang awal tubuh cicak

  // Metode untuk menggerakkan cicak menuju makanan
  void gerak(Point makanan) {
    Point kepala = badan[0]; // Mengambil posisi kepala cicak (segmen pertama)
    Point kepalaBaru; // Variabel untuk menyimpan posisi baru kepala cicak

    // Mengecek apakah cicak perlu bergerak secara vertikal atau horizontal
    if (kepala.y != makanan.y) {
      // Jika y kepala cicak berbeda dengan y makanan, maka gerak vertikal
      kepalaBaru = Point(kepala.x, kepala.y + (makanan.y > kepala.y ? 1 : -1)); // Menambah atau mengurangi y
      arah = makanan.y > kepala.y ? 'bawah' : 'atas'; // Mengatur arah
    } else if (kepala.x != makanan.x) {
      // Jika x kepala cicak berbeda dengan x makanan, maka gerak horizontal
      kepalaBaru = Point(kepala.x + (makanan.x > kepala.x ? 1 : -1), kepala.y); // Menambah atau mengurangi x
      arah = makanan.x > kepala.x ? 'kanan' : 'kiri'; // Mengatur arah
    } else {
      kepalaBaru = Point(kepala.x, kepala.y); // Jika tidak ada pergerakan, posisi tetap
    }

    // Memasukkan posisi baru kepala ke daftar badan
    badan.insert(0, kepalaBaru);
    // Menghapus segmen terakhir jika panjang badan melebihi batas
    if (badan.length > panjangBadan) {
      badan.removeLast(); // Menghapus segmen terakhir untuk menjaga panjang
    }
  }

  // Metode untuk menghasilkan bentuk cicak berdasarkan arah
  List<String> bentuk() {
    if (arah == 'atas' || arah == 'bawah') {
      // Jika arah vertikal
      return [
        '  *  ',
        '*****',
        '  *  ',
        for (int i = 0; i < panjangBadan - 1; i++) '  *  ', // Segmen badan tambahan
        '*****',
        '  *  '
      ];
    } else {
      // Jika arah horizontal
      String barisTengah = '*${'*' * (panjangBadan + 2)}*'; // Membuat baris tengah untuk badan
      return [
        ' *${''.padRight(panjangBadan)}* ', // Baris kosong di atas
        barisTengah, // Baris tengah
        ' *${''.padRight(panjangBadan)}* ' // Baris kosong di bawah
      ];
    }
  }

  // Metode untuk menambah panjang badan cicak
  void tambahBadan() {
    panjangBadan++; // Menambah panjang badan cicak
  }
}

// Kelas Game untuk mengelola logika permainan
class Game {
  int lebar = 80, tinggi = 24; // Ukuran peta permainan
  late Cicak cicak;            // Instance cicak
  late Point makanan;          // Lokasi makanan
  Random rand = Random();      // Objek untuk menghasilkan angka acak
  List<List<String>> peta = []; // Peta permainan yang merupakan daftar 2D

  // Konstruktor untuk menginisialisasi permainan
  Game() {
    ukuran(); // Memperbarui ukuran terminal untuk peta
    cicak = Cicak(Point(lebar ~/ 2, tinggi ~/ 2)); // Membuat cicak di tengah peta
    buatMakanan(); // Membuat makanan di lokasi acak
  }

  // Metode untuk mengatur ukuran peta permainan berdasarkan terminal
  void ukuran() {
    if (stdout.hasTerminal) {
      lebar = stdout.terminalColumns - 1; // Mengatur lebar berdasarkan kolom terminal
      tinggi = stdout.terminalLines - 1; // Mengatur tinggi berdasarkan baris terminal
    }
    // Membuat peta kosong
    peta = List.generate(tinggi, (_) => List.filled(lebar, ' '));
  }

  // Metode untuk membuat makanan di lokasi acak
  void buatMakanan() {
    do {
      // Menghasilkan koordinat acak untuk makanan
      makanan = Point(rand.nextInt(lebar - 2) + 1, rand.nextInt(tinggi - 2) + 1);
    } while (cicak.badan.any((part) => part.x == makanan.x && part.y == makanan.y)); // Memastikan makanan tidak muncul di atas cicak
  }

  // Metode untuk memperbarui posisi cicak dan logika permainan
  void update() {
    cicak.gerak(makanan); // Menggerakkan cicak menuju makanan
    // Mengecek apakah cicak telah makan makanan
    if (cicak.badan[0].x == makanan.x && cicak.badan[0].y == makanan.y) {
      cicak.tambahBadan(); // Menambah panjang badan cicak jika makanan dimakan
      buatMakanan(); // Membuat makanan baru
    }

    // Menangani pembungkus peta untuk cicak
    for (var part in cicak.badan) {
      part.x = (part.x + lebar) % lebar; // Mengatur posisi x cicak
      part.y = (part.y + tinggi) % tinggi; // Mengatur posisi y cicak
    }

    // Mengecek jika kepala cicak berada di tepi peta
    Point kepala = cicak.badan[0]; // Mengambil posisi kepala cicak
    if (kepala.x == 0 || kepala.x == lebar - 1 || kepala.y == 0 || kepala.y == tinggi - 1) {
      cicak.arah = 'kanan';  // Mengatur arah cicak untuk sementara jika keluar dari peta
    }
  }

  // Metode untuk merender peta permainan ke terminal
  void render() {
    // Mengosongkan peta
    for (var row in peta) {
      row.fillRange(0, lebar, ' '); // Mengisi peta dengan spasi
    }

    peta[makanan.y][makanan.x] = '&'; // Menggambar makanan pada peta

    List<String> bentukCicak = cicak.bentuk(); // Mendapatkan bentuk cicak
    Point kepala = cicak.badan[0]; // Mendapatkan posisi kepala cicak
    int offsetX = cicak.arah == 'kiri' || cicak.arah == 'kanan' ? bentukCicak[0].length ~/ 2 : 2; // Offset untuk posisi x
    int offsetY = cicak.arah == 'atas' || cicak.arah == 'bawah' ? bentukCicak.length ~/ 2 : 1; // Offset untuk posisi y

    // Menggambar cicak pada peta
    for (int dy = 0; dy < bentukCicak.length; dy++) {
      for (int dx = 0; dx < bentukCicak[dy].length; dx++) {
        int x = (kepala.x + dx - offsetX + lebar) % lebar; // Mengatur posisi x segmen cicak
        int y = (kepala.y + dy - offsetY + tinggi) % tinggi; // Mengatur posisi y segmen cicak
        if (bentukCicak[dy][dx] != ' ') {
          peta[y][x] = bentukCicak[dy][dx]; // Menggambar segmen cicak pada peta
        }
      }
    }

    stdout.write('\x1B[H'); // Menghapus layar terminal
    for (var row in peta) {
      stdout.writeln(row.join()); // Menampilkan peta di terminal
    }

    stdout.flush(); // Menyegarkan tampilan terminal
  }
}

// Fungsi utama untuk menjalankan permainan
void main() async {
  Game game = Game(); // Membuat instance game baru

  // Loop utama permainan
  while (true) {
    game.update(); // Memperbarui posisi cicak dan logika permainan
    game.render(); // Merender peta ke terminal
    await Future.delayed(Duration(milliseconds: 100)); // Menunggu sebelum memperbarui lagi
  }
}
