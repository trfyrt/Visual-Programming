/*Create a Student class with attributes: name, studentID, and grade. Add a
method to display student information and another method to check if the
student passes (grade >= 70).*/

class Student {
  String? name;
  String? studentId;
  int? grade;

  Student(this.name, this.studentId, this.grade);

  void information(){
    print("Name: $name\nStudent ID: $studentId\nGrade: $grade");
  } 

  String passes(){
    if (grade != null && grade! >= 70){
      return "Passes";
    }
    else{
      return "Not Pass";
    }
  }
}

