// Jacob Alspaw
// EECS 392 - HW 2

import Foundation;


//part 1
struct DOB {
    var year: Int;
    var month: Int;
    var day: Int;
}

struct Student {
    var id: String;
    var name: String;
    var dob: DOB;
    
    var age: Int {
        get {
            let calendar = Calendar.current;
            let birth = calendar.date(from: DateComponents(year: dob.year, month: dob.month, day: dob.day))!;
            let today = Date();
            let ageComponents = calendar.dateComponents([.year], from: birth, to: today);
            return ageComponents.year!;
        }
    }
    
    func description() {
        print("Name: " + name + "\nAge: " + String(age) + "\n");
    }
}

let dob_1: DOB = DOB(year: 1996, month: 7, day: 11)
let student_1: Student = Student(id: "xxx1", name: "Jacob", dob: dob_1);
student_1.description();

let dob_2: DOB = DOB(year: 1996, month: 7, day: 20)
let student_2: Student = Student(id: "xxx2", name: "Aemilee", dob: dob_2);
student_2.description();

enum Color {
    case red, blue, white;
}



//part 2
class Vehicle {
    var model: String;
    var numDoors: Int;
    var numWheels: Int;
    var color: Color;
    
    init(model: String, numDoors: Int, numWheels: Int, color: Color) {
        self.model = model;
        self.numDoors = numDoors;
        self.numWheels = numWheels;
        self.color = color;
    }
    
    convenience init(model: String, color: Color) {
        self.init(model: model, numDoors: 4, numWheels: 4, color: color);
    }
}

class MotorVehicle: Vehicle {
    var licensePlate: String;
    
    init(model: String, numDoors: Int, numWheels: Int, color: Color, licensePlate: String) {
        self.licensePlate = licensePlate;
        super.init(model: model, numDoors: numDoors, numWheels: numWheels, color: color);
    }
}

class Bicycle: Vehicle {
    convenience init() {
        self.init(model: "", numDoors: 0, numWheels: 2, color: Color.red);
    }
}

class Car: MotorVehicle {
    convenience init(model: String, color: Color, licensePlate: String) {
        self.init(model: model, numDoors: 4, numWheels: 4, color: Color.red, licensePlate: licensePlate);
    }
}

