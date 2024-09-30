import 'dart:io';

import 'package:lab_week2/3_SimpleATM.dart';

main(){
  ATM account1 = ATM(0);
  while(true)
{  print("Choose method: \n1. Check Balance\n2. Deposit\n3. Withdraw\n4. Exit");
  stdout.write("Method: ");
  String pilihan = stdin.readLineSync()!;

  switch(pilihan){
    case "1":{
      account1.checkBalance();
    }
    case "2":{
      stdout.write("Enter the amount: ");
      int amount = int.parse(stdin.readLineSync()!);
      account1.deposit(amount);
    }
    case "3":{
      stdout.write("Enter the amount: ");
      int amount = int.parse(stdin.readLineSync()!);
      account1.withdraw(amount);
    }
    case "4":{
      break;
    }
  }}
}