import 'package:lab_week2/2_BankSystem.dart';
import 'dart:io';

main(){
  SavingsAccount account1 = SavingsAccount(0);
  while(1 ==1)
{  print("Choose method: \n1. Check Balance\n2. Deposit\n3. Withdraw\n4. Apply Interest\n5. Exit");
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
      account1.interest();
    }
    case "5":{
      break;
    }
  }}
}