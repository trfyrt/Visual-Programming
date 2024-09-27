/*Sebuah bank memiliki sistem antrian dengan dua loket. Nasabah akan dilayani secara
bergantian oleh dua loket ini berdasarkan urutan kedatangan. Jika nasabah A datang
pertama dan B datang kedua, maka nasabah A akan dilayani di loket 1, dan nasabah B
di loket 2. Jika ada nasabah C, dia akan dilayani di loket 1 setelah nasabah A selesai,
dan seterusnya. Simulasikan antrian untuk 5 nasabah, dan tampilkan urutan siapa
yang dilayani di loket mana!*/

main(){
  var antrian = ['A','B','C','D','E'];
  var loket1 = "";
  var loket2 = "";
  var i=0;

  while(i < antrian.length){
    var j = i%2;
    if(j==0){
      loket1 += antrian[i];
      loket1 += " ";
    }
    else{
      loket2 += antrian[i];
      loket2 += " ";
    }
    i++;
  }
  print("Antrian antara lain:");
  print("Loket 1: $loket1");
  print("Loket 2: $loket2");

}