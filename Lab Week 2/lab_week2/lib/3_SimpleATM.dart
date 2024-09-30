/*Create an ATM class with methods to deposit money, withdraw money, and
check balance. Use encapsulation to protect the balance.*/

class ATM{
  double _balance = 0;
  double get getBalance => _balance;

  set balance(double balance){
    _balance = balance;
  }

  ATM(this._balance);

  void deposit(int amount){
    if (amount >= 50000){
      _balance += amount;
      print("Balance updated! +$amount");
    }
    else{
      print("Balance update failed! Minimum Deposit 50000");
    }
  }

  void withdraw(int amount){
    if (_balance > 0 && amount <=_balance && amount >= 50000){
      _balance -= amount;
      print("Balance updated! -$amount");
    }
    else if(_balance > 0 && amount <_balance){
      print("Balance update failed! Insufficient Money");
    }
    else{
      print("Balance update failed! Minimum Withdraw 50000");
    }
  }

  void checkBalance(){
    print("Your balance: $_balance");
  }
}