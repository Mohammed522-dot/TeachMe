class Materials {
  final int id;
  final String name;

  final String image;
  Materials({
    required this.id,
    required this.name,
    required this.image,
  });
  factory Materials.fromJson(Map<String, dynamic> json) {
    return Materials(
      id: json['id'] as int,
      name: json['MaterialName'] as String,
      image: json['image'] as String,

    );
  }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "MaterialName": name,
        "image": image,

      };
  @override
  String toString() {
    return '{ id: $id, MaterialName: $name,image: $image}';
  }
}