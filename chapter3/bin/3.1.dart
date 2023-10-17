// Contoh JSON
import 'dart:convert';

String jsonString = """
{
   "name": "Alex",
   "age": 24,
   "city": "Bogor"
}
""";

//TODO: Buatlah model Customer dari jsonString di atas!
class Customer {
  String name;
  int age;
  String city;

  Customer({required this.name, required this.age, required this.city});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: json['name'] as String,
      age: json['age'] as int,
      city: json['city'] as String,
    );
  }
}

void main() {
  // Setelah membuat model-nya, uncomment kode ini
  // Jalankan script dengan perintah:
  // dart bin/3.1.dart
  Customer customer = Customer.fromJson(jsonDecode(jsonString));
  print(customer.name);
  print(customer.age);
  print(customer.city);

  List<bool> conditions = [
    customer.name == "Alex",
    customer.age == 24,
    customer.city == "Bogor",
  ];

  if (conditions.contains(false)) {
    print("Failed test");
    return;
  }
  print("Correct answer!");
}
