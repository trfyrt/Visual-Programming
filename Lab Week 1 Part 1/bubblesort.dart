import "bubblesort2.dart";

bubbleSort(List<int>array){
  int lengthOfArray = array.length;
  var i=0;
  var j=0;
    while (i < lengthOfArray - 1){
      bubbleSort2(lengthOfArray, i, j, array);
      i++;
    }
      return (array);
}