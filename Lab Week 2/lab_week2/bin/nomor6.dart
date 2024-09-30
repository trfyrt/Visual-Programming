import 'package:lab_week2/6_TemperatureConversion.dart';
import 'dart:io';

void main(){
  stdout.write("Input temperature: ");
  var temp = double.parse(stdin.readLineSync()!);
  Temperature temperature = Temperature(temp);

  print("Available Scale:\n1. Reaumure\n2. Fahrenheit\n3. Kelvin");
  stdout.write("Choose scale to convert to: ");
  var pilihan = stdin.readLineSync()!;

  switch(pilihan){
    case "1":{
      temperature.reaumure(temp);
    }
    case "2":{
      temperature.fahrenheit(temp);
    }
    case "3":{
      temperature.kelvin(temp);
    }
  }
}