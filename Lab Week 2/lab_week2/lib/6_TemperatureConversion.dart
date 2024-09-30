/*Create a program that calculates the conversion of temperature from Celsius
to Reaumur, Fahrenheit, or Kelvin. The input should be the Celsius
temperature, and the user has the option to choose between converting to
Reaumur, Fahrenheit, or Kelvin.*/

class Temperature{
  double temp = 0;

  Temperature(this.temp);

  void reaumure(double temp){
    var reaumureTemp = temp * 4/5;
    print(reaumureTemp);
  }
  void fahrenheit(double temp){
    var fahrenheitTemp = (temp * 9/5) + 32;
    print(fahrenheitTemp);
  }
  void kelvin(double temp){
    var kelvinTemp = temp + 273.15;
    print(kelvinTemp);
  }
}