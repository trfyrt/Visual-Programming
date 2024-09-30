import 'package:lab_week2/4_LibrarySystem.dart';
import 'dart:io';

main(){
  Library library = Library();

  library.addBook(Book("Harry Potter", "J. K. Rowling", 1997));
  library.addBook(Book("Romeo and Juliet", "William Shakespeare", 1597));
  library.addBook(Book("1984", "George Orwell", 1949));
  library.addBook(Book("To Kill a Mockingbird", "Harper Lee", 1960));

  while(true){
    print("LIBRARY SYSTEM\n1. Add Book\n2. Remove Book\n3. Display Books\n4. Exit");
    stdout.write("Choose: ");
    var pilihan = stdin.readLineSync()!;

    switch(pilihan){
      case "1":{
        stdout.write("Title: ");
        var name = stdin.readLineSync()!;
        stdout.write("Author: ");
        var author = stdin.readLineSync()!;
        stdout.write("Year: ");
        var year = int.parse(stdin.readLineSync()!);

        Book book = Book(name, author, year);
        library.addBook(book);
      }
      case "2":{
        library.removeBook();
      }
      case "3":{
        library.displayBook();
      }
      case "4":{
        break;
      }
    }
  }
}