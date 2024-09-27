/*Sebuah perusahaan memberikan gaji pokok sebesar Rp 4.000.000 dan bonus sebesar
Rp 200.000 jika karyawan bekerja lebih dari 40 jam per minggu. Buatlah program
yang menghitung gaji total berdasarkan input jumlah jam kerja per minggu.*/

import 'dart:io';

main(){
  var gajiPokok = 4000000;
  var bonus = 200000;

  stdout.write("Input jumlah jam kerja per minggu: ");
  var jam = int.parse(stdin.readLineSync()!);

  if(jam>40){
    gajiPokok += bonus;
  }

  print("Gaji yang diterima: $gajiPokok");
}