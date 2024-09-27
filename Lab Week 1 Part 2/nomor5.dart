/*Sebuah tempat parkir mengenakan taref Rp 2.000 per jam untuk 2 jam pertama dan Rp
1.000 untuk setiap jam berikutnya. Buatlah program yang meminta input jumlah jam
parkir, lalu menghitung total biaya parkir*/

import 'dart:io';

main(){
  var totalBiaya = 0;
  stdout.write("Masukkan jumlah jam: ");
  var jam = int.parse(stdin.readLineSync()!);
  var i = 0;

  while(i++ < jam){
    if(i <=2){
      totalBiaya += 2000;
    }
    else{
      totalBiaya += 1000;
    }
  }
  print("Total biaya parkirnya adalah: $totalBiaya");
}
