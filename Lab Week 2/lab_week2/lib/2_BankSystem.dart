/*Create a BankAccount class with a private attribute _balance. Add methods to
deposit, withdraw, and checkBalance. Create a subclass SavingsAccount that
inherits BankAccount and adds a method to apply interest.*/

class BankAccount{
  double _balance = 0;

  BankAccount(this._balance);

  void deposit(int amount){
    if (amount >= 50000){
      _balance += amount;
      print("Balance updated! +$amount");
    }
    else{
      print("Balance update failed!");
    }
  }

  void withdraw(int amount){
    if (_balance > 0 && amount <=_balance && amount >= 50000){
      _balance -= amount;
      print("Balance updated! -$amount");
    }
    else{
      print("Balance update failed!");
    }
  }

  void checkBalance(){
    print("Your balance: $_balance");
  }
}

class SavingsAccount extends BankAccount{
  SavingsAccount(double balance) : super(balance);

  void interest(){
    _balance += _balance*0.01;
    print("1 % Interest Applied, Your balance: $_balance");
  }
}