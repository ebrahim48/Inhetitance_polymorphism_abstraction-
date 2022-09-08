import 'package:inheritanc_polymorphism/inheritanc_polymorphism.dart' as inheritanc_polymorphism;


void main(){
  final seip = SeipStudent(stipned: 1000, name: 'ABC', courseName: 'Android');
  final paid = PaidStudent(courseFee: 6000, name:'DEF', courseName: 'Flutter');
  final paidIntern= PaidInternStudent(salry: 5000, name: 'GHI', courseName: 'DotNet', courseFee: 7000);
  print(seip.getInfo());
  print(paid.getInfo());

  List<Student> studentList = [seip, paid, paidIntern];
  for(var student in studentList) {
    print(student.getInfo());
  }
  
}
abstract class Student{
  String name;
  String courseName;

  Student(
      {required this.name,
        required this.courseName});

  String getInfo();
  void something(){

}
}

class SeipStudent extends Student {
  double stipned;
  double salry = 5000;

  SeipStudent({
    required this.stipned,
    required String name,
    required String courseName}) : super(name: name, courseName:courseName);

  @override
  String getInfo() => '$name $courseName $stipned';
}

class PaidStudent extends Student with FoodAllowence,TransportAllowence {
  double courseFee;
  @override
  PaidStudent({
    required this.courseFee,
    required String name,
    required String courseName}) : super(name: name, courseName: courseName);
  @override
  String getInfo() => '$name $courseName $courseFee';

}

class PaidInternStudent extends PaidStudent{
  double foodAllownce = 50;
  double salry = 5000;

  PaidInternStudent(
      {required this.salry,
        required String name,
        required String courseName,
        required double courseFee}) : super(name: name, courseName: courseName, courseFee: courseFee);
}

class FoodAllowence {
  double foodAmount = 50;
}

class TransportAllowence{
  double txAmount = 100;
}
