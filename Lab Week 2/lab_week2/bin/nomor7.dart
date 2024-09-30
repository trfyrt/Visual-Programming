import 'package:lab_week2/7_Vehicle.dart';
import 'dart:io';

void main(){
  stdout.write("What vehicle to create (Car/Bike): ");
  var kendaraan = stdin.readLineSync()!.toLowerCase();
  stdout.write("Input the speed: ");
  var kecepatan = int.parse(stdin.readLineSync()!);

  String? elKecepatan;

  if(kecepatan > 60){
    elKecepatan = "fast";
  }
  else if(kecepatan < 30){
    elKecepatan = "slow";
  }
  else{
    elKecepatan = "normal";
  }

  switch(kendaraan){
    case "car":{
      Car car = Car();
      car.move(elKecepatan);
    }
    case "bike":{
      Bike bike = Bike();
      bike.move(elKecepatan);

    }
  }
}