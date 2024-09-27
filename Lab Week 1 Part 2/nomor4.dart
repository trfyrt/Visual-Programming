/*Sebuah perusahaan pengiriman barang memerlukan program untuk mengonversi suhu
dari skala Celsius ke Fahrenheit. Rumus konversi adalah:
𝐹 = 9/5 × 𝐶 + 32
Buatlah program yang meminta input suhu dalam Celsius, lalu menampilkan hasil
konversi ke Fahrenheit!*/

import 'dart:io';

main(){
  stdout.write("Masukkan suhu dalam Celsius: ");
  var C = int.parse(stdin.readLineSync()!);
  var F = 9/5 * C +32;

  print("Hasil konversi ke Fahrenheit: $F");
}