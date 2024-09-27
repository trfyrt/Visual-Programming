bubbleSort2(lengthOfArray, i, j, array){
      while (j < lengthOfArray - i - 1){
      if (array[j] > array[j + 1]) {
        // Swapping using temporary variable
        int temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;

      }
      j++;
}
}