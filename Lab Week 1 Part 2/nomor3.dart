/*Di sebuah kebun, ada beberapa area berbentuk lingkaran dengan diameter yang
berbeda-beda. Buatlah program yang meminta input diameter lingkaran, kemudian
menggunakan nilai pi (π ≈ 3.14) untuk menghitung dan menampilkan luas lingkaran!*/

import 'dart:io';

main(){
  const pi = 3.14;

  stdout.write("Masukkan diameter lingkaran: ");
  var diameter = int.parse(stdin.readLineSync()!);

  var r = diameter/2;
  var luasLingkaran = pi*r*r;

  print("Luas lingkaran: $luasLingkaran");
}