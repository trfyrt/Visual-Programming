/*Create a Vehicle class with attributes name and speed. Implement two
subclasses Car and Bike that inherit from Vehicle. Each subclass should
override a method move() that describes how the vehicle moves (e.g., "The
car moves fast on roads" and "The bike moves swiftly through traffic").
Additionally, ask the user to input whether they want to create a Car or Bike,
then create an instance based on their input and call the move() method.*/

class Vehicle{
  String? name;
  int? speed;

  void move(String elKecepatan){
    print("Vehicle is moving on $elKecepatan pace!");
  }
}

class Car extends Vehicle{
  @override
  void move(String elKecepatan){
    print("The car moves $elKecepatan on roads" );
  }
}

class Bike extends Vehicle{
  @override
  void move(String elKecepatan){
    print("The bike moves $elKecepatan through traffic");
  }
}