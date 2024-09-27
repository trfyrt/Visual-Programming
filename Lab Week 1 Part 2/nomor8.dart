/*Sebuah keluarga menggunakan berbagai alat listrik seperti AC, TV, dan lampu.
Diketahui bahwa:
• AC mengonsumsi 1.5 kWh per jam
• TV mengonsumsi 0.2 kWh per jam
• Lampu mengonsumsi 0.1 kWh per jam
Keluarga tersebut menggunakan AC selama 8 jam, TV selama 5 jam, dan lampu
selama 12 jam sehari. Buatlah solusi untuk menghitung total konsumsi energi harian
keluarga tersebut.*/

main(){
  var ac = 1.5;
  var tv = 0.2;
  var lampu = 0.1;

  var jamAc = 8;
  var jamTv = 5;
  var jamLampu = 12;

  print('''• AC mengonsumsi 1.5 kWh per jam
• TV mengonsumsi 0.2 kWh per jam
• Lampu mengonsumsi 0.1 kWh per jam
• AC selama 8 jam, TV selama 5 jam, dan lampu selama 12 jam sehari.''');

  var totalEnergi = (ac*jamAc) + (tv*jamTv) + (lampu*jamLampu);
  print("Total konsumsi energi harian keluarga tersebut adalah: $totalEnergi");
}