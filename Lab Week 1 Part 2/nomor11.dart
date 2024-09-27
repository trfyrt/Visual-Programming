/*Sebuah smartphone menghabiskan baterai 1% setiap 5 menit saat digunakan untuk
aplikasi chatting, 2% setiap 5 menit saat digunakan untuk aplikasi video, dan 3%
setiap 5 menit saat bermain game. Jika baterai awal adalah 100%, tentukan sisa
baterai jika pengguna menggunakan 60 menit untuk chatting, 30 menit untuk
menonton video, dan 45 menit untuk bermain game!*/

main(){
  var chatting = 1;
  var video = 2;
  var game = 3;

  print("Pengguna menggunakan 60 menit untuk chatting, 30 menit untuk menonton video, dan 45 menit untuk bermain game!");

  var sisaBaterai = 100 - ((chatting * 60/5) + (video * 30/5) + (game * 45/5));
  print("Sisa baterai adalah: $sisaBaterai%");
}