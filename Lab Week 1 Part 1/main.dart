import 'dart:math';
import 'dart:io';
import 'pyramid.dart';

import "bubblesort.dart";

main(){
Stopwatch waktu =Stopwatch();

// INTRO
print('''${"="*24}
   APLIKASI GACOR 2.0   
${"="*24}''');
stdout.write("Masukkan angka: ");
int input = int.parse(stdin.readLineSync()!);
List<int> array = [];
var rand = Random();

// BUAT ANGKA RANDOM
var i = 0;
while (i++<input){
  var random = rand.nextInt(100);
  array.add(random);
}
print("Output: ${array.join(", ")}");

// PILIHAN 
print("Pilihan:\n1. Bubble Sort\n2. Inversi\n3. Shuffle");
stdout.write("Masukkan angka pilihan: ");
var pilihan = stdin.readLineSync();

// SWITCH CASE PILIHAN
switch(pilihan) {
  case ("1"):{
    print('''${"="*24}
      HASIL SORTIR      
${"="*24}''');
    waktu.start();
    List<int> sortedArray = bubbleSort(array);
    print("Output: ${sortedArray.join(", ")}");
    waktu.stop();
    print("Waktu Eksekusi ${waktu.elapsedMilliseconds} ms");
  }


  case ("2"):{
    print('''${"="*24}
      HASIL INVERSI      
${"="*24}''');
    waktu.start();
    print("Output: ${array.reversed.toList().join(", ")}");
    waktu.stop();
    print("Waktu Eksekusi ${waktu.elapsedMilliseconds} ms");
  }


  case ("3"):{
    print('''${"="*24}
      HASIL SHUFFLE      
${"="*24}''');
    waktu.start();
    array.shuffle();
    print("Output: ${array.join(", ")}");
    waktu.stop();
    print("Waktu Eksekusi ${waktu.elapsedMilliseconds} ms");
  }
  default:
}

// MEMBUAT PYRAMID
print('''${"="*24}
 MESIN PEMBUAT PYRAMID      
${"="*24}
Jenis pyramid: 
1. Pyramid angka terurut
2. Pyramid angka teracak''');
stdout.write("Pilih jenis pyramid:");
var choicePyr = stdin.readLineSync();
pyramid(array, choicePyr);
}
