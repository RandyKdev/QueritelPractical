class Pet {
  final String name;
  final String photo;
  final String description;
  final int age;
  final num weight;

  Pet({
    required this.age,
    required this.description,
    required this.name,
    required this.photo,
    required this.weight,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      age: json['age'],
      description: json['description'],
      name: json['name'],
      photo: json['photo'],
      weight: json['weight'],
    );
  }
}
