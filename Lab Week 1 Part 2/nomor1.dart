/*Di sebuah toko buah, harga apel adalah Rp 5.000 per kilogram, dan harga jeruk adalah
Rp 4.000 per kilogram. Budi membeli 2 kilogram apel dan 3 kilogram jeruk. Buatlah
program yang meminta input jumlah kilogram apel dan jeruk yang dibeli, kemudian
menampilkan total harga yang harus dibayar! */

import 'dart:io';

main(){
  int apel = 5000;
  int jeruk = 4000;

  stdout.write("Masukkan jumlah kilogram apel yang ingin dibeli: ");
  int jumlahApel = int.parse(stdin.readLineSync()!);
  stdout.write("Masukkan jumlah kilogram jeruk yang ingin dibeli: ");
  int jumlahJeruk = int.parse(stdin.readLineSync()!);

  int totalHarga = (jumlahApel * apel) + (jumlahJeruk * jeruk);
  print("Total harga yang harus dibayar adalah: $totalHarga");
}
