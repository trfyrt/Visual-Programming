import 'dart:io';
import 'dart:math';

class Node<T> {
  T? value;
  Node<T>? next;

  Node(this.value);
}

class LinkedList<T> {
  Node<T>? head; //Element pertama dalam list

  LinkedList();

  bool get isEmpty => head == null; //Mengecek apakah list kosong

  void add(T value) {
    final newNode = Node<T>(value);
    if (isEmpty) {
      //Kalo list kosong, buat newNode menjadi element pertama
      head = newNode;
    } else {
      var current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  void remove(T value) {
    if (isEmpty) return;

    if (head!.value == value) {
      //Jika value ada di depan, mengubah head menjadi elemen kedua
      head = head?.next;
      return;
    }

    var current = head;
    while (current!.next != null) {
      if (current.next!.value == value) {
        // If the value is found in the next node, skip the next node
        //Jika value didapatkan di node selanjutnya, node setelahnya akan diskip
        current.next = current.next?.next;
        return;
      }
      current = current.next;
    }
  }
}

Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

void moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H'); //Memindahkan cursor
}

getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines]; //Mendapatkan ukuran terminal, direturn dalam bentuk array
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H"); //Clear screen, set cursor ke 0;0
}

String randomColor(){
    List<String> colors = [
    '\x1B[31m', // Merah
    '\x1B[32m', // Hijau
    '\x1B[33m', // Kuning
    '\x1B[34m', // Biru
    '\x1B[35m', // Ungu
    '\x1B[36m', // Cyan
  ];
  Random random = Random();
  return colors[random.nextInt(colors.length)];
}

void main() async{
  final linkedList = new LinkedList<String>();

  stdout.write("Masukkan nama Anda: ");
  var nama = stdin.readLineSync(); //Input nama

  for (int i = 0; i< nama!.length; i++){
    linkedList.add(nama[i]); //Memasukkan ke dalam linked list huruf per huruf
  }
  var prevColor; //Deklarasi warna sebelumnya

  clearScreen();

  while(true){
  var color = randomColor(); //Mengambil warna random
  while (color == prevColor){ //Agar warna yang sama tidak mengulang
    color = randomColor();
  }
  var head = linkedList.head;
  var current = head; //Memulai dari element pertama dalam linked list


  for(int y = 1; y<= getScreenSize()[1]; y++){ //Mengulang jika baris belum habis
    if (y % 2 ==0){ //Jika baris genap
      for (int x = getScreenSize()[0]; x >=0; x--){ //Mulai dari kanan, maka x = screenSize yaitu di ujung kanan  
        moveTo(y, x); //Memindahkan cursor ke titik lokasi
        if (current == null){ //Jika element saat ini null maka akan diset dari awal lagi
          current = head;
        }
        stdout.write("$color${current!.value}");
        current = current.next; //Lanjut ke elemetn selanjutnya

        await delay(10);
      }
    } 
    else{
      for (int x = 1; x <=getScreenSize()[0]; x++){ //Mulai dari kiri, maka x = 1 yaitu di ujung kiri
        moveTo(y, x); //Memindahkan cursor ke titik lokasi
        if (current == null){ //Jika element saat ini null maka akan diset dari awal lagi
          current = head;
        }
        stdout.write("$color${current!.value}");
        current = current.next; //Lanjut ke elemetn selanjutnya

        await delay(10);
      }
    } 
    }
    prevColor = color; //Set previous color untuk dipakai mengecek nantinya
    }
    
  }