/*Create an Animal class with methods sound() and eat(). Implement two
classes Dog and Cat that follow the Animal behavior.*/

class Animal{
  void sound() => print("I'm Sounding!");
  void eat() => print("I'm Eating! ");
}

class Dog extends Animal{
  @override
  void sound() {
    print("Woof! Barf! Auuuuuugh! Pinjam dulu seratus");
  }
}

class Cat extends Animal{
  @override
  void sound() {
    print("Miaoo miaoo!");
  }
}