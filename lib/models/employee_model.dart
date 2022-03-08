class Employee {
  String name;
  int salary = 0;
  int age = 0;
  bool _fav = false;

  Employee(this.name);

  Employee.full({this.name = "", this.salary = 0, this.age = 0});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee.full(
      name: json["employee_name"],
      salary: json["employee_salary"],
      age: json["employee_age"],
    );
  }

  isFav() {
    return this._fav;
  }

  toggleFav() {
    this._fav = !this._fav;
  }
}