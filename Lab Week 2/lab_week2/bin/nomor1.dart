import 'package:lab_week2/1_StudentClass.dart';

main(){
  Student student1 = Student("Bruno Mars", "0806022310100", 100);
  Student student2 = Student("John Lennon", "0806022310101", 60);

  student1.information();
  print(student1.passes());
  print("");
  student2.information();
  print(student2.passes());
}