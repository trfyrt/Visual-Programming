/*. Sebuah apartemen memiliki 3 mesin cuci. Setiap mesin cuci hanya dapat digunakan
selama 2 jam per hari. Terdapat 5 penghuni yang masing-masing ingin mencuci
pakaian selama 1.5 jam. Tentukan bagaimana penghuni apartemen tersebut dapat
menggunakan mesin cuci secara efisien dan berapa banyak penghuni yang dapat
mencuci di hari yang sama!*/

main(){
var jumlahMesinCuci = 3;
var penggunaanSehari = 2;
var maxPenggunaan = jumlahMesinCuci * penggunaanSehari;

var waktuMencuci = 1.5;

var maxPenghuniCuci = maxPenggunaan / waktuMencuci;

print("Max penggunaan dari semua mesin cuci: $maxPenggunaan jam");
print("Maximal penghuni yang bisa mencuci dalam satu hari: $maxPenghuniCuci orang");
}