import "package:dart_application_1/bubblesort.dart";

pyramid(List<int> array, choicePyr) {
  if (choicePyr == "1"){
    array = bubbleSort(array); 
  }

  else{
    array.shuffle();
  }

  int height = array.length;
  int i = 0;
  
  while (i < height) {
    String spaces = ' ' * (height - i - 1);
    
    String numberLine = array.sublist(0, i + 1).join(' ');
    
    print(spaces + numberLine);
    
    i++;
  }
}