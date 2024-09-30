/*Create a Book class with attributes title, author, and year. Then create a
Library class that contains a list of books. Add methods to addBook(),
removeBook(), and displayBooks().*/

import 'dart:io';

class Book{
  String? title;
  String? author;
  int? year;

  Book(this.title, this.author, this.year);
}

class Library{
  List<Book> books =[];

  void addBook(Book book){
    books.add(book);
    print("Book Added!");
  }
  void removeBook(){
    displayBook();
    stdout.write("Choose book(number): ");
    var index = int.parse(stdin.readLineSync()!) - 1;
    books.removeAt(index);
    print("Book Removed!");
  }
void displayBook() {
    var i = 1;
    while (i <= books.length) {
      var book = books[i-1];
      print('$i. Title: ${book.title}, Author: ${book.author}, Year: ${book.year}');
      i++;
    }
  }
}