class Materials {
  final int id;
  final String name;
  // final String image;
  Materials({
    required this.id,
    required this.name,
    // required this.image,
  });
  factory Materials.fromJson(Map<String, dynamic> json) {
    return Materials(
      id: json['_id'] as int,
      name: json['materialName'] as String,
      // image: json['image'] as String,

    );
  }

  Map<String, dynamic> toJson() =>
      {
        "_id": id,
        "materialName": name,
        // "image": image,

      };
  @override
  String toString() {
    return '{_id: $id, materialName: $name}';
  }
}