/*Sebuah pabrik mampu memproduksi 20 unit barang setiap jam. Jika pabrik beroperasi
selama 8 jam sehari, hitung berapa unit barang yang dihasilkan dalam satu minggu
(asumsi 5 hari kerja).*/

main(){
  var produksi = 20;
  var jamOperasi = 8;
  var satuMinggu = 5;

  var totalProduksi = produksi*jamOperasi*satuMinggu;
  print("Hasil unit yang diproduksi selama 5 hari kerja adalah: $totalProduksi");
}